package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.utility.DBClose;
import net.utility.DBOpen;
import net.utility.Utility;

public class PdsDAO {

	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public PdsDAO() {
		dbopen = new DBOpen();
	} // end
	
	
	public int create(PdsDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" insert into tb_pds (pdsno, wname, subject, passwd, filename, filesize, regdate) ");
			sql.append(" values (pds_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) { 
			System.out.println("추가 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	} // create() end
	
	public ArrayList<PdsDTO> list() {
		ArrayList<PdsDTO> list = null;
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" SELECT pdsno, wname, subject, filename, readcnt, regdate ");
			sql.append(" FROM tb_pds ");
			sql.append(" ORDER BY regdate DESC ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<PdsDTO>();
				do {
					PdsDTO dto = new PdsDTO(); // 한줄 담기
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setFilename(rs.getString("filename"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdate(rs.getString("regdate"));
					list.add(dto); // list에 모으기
				} while (rs.next());
			} // if end
					
		} catch (Exception e) {
			System.out.println("목록 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}	
		return list;
	} // list() end
	
	public PdsDTO read(int pdsno) {
		PdsDTO dto = null;
		
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" select pdsno, wname, subject, readcnt, regdate, filename, filesize ");
			sql.append(" from tb_pds ");
			sql.append(" where pdsno = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new PdsDTO();
				dto.setPdsno(rs.getInt("pdsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getLong("filesize"));
			}
			
			
		} catch (Exception e) {
			System.out.println("상세 보기 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		return dto;
	} // read() end
	
	public void incrementCnt(int pdsno) {
		PdsDTO dto = null;
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" UPDATE tb_pds ");
			sql.append(" SET readcnt = readcnt+1 ");
			sql.append(" WHERE pdsno = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("조회 수 증가 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		
	} // incrementCnt() end
	
	
	public int delete(int pdsno, String passwd, String saveDir) {
		// saveDir : 스토리지의 물리적인 경로
		int cnt = 0;
		try {
			// 테이블의 행을 삭제하기 전에 삭제하고자하는 파일명을 가져온다
			// read()를 이용하면 filename을 가져올 수 있다
			String filename = "";
			PdsDTO oldDTO = read(pdsno);
			if (oldDTO != null) {
				filename = oldDTO.getFilename();
			} // if end
			
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_pds ");
			sql.append(" WHERE pdsno = ? AND passwd = ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.setString(2, passwd);
			 
			cnt = pstmt.executeUpdate();
			
			if(cnt == 1) { // 테이블에서 행삭제가 성공했으므로, 첨부했던 파일도 삭제
				Utility.deleteFile(saveDir, filename);
				// 리턴값이 boolean. 이용해도 되고 안 해도 되지만 이번엔 안 할 예정
			} // if end
			
		} catch (Exception e) {
			System.out.println("삭제 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		
		return cnt;
	} // delete() end
	
	public int update(PdsDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			
			sql.append(" UPDATE tb_pds ");
			sql.append(" set wname=?, subject=?, passwd = ?, filename=?, filesize=? ");
			sql.append(" WHERE pdsno = ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			pstmt.setInt(6, dto.getPdsno());
			 
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("삭제 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		
		
		return cnt;
	} // update() end

} // class end