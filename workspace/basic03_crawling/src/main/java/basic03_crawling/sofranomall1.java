package basic03_crawling;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class sofranomall1 {

	public static void main(String[] args) {
		
		try {
			String fileName = "D:/java202207/sopranomall1.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "https://www.sofrano.com/product/list.html";
			String params = "?cate_no=43"; // 카테고리 닌텐도 스위치
			params += "&sort_method=5"; // 신상품 순서
			params += "&page="; // 페이지 순서
			
			for(int p = 1; p <= 10; p++) {
				System.out.println("데이터 수집 중...");
				Document doc = Jsoup.connect(URL+params+p).get();
				Elements elements = doc.select(".name");
				System.out.println(elements);
				for ( Element element : elements ) {	// for (개별 : 덩어리)
					out.println(element.text());
				}
			}
			
			out.close();
			fw.close();
			System.out.println("-------sopranomall1.txt 완성!");
			
			
		} catch (Exception e) {
			System.out.println("크롤링 실패 : "+e);
		}
		
		
	} // main() end
} // class end
