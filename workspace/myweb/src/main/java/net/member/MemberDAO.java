package net.member;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import net.utility.*;

public class MemberDAO { // Data Access Object
						 // DB 접근 객체
	
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public MemberDAO() {
		dbopen = new DBOpen();
	} // end
	
	// 비지니스 로직 구현
	public String loginProc(MemberDTO dto) {
		String mlevel = null;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT mlevel FROM member ");
			sql.append(" WHERE id=? and passwd=? ");
			sql.append(" AND mlevel in ('A1', 'B1', 'C1', 'D1') ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mlevel = rs.getString("mlevel");
			} // if end
			
		} catch (Exception e) {
			System.out.println("로그인 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return mlevel;
	} // loginProc() end
	
	
	public int duplecateID(String id) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT COUNT(id) as cnt ");	
			sql.append(" FROM member ");	
			sql.append(" WHERE id = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end
			
		} catch (Exception e) {
			System.out.println("아이디 중복 확인 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	} // duplecateID() end
	
	public int duplecateEmail(String email) { 
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT COUNT(email) as cnt ");	
			sql.append(" FROM member ");	
			sql.append(" WHERE email = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			} // if end
			
		} catch (Exception e) {
			System.out.println("이메일 중복 확인 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	} // duplecateEmail() end
	
	
	public int signIn(MemberDTO dto) {
		int cnt = 0;
		
		try {
			con = dbopen.getConnection(); // db 연결
			sql = new StringBuilder();
			sql.append(" insert into member (id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
			sql.append(" values(?,?,?,?,?,?,?,?,?,'D1', sysdate) ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("추가 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt);
		}
		
		return cnt;
	} // signIn() end
	
	
	public MemberDTO findId(String mname, String email) {
		MemberDTO dto = null;
		
		try {
			dto = new MemberDTO();
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT id ");	
			sql.append(" FROM member ");	
			sql.append(" WHERE mname = ? and email = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setId(rs.getString("id"));
			} // if end
			
		} catch (Exception e) {
			System.out.println("아이디 조회 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	} // findId() end
	
	public int findPW(MemberDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" update member set passwd = ? ");
			sql.append(" where mname = ? and id = ? and email = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, getRamdomPassword(10));
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getEmail());
			cnt = pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("비밀번호 조회 실패 : "+ e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		
		return cnt;
	} // findPW() end
	
	
	public MemberDTO findPWProc(String mname, String id, String email) {
		MemberDTO dto = null;
		
		try { 
			dto = new MemberDTO();
			con = dbopen.getConnection();
			
			sql = new StringBuilder();
			sql.append(" SELECT passwd ");	
			sql.append(" FROM member ");	
			sql.append(" where mname = ? and id = ? and email = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, mname);
			pstmt.setString(2, id);
			pstmt.setString(3, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setPasswd(rs.getString("passwd"));
			} // if end
			
		} catch (Exception e) {
			System.out.println("메일 발송 실패 : "+e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	} // findPWProc() end

	
	public String getRamdomPassword(int size) {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#', '$', '%', '^', '&' };

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<size; i++) {
            // idx = (int) (len * Math.random());
            idx = sr.nextInt(len);    // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
            sb.append(charSet[idx]);
        }

        return sb.toString();
    }
}
