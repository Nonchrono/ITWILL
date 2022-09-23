package basic03_crawling;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test08_quiz {

	public static void main(String[] args) {
		// 아이티윌 사이트 공지사항
		
		try {
			String fileName = "D:/java202207/itwill.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "https://www.itwill.co.kr/cmn/board/BBSMSTR_000000000071/bbsList.do";
			String params = "?pageIndex=";
			
			for(int p = 1; p <= 4; p++) {
				System.out.println("데이터 수집 중...");
				Document doc = Jsoup.connect(URL+params+p).get();
					Elements elements = doc.select(".bgcol01");
					elements.select(".line0 ac mobileHide").remove();
					elements.select(".ac mobileHide").remove();
					elements.select(".ac").remove();
					
					for ( Element element : elements ) {
						out.println(element.text());
						
					} // for end
			} // for end
			
			
			out.close();
			fw.close();
			System.out.println("-------itwill.txt 아이티윌 공지사항 크롤링 저장 완성!");
			
			
		} catch (Exception e) {
			
		}
		
		
	} // main() end
} // class end
