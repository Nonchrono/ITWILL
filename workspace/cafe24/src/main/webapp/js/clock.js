function showtime() {               
     const d = new Date();
     
     let today=""; // 결과값

     // 년도
     today += d.getFullYear() + "."; // 2022.

     // 달
     if (10 > d.getMonth()+1) {
         today += "0"+(d.getMonth()+1)+"."; // 2022.08
     } else {
         today += (d.getMonth()+1)+".";
     }

     // 일
     if (10 > d.getDate()) {
         today += "0";
     }
     today += d.getDate()+" ";   // 2022.08.10

     switch(d.getDay()) {
         case 0: today +=" (일) "; break;
         case 0: today +=" (월) "; break;
         case 0: today +=" (화) "; break;
         case 0: today +=" (수) "; break;
         case 0: today +=" (목) "; break;
         case 0: today +=" (금) "; break;
         case 0: today +=" (토) "; break;
     } // switch end


     // 시간
     if (12 < d.getHours()) {
         today += "PM "+(d.getHours()-12)+":";
     } else {
         today += "AM "+d.getHours()+":";
     }


     // 분
     if (10 > d.getMinutes()) {
         today += "0" + d.getMinutes()+":";
     } else {
         today += d.getMinutes()+":";
     }


     // 초
     if (10 > d.getSeconds()) {
         today += "0" + d.getSeconds();
     } else {
         today += d.getSeconds();
     }

     document.getElementById("clock").innerText=today;

     timer = setTimeout(showtime, 1000); // 1초 후에 showtime 함수 호출
     // let timer;가 생략되어 있기 때문에 timer에 들어간 값이 실행이 된다.
 } // showtime();
 
 let timer;  // 전역변수

 function killtime() {
     clearTimeout(timer);
     // timer를 잡아야하는 건 변수는 범위이기 때문. 값을 직접 넣으면 안 된다.
 } // killtime() end

 // 전역변수에 안 넣고 바로 함수에 넣으니 작동 안 함