package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test04_selectAvg {

	public static void main(String[] args) {
		// 문제) 주소가 서울인 행들의 국영수 평균값을 구하시오
		// 단, 소수점은 반올림해서 둘째자리값까지 표현
		String addr = "Seoul";
		
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
			sql.append(" select round(avg(kor),2) as avg_kor, round(avg(eng),2) as avg_eng, round(avg(mat),2) as avg_mat ");
			sql.append(" from sungjuk ");
			sql.append(" where addr = ? ");
			
			// 5) SQL 형식으로 변환
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, addr);
			
			// 6) SQL문 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("자료 있음!");
				
				do {
					// 1) 칼럼 순서 접근
					System.out.printf("국어평균:%.2f\n",rs.getDouble(1));
					System.out.printf("영어평균:%.2f\n",rs.getDouble(2));
					System.out.printf("수학평균:%.2f\n",rs.getDouble(3));
					System.out.println();
					
					// 2) 칼럼명 접근
					System.out.printf("국어평균:%.2f\n",rs.getDouble("avg_kor"));
					System.out.printf("영어평균:%.2f\n",rs.getDouble("avg_eng"));
					System.out.printf("수학평균:%.2f\n",rs.getDouble("avg_mat"));
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
