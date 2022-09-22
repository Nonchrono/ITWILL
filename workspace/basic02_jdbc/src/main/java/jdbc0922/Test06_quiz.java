package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test06_quiz {

	public static void main(String[] args) {
		// 문제) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
		
		String hakno = "g1001";
		
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
			sql.append(" select su.hakno, su.gcode, gw.gname ");
			sql.append(" from tb_sugang su join tb_gwamok gw ");
			sql.append(" on su.gcode = gw.gcode ");
			sql.append(" where su.hakno = ? ");
			sql.append(" order by gcode ");
			
			// 5) SQL 형식으로 변환
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,hakno);
			
			// 6) SQL문 실행
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				System.out.println("자료 있음!");
				
				do {
					System.out.print(rs.getString("hakno")+ " " );
					System.out.print(rs.getString("gcode")+ " " ); 
					System.out.print(rs.getString("gname")+ " " ); 
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
