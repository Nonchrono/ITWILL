package jdbc0922;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test07_selectPhazing {

	public static void main(String[] args) {
		// 페이징
		// 문제) sungjuk 테이블에서 이름순으로 정렬한 후 행번호 4~6행만 조회하시오
		int start = 4;
		int end = 6;
		
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
			
			sql.append(" select * ");
			sql.append(" from ( ");
			sql.append(" 		select uname, aver, addr, rownum as rnum ");
			sql.append(" from ( ");
			sql.append(" 	select uname, aver, addr ");
			sql.append(" 	from sungjuk ");
			sql.append(" 	order by uname ");
			sql.append(" 	) ");
			sql.append(" ) ");
			sql.append(" where rnum >= ? and rnum <= ? ");
			
			
			// 5) SQL 형식으로 변환
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			
			// 6) SQL문 실행
			rs = pstmt.executeQuery();
			
			
			if (rs.next()) {
				System.out.println("자료 있음!");
				
				do {
					System.out.print(rs.getInt("rnum")+ " " );
					System.out.print(rs.getString("uname")+ " " );
					System.out.print(rs.getInt("aver")+ " " );
					System.out.print(rs.getString("addr")+ " " );
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
