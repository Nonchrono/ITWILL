package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test03_update {

	public static void main(String[] args) {
		// sungjuk 테이블 행 수정 연습
		
		
		try {
			
			String url		="jdbc:oracle:thin:@localhost:1521:xe";		// 127.0.0.1 이라고 써도 동일 // 1521는 오라클의 호스트 번호
			String user		="system";
			String password	="1234";
			String diver	="oracle.jdbc.driver.OracleDriver";	// ojdbc6.jar
			Class.forName(diver);
			Connection con = DriverManager.getConnection(url, user, password);	
			System.out.println("오라클DB 서버 연결 성공!");
			
			
			
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET tot = kor + eng + mat ");
			sql.append(" , aver = (kor + eng + mat) / 3 ");
			sql.append(" where sno = 21");
			
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			
			int cnt = pstmt.executeUpdate();	// 실행했을 때 행의 갯수가 반환
			if (cnt == 0) {
				System.out.println("행 수정 실패!!");
			} else {
				System.out.println("행 수정 성공~~");
			} // if end
			
			// 자원반납 (순서 주의)
			pstmt.close();
			con.close();
			
		} catch(Exception e) {
			System.out.println("실패 : " + e);
		} // end
		
		System.out.println("END");
	}

}
