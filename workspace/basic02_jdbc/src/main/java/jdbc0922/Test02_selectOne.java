package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test02_selectOne {

	public static void main(String[] args) {
		// sungjuk 테이블에서 한 행 가져오기
		int sno = 46;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String url		="jdbc:oracle:thin:@localhost:1521:xe";
			String user		="system";
			String password	="1234";
			String driver	="oracle.jdbc.driver.OracleDriver";	// ojdbc6.jar
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);	
			System.out.println("오라클DB 서버 연결 성공!");
			
			// 4) SQL 작성
			StringBuilder sql = new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, tot, aver, addr, wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE sno=? ");
			
			// 5) SQL 형식으로 변환
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,sno);
			
			// 6) SQL문 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("자료 있음!");
				
				// 1) 칼럼 순서 접근
				System.out.println(rs.getInt(1)); 		// 1번 칼럼. sno 칼럼
				System.out.println(rs.getString(2));	// 2번 칼럼. uuname 칼럼
				System.out.println(rs.getInt(3)); 		// 3번 칼럼. kor 칼럼
				System.out.println(rs.getInt(4)); 		// 4번 칼럼. eng 칼럼
				System.out.println(rs.getInt(5)); 		// 5번 칼럼. mat 칼럼
				System.out.println(rs.getInt(6)); 		// 6번 칼럼. tot 칼럼
				System.out.println(rs.getInt(7)); 		// 7번 칼럼. aver 칼럼
				System.out.println(rs.getString(8)); 	// 8번 칼럼. addr 칼럼
				System.out.println(rs.getString(9)); 	// 9번 칼럼. wdate 칼럼
				
				// 2) 칼럼명 접근
				System.out.println(rs.getInt("sno")); 		// 1번 칼럼. sno 칼럼
				System.out.println(rs.getString("uname"));	// 2번 칼럼. uuname 칼럼
				System.out.println(rs.getInt("kor")); 		// 3번 칼럼. kor 칼럼
				System.out.println(rs.getInt("eng")); 		// 4번 칼럼. eng 칼럼
				System.out.println(rs.getInt("mat")); 		// 5번 칼럼. mat 칼럼
				System.out.println(rs.getInt("tot")); 		// 6번 칼럼. tot 칼럼
				System.out.println(rs.getInt("aver")); 		// 7번 칼럼. aver 칼럼
				System.out.println(rs.getString("addr")); 	// 8번 칼럼. addr 칼럼
				System.out.println(rs.getString("wdate")); 	// 9번 칼럼. wdate 칼럼
				
			} else {
				System.out.println("자료 없음!");
			} // if end
			
		} catch(Exception e) {
			System.out.println("실패 : " + e);
		} finally { 
			try {
				if(rs != null) {rs.close();}
			} catch (Exception e) {}
			
			try {
				if(pstmt != null) {pstmt.close();}
			} catch (Exception e) {}
			
			try {
				if(con != null) {con.close();}
			} catch (Exception e) {}
		} // end
		
		System.out.println("END");
		
		
		
	}

}
