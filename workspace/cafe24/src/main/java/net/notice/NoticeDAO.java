package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.pds.PdsDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public NoticeDAO() {
		dbopen = new DBOpen();
	} // end
	
	public int create(NoticeDTO dto) {
		int cnt = 0;
		
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" INSERT INTO notice (subject, content, regdt) ");
			sql.append(" VALUES (?, ?, now()) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("추가 실패"+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		
		return cnt;
	} // create() end
	
	
	public NoticeDTO read(int noticeno) {
		NoticeDTO dto = null;
		
		try {
			con = dbopen.getConnection(); // db 연결
			
			sql = new StringBuilder();
			sql.append(" select noticeno, subject, subject, content, regdt ");
			sql.append(" from notice ");
			sql.append(" where noticeno = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdt(rs.getString("regdt"));
			} // if end
			
			
		} catch (Exception e) {
			System.out.println("상세 보기 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	} // read() end
	
	public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage) {
	      ArrayList<BbsDTO> list = null;
	      
	      // 페이지당 출력할 행의 갯수 (10개월 기준)
	      // 1 페이지 : WHERE r >= 1 AND r <= 10;
	      // 2 페이지 : WHERE r >= 11 AND r <= 20;
	      // 3 페이지 : WHERE r >= 21 AND r <= 30;
	      
	      int startRow = ((nowPage-1) * recordPerPage) + 1;
	      int endRow = nowPage * recordPerPage;
	      
	      try {
	         con = dbopen.getConnection();
	         sql = new StringBuilder();
	         
	         word = word.trim(); //검색어 좌우 공백 제거
	         
	         
	         if(word.length()==0) { //검색하지 않는 경우 -> 6)
	            sql.append(" SELECT * ");
	            sql.append(" FROM ( ");
	            sql.append("       SELECT bbsno, subject, wname, readcnt, indent, regdt, secretp, rownum as r ");
	            sql.append("       FROM ( ");
	            sql.append("             SELECT bbsno, subject, wname, readcnt, indent, regdt, secretp ");
	            sql.append("             FROM tb_bbs ");
	            sql.append("             ORDER BY grpno DESC, ansnum ASC ");
	            sql.append("          ) ");
	            sql.append("       ) ");
	            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow);
	         } else { //검색하는 경우 -> 7)
	            sql.append(" SELECT * ");
	            sql.append(" FROM ( ");
	            sql.append("       SELECT bbsno, subject, wname, readcnt, indent, regdt, secretp, rownum as r ");
	            sql.append("       FROM ( ");
	            sql.append("             SELECT bbsno, subject, wname, readcnt, indent, regdt, secretp ");
	            sql.append("             FROM tb_bbs ");
	            
	            String search = "";
	            if(col.equals("subject_content")) {
	               search += " WHERE subject LIKE '%" + word + "%' ";
	               search += " OR content LIKE '%" + word + "%' ";
	            } else if(col.equals("subject")) {
	               search += " WHERE subject LIKE '%" + word + "%' ";
	            } else if(col.equals("content")) {
	               search += " WHERE content LIKE '%" + word + "%' ";
	            } else if(col.equals("wname")) {
	               search += " WHERE wname LIKE '%" + word + "%' ";
	            }//if end
	            sql.append(search);
	            
	            sql.append("             ORDER BY grpno DESC, ansnum ASC ");
	            sql.append("          ) ");
	            sql.append("       ) ");
	            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow);
	         }//if end
	         
	         
	         pstmt = con.prepareStatement(sql.toString());
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            list = new ArrayList<>();
	            do {
	               BbsDTO dto = new BbsDTO(); //한줄담기
	               dto.setBbsno(rs.getInt("bbsno"));
	               dto.setWname(rs.getString("wname"));
	               dto.setSubject(rs.getString("subject"));
	               dto.setReadcnt(rs.getInt("readcnt"));
	               dto.setRegdt(rs.getString("regdt"));
	               dto.setIndent(rs.getInt("indent"));
	               dto.setSecretp(rs.getString("secretp"));
	               list.add(dto); //list 저장
	            } while(rs.next());
	         }//if end         
	         
	      } catch (Exception e) {
	         System.out.println("전체목록실패:" + e);
	      } finally {
	         DBClose.close(con, pstmt, rs);
	      }//end
	      return list;
	   } //list3() end
	
} // class end
