package oop0920;

import java.io.FileInputStream;

public class Test01_input {

	public static void main(String[] args) {
		// 파일 입출력 (.txt)
		// File : .txt .pdf .xls .csv . ppt .jpg
		
		// byte형 : 1바이트 할당
		// char형 : 2바이트 할당
		
		// 1) byte 기반 -> 한글깨짐
		
		String filename = "D:\\Java202207\\workspace\\basic01_java\\src\\oop0920\\data.txt";
		
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(filename);
			while(true) {
				int data = fis.read(); // 1byte를 읽기
				
				if (data == -1) {	// 파일의 끝(End of File)인지? BOF
					break;
				}
				// System.out.println(data);
				System.out.printf("%C", data);
			} // while end
			
		} catch (Exception e) {
			System.out.println("파일 읽기 실패 : " + e);
		} finally {
			// 자원 반납 (열어줬으면 닫아줄 필요가 있다.)
			try {
				if (fis != null) { fis.close(); }
			} catch (Exception e) {}
		} // end
		
	} // main() end
} // class end
