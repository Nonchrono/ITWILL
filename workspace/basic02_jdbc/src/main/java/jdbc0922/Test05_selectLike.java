package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test05_selectLike {

	public static void main(String[] args) {
		// Like 연산자 연습
		// 문제 이름에 '나' 문자가 있는 행을 조회하시오
		
		String col = "uname"; // 검색 칼럼 keyfield
		String word = "나"; // 검색어 keyword
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String url		="jdbc:oracle:thin:@localhost:1521:xe";
			String user		="system";
			String password	="1234";
			String diver	="oracle.jdbc.driver.OracleDriver";	// ojdbc6.jar
			Class.forName(diver);
			con = DriverManager.getConnection(url, user, password);	
			System.out.println("오라클DB 서버 연결 성공!");
			
			// 4) SQL 작성
			StringBuilder sql = new StringBuilder();
			sql.append(" select sno, uname, kor, eng, mat, tot, aver, addr, wdate ");
			sql.append(" from sungjuk ");
			
			if (word.length() > 0) {
				// where uname like '%나%'
				String where = " WHERE " + col + " LIKE '%" + word + "%' ";
				sql.append(where);
			} // if end
			
			sql.append(" ORDER BY sno DESC ");
			
			// System.out.println(sql.toString());
			
			// 5) SQL 형식으로 변환
			pstmt = con.prepareStatement(sql.toString());
			
			
			// 6) SQL문 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("자료 있음!");
				
				do {
					System.out.print(rs.getInt("sno")+ " " ); 		// 1번 칼럼. sno 칼럼
					System.out.print(rs.getString("uname")+ " " );	// 2번 칼럼. uuname 칼럼
					System.out.print(rs.getInt("kor")+ " " ); 		// 3번 칼럼. kor 칼럼
					System.out.print(rs.getInt("eng")+ " " ); 		// 4번 칼럼. eng 칼럼
					System.out.print(rs.getInt("mat")+ " " ); 		// 5번 칼럼. mat 칼럼
					System.out.print(rs.getInt("tot")+ " " ); 		// 6번 칼럼. tot 칼럼
					System.out.print(rs.getInt("aver")+ " " ); 		// 7번 칼럼. aver 칼럼
					System.out.print(rs.getString("addr")+ " " ); 	// 8번 칼럼. addr 칼럼
					System.out.print(rs.getString("wdate")+ " " ); 	// 9번 칼럼. wdate 칼럼
					System.out.println();
				} while(rs.next()); // 다음 cursor가 있는지?
				
				
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
