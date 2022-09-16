package oop0916;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

public class Test04_1_SetMap {

	public static void main(String[] args) {

		
		// 경환형 풀이
		/* 
		HashSet command=new HashSet();
		
		// HashMap hm 만들기
		HashMap hm = new HashMap();

		// command의 반환자 iter2 만들기
		Iterator iter2 = command.iterator();

		// 반환자로 command의 요소 불러오기
		while(iter2.hasNext()) { // 다음 cursor가 있는지 확인
		    // cursor가 가리키는 요소 가져와서 obj에 담기
		   Object obj=iter2.next();
		   
		   // 요소를 String으로 변환해서 str에 담기
		   String str = obj.toString();
		   
		   // pos에 =의 위치값 담기
		   int pos=str.indexOf("=");
		   
		   // =를 기준으로 문자열 나누기
		   String key = str.substring(0, pos);
		   String value = str.substring(pos+1);
		   
		   // 나눠진 문자열을 hm 안에 각각 key와 value로 담기
		   hm.put(key, value);        
		} // while end            
		        
		// 결과값
		System.out.println(hm.get("list.do")); // net.bbs.List
		System.out.println(hm.get("read.do")); // net.bbs.Read
		System.out.println(hm.get("write.do")); // net.bbs.Write
		*/
		
		
		// 홍승형 풀이
		/*
		Iterator cm = command.iterator();
		for (int i=0; i<command.size(); i++) {
		   Object objt = cm.next();
		   String str = objt.toString();
		   String k = str.substring(0, str.indexOf("="));
		   String v = str.substring(str.indexOf("=")+1);
		   hm.put(k, v);
		}//for end
		*/
		
	}

}
