package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO { // 데이터베이스 관련 작업
	
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public BbsDAO() {
		dbopen = new DBOpen();
	} // end
	
	public int create (BbsDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection(); // db 연결
			sql = new StringBuilder();
			sql.append(" insert into tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno) ");
			sql.append(" values (bbs_seq.nextval, ?, ?, ?, ?, ?, (select nvl(max(bbsno), 0)+1 from tb_bbs)) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("추가 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}
	
	
	public ArrayList<BbsDTO> list() {
		ArrayList<BbsDTO> list = null;
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" select bbsno, wname, subject, readcnt, regdt, indent "
					+ "from tb_bbs "
					+ "order by grpno desc, ansnum asc ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					BbsDTO dto = new BbsDTO(); // 한줄 담기
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIndent(rs.getInt("indent"));
					list.add(dto); // list에 모으기
				} while (rs.next());
			} // if end
					
		} catch (Exception e) {
			System.out.println("전체목록 조회 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	} // list() end
	
	public int count() {
		int cnt = 0;
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" select count(*) as cnt ");
			sql.append(" from tb_bbs ");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end
			
		} catch (Exception e) {
			System.out.println("글 갯수 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return cnt;
	} // count() end
	
	
	public BbsDTO read(int bbsno) {
		BbsDTO dto = null;
		
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" select bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum ");
			sql.append(" from tb_bbs ");
			sql.append(" where bbsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setIp(rs.getString("ip"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			} // end
			
		} catch (Exception e) {
			System.out.println("글 갯수 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		
		return dto;
	} // read() end
	
	public void incrementCnt(int bbsno) {
		BbsDTO dto = null;
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET readcnt = readcnt+1 ");
			sql.append(" WHERE bbsno=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("조회 수 증가 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
			
	} // incrementCnt() end
	
	
	public int delete(BbsDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" DELETE FROM tb_bbs ");
			sql.append(" WHERE bbsno=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());
			cnt = pstmt.executeUpdate();	// 실행했을 때 행의 갯수가 반환
			
		} catch (Exception e) {
			System.out.println("삭제 실패 : "+ e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return cnt;
	} // delete() end
	
	public int update(BbsDTO dto) {
		int cnt=0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" update tb_bbs set wname=?, subject=?, content=? ");
			sql.append(" where bbsno=? AND passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBbsno());
			pstmt.setString(5, dto.getPasswd());
			cnt = pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("삭제 실패 : "+ e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
			
		return cnt;
	}
}
