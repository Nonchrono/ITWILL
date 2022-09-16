package oop0916;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Properties;
import java.util.Set;

public class Test04_SetMap {

	public static void main(String[] args) {
		// 2. Set 계열 : 순서가 없다
		
		Set set = new HashSet();
		set.add(3);
		set.add(2.4);
		set.add('R');
		set.add("BUSAN");
		set.add(new Integer(7));
		
		System.out.println(set.size());
		
		
		// cursor : 가르킬 요소가 있으면 true, 없으면 false 값 반환
		// cursor를 이용해서 요소를 접근하는 경우
		
		Iterator iter = set.iterator();
		while(iter.hasNext()) { // 다음 cursor가 있는지?
			// cursor가 가리키는 요소 가져오기
			Object obj = iter.next();
			System.out.println(obj);
		} // while end
		//////////////////////////////////////////////////////////
		
		
		
		// 3. Map 계열 : 순서가 없다
		// -> Key 	  : 이름표
		// -> Value	  : 값
		
		// -> JSON, 파이썬(딕셔너리), NoSQL 등에서 많이 사용하는 문법
		
		HashMap map = new HashMap();
		map.put("one", 3);
		map.put("two", 2.4);
		map.put("three", 'R');
		map.put("four", "손흥민");
		
		System.out.println(map.get("four"));
		
		map.put("four", "박지성");
		///////////////////////////////////////////////////////////
		
		
		// Properties 클래스
		Properties db = new Properties();
		
		db.put("url", "http://localhost:1521");
		db.put(map, db);
		db.put(map, db);
		
		System.out.println(db.get("url"));
		System.out.println(db.get("username"));
		System.out.println(db.get("password"));
		
		
		
		////////////////////////////////////////////////////////////
		
		// 문제) = 문자를 기준으로 문자열을 분리해서
		//		= 앞의 문자열은 key, = 뒤의 문자열은 value로 구분해서 map에 저장하고
		//		map의 key값들 중에서 "read.do"를 호출하면	
		//		value 값으로 net.bbs.Read 출력하시오
		
		
		HashSet command=new HashSet();
        command.add("list.do=net.bbs.List");
        command.add("read.do=net.bbs.Read");
        command.add("write.do=net.bbs.Write");
        
        System.out.println(command.size()); // 3
        
        // HashMap hm 만들기
        HashMap hm = new HashMap();
        /*
        // command의 커서 iter2 만들기
        Iterator iter2 = command.iterator();
		
        // 커서로 command의 요소 불러오기
        while(iter2.hasNext()) { // 다음 커서가 있는지 확인
        	// 커서가 가리키는 요소 가져와서 ob2에 담기
			Object obj2 = iter2.next();
			
			// obj2를 문자열화시켜서 str2에 담기
			String str2 = obj2.toString();
			 
			// 문자열 str2를 =를 기준으로 split해서 str3 배열 0,1번째 요소로 담기
			String[] str3 = str2.
					split("=");
			
			// str3의 0번째, 1번째 요소를 hm의 key와 value로 담기
			hm.put(str3[0],str3[1]);
		} // while end
        
        
        // 결과값
        System.out.println(hm.get("list.do")); // net.bbs.List
        System.out.println(hm.get("read.do")); // net.bbs.Read
        System.out.println(hm.get("write.do")); // net.bbs.Write
		*/
        
        
        // 1) 커서 생성하기
        Iterator cursor = command.iterator();
        
        // 2)  커서가 있을 때까지 반복
        while(cursor.hasNext()) {
        	// 3) 커서가 가리키는 요소를 가져와서 문자열 형변환
        	Object obj = cursor.next();
        	String line = (String)obj; // 다형성
        	System.out.println(line);
        
        
	        // 4) "=" 위치를 기준으로 문자열 분리하기
	        // -> split(), substring(), StringTokenizer 클래스
	        String[] word = line.split("=");
	        String key = word[0];	// "=" 앞 문자열
	        String Value = word[1];	// "=" 뒤 문자열
	        System.out.println(key);
	        System.out.println(Value);
	        
	        // 5) hm에 저장하기
	        hm.put(key, Value);
        } // while end
		
        System.out.println(hm.get("read.do")); // net.bbs.Read
        
        
	} // main() end
} // class end
