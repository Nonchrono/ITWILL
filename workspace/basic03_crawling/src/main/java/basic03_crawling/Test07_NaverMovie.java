package basic03_crawling;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test07_NaverMovie {

	public static void main(String[] args) {
		// 네이버 영화 평점 후기 크롤링하기
		// "공조2" 영화 평점 제목을 공감순으로 정렬 후 크롤링하기 (대략 9690건)
		// gongjo.txt 파일에 저장하기
		
		try {
			String fileName = "D:/java202207/gongjo.txt";
			FileWriter fw = new FileWriter(fileName, true);
			PrintWriter out = new PrintWriter(fw, true);

			String URL = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
			String params = "?code=201641"; // 영화 코드번호
			params += "&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N&";
			params += "order=sympathyScore"; // 공감순
			params += "&page="; // 페이지
			
			for(int p = 1; p <= 969; p++) {
				System.out.println("데이터 수집 중...");
				Document doc = Jsoup.connect(URL+params+p).get();
				for (int ment=0; ment < 10; ment++) {
					Elements elements = doc.select("#_filtered_ment_"+ment);
					for ( Element element : elements ) {
						out.println(element.text());
					} // for end
				} // for end
			} // for end
			
			
			out.close();
			fw.close();
			System.out.println("-------gongjo.txt 공조2 평점 저장 완성!");
			
			
		} catch (Exception e) {
			
		}
		
		
	} // main() end
} // class end
