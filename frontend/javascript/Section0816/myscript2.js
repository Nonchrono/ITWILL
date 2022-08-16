// mycript2.js

function getID() {
    // alert();

    // <input type="text" name="uid" id="uid">에 접근해보자
    
    // 1) <form>의 컨트롤 요소 접근시 id 사용 (추천)
    // alert(document.getElementById('uid')); // [object HTMLInputElement]
    alert(document.getElementById('uid').value);

    // 2) tag name 접근
    // 본문에서 <input> 태그들 접근
    // 틀린 문법은 아닌데 input 태그가 하나만 있지 않기 때문에 각각 0번째, 1번째, 2번째 식으로 접근이 된다.
    // alert(document.getElementsByTagName('input')); // [object HTMLcollection]
    // // <input>태그들 중에서 0번째 접근
    // alert(document.getElementsByTagName("input")[0]); // [object HTMLInputElement]
    // alert(document.getElementsByTagName("input")[0].value);

    // 3) <form>의 컨트롤 요소 접근시 name 사용 (비추)
    // alert(document.memfrm.uid.value);
    // alert(document.getElementsByName('uid')); // [object Nodelist]
    // // alert(document.getElementsByName('uid').value); // undefined
    // alert(document.getElementsByName('uid')[0].value);

    // 4) 스타일 접근
    // alert(document.getElementsByClassName("line")); // [object HTMLCollection]
} // getID end

function setID(){
    // <input type="text" name="uid" id="uid" class="line">에 값 대입하기
    let str="itwill";

    // 1) id 접근 (추천)
    document.getElementById("uid").value = str;

    // 2) tag name 접근
    // document.getElementsByTagName("input")[0].value = str;

    // 3) name 접근
    // document.getElementsByName('uid')[0].value = str;

} // setID() end

function validate() {
    //  회원가입 폼에 대한 유효성 검사

    // 1) 아이디 글자 갯수가 8~12 사이인지 확인하시오 (maxlength)
    // 위의 조건을 만족하지 않으면
    //  -> 경고장 (alert)
    //  -> 아이디를 다시 입력할 수 있도록 id=uid에 커서를 생성(focus)
    //  -> 서버로 전송하는 것을 차단
    let uid = document.getElementById("uid").value;
    uid = uid.trim(); // 맨앞과 맨뒤 공백 제거

    if ( !(uid.length >= 8 && uid.length <= 12) ) {
        alert("아이디 8~12 글자 이내로 입력해주세요");
        document.getElementById("uid").focus(); // 커서 입력
        return false;
    } // if end

    // 2) 비밀번호 글자 갯수가 5~10 사이인지 확인하시오
    let upw = document.getElementById("upw").value;
    upw = upw.trim(); // 맨앞과 맨뒤 공백 제거

    if ( !(upw.length >= 5 && upw.length <= 10) ) {
        alert("비밀번호 5~10 글자 이내로 입력해주세요");
        document.getElementById("upw").focus(); // 커서 입력
        return false;
    } // if end


    // 3) 주민번호가 앞칸이 숫자형인지 글자 갯수 6인지 확인하시오
    // 참조 : https://www.w3schools.com/jsref/jsref_isnan.asp

    let jumin1 = document.getElementById("jumin1").value;
    jumin1 = jumin1.trim();

    if (jumin1.length != 6 || isNaN(jumin1)) { // 숫자 기호인지?
        alert('주민번호(앞칸) 6글자 숫자로 입력해주세요');
        document.getElementById("jumin1").value=""; // 기존값을 지우기 위해 빈 문자열 대입
        document.getElementById("jumin1").focus();
        return false;
    } // if end

    let jumin2 = document.getElementById("jumin2").value;
    jumin2 = jumin2.trim();

    if (jumin2.length != 7 || isNaN(jumin2)) { // 숫자 기호인지?
        alert('주민번호 뒷칸) 7글자 숫자로 입력해주세요');
        document.getElementById("jumin2").value=""; // 기존값을 지우기 위해 빈 문자열 대입
        document.getElementById("jumin2").focus();
        return false;
    } // if end


    // 4) 약관 동의에 체크했는지?
    if(document.getElementById("agree").checked == false) {
        alert("약관에 동의해주세요");
        return false;
    } // if end

    alert("회원가입 폼을 서버로 전송합니다.");
    return true; // <form name=memfrm> 폼을 서버로 전송

} // validate() end