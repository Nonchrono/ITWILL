package jdbc0921;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test05_insert {

	public static void main(String[] args) {
		// sungjuk 테이블 행 삭제 연습
		
		
		try {
			
			String url		="jdbc:oracle:thin:@localhost:1521:xe";		// 127.0.0.1 이라고 써도 동일 // 1521는 오라클의 호스트 번호
			String user		="system";
			String password	="1234";
			String diver	="oracle.jdbc.driver.OracleDriver";	// ojdbc6.jar
			Class.forName(diver);
			Connection con = DriverManager.getConnection(url, user, password);	
			System.out.println("오라클DB 서버 연결 성공!");
			
			String name = "박지성";
			int kor = 99, eng = 98, mat = 100;
			String addr = "Seoul";
			
			
			StringBuilder sql = new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno, uname, kor, eng, mat, addr, wdate) ");
			sql.append(" VALUES (sungjuk_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
			// -> ? 특정값으로 대입할 수 있는 표식 (다른 값으로 대체). '?'과는 다르다
			
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			// -> ?의 갯수, 순서, 자료형이 일치해야한다.
			pstmt.setString(1, name); 	// 1 -> 첫번째 물음표, uname 칼럼
			pstmt.setInt(2, kor);  		// 2 -> 두번째 물음표, kor 칼럼
			pstmt.setInt(3, eng);  		// 3 -> 세번째 물음표, eng 칼럼
			pstmt.setInt(4, mat);  		// 4 -> 네번째 물음표, mat 칼럼
			pstmt.setString(5, addr);  	// 5 -> 다섯번째 물음표, addr 칼럼
			
			int cnt = pstmt.executeUpdate();	// 실행했을 때 행의 갯수가 반환
			if (cnt == 0) {
				System.out.println("행 삽입 실패!!");
			} else {
				System.out.println("행 삽입 성공~~");
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
