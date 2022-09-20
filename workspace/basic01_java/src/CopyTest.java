import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;

public class CopyTest {

	public static void main(String[] args) {
		// CMD 명령어 copy 작성하기 (파일 복사하기)
		// 결과확인 CMD 창에서 실습합니다
		// 주의사항 : 모든 한글을 삭제한 후 실습
		
		// >javac TypeTest.java						컴파일하기
		// >java CopyTest MainTest.java lee.java	자바 클래스 실행하기
		
		String inName = args[0];
		String outName = args[1];
		
		FileReader fr 	= null;
		FileWriter fw 	= null;
		PrintWriter out = null;
		
		try {
			fr = new FileReader(inName);
			fw = new FileWriter(outName, false);
			out = new PrintWriter(fw, true);
			
			while (true) {
				int data = fr.read();
				if (data == -1) {
					break;
				} // if end
				out.printf("%c", data);
			} // while end
			
			System.out.println("1 file copied");
			
		} catch (Exception e) {
			System.out.println("copy failure : " + e);
		} finally {
			try {
				if (fr != null) { fr.close(); }
			} catch (Exception e) {}
			
			try {
				if (out != null) { out.close(); }
			} catch (Exception e) {}
			
			try {
				if (fw != null) { fw.close(); }
			} catch (Exception e) {}	
		} // end
	}

}
