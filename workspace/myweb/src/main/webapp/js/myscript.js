/**
 * mycript.js
 */

function bbsCheck() {
	// 1) 작성자 (2글자 이상 입력)
	let wname= $('#wname').val(); // 작성자 가져오기
	wname = wname.trim();
	if (wname.length < 2) {
		alert("작성자 2글자 이상 입력해주세요");
		$('#wname').focus(); // 작성자 칸에 커서 생성
		return false; // 전송하지 않음
	}
	
	// 2) 제목 (2글자 이상 입력)
	let subject= $('#subject').val(); // 제목 가져오기
	subject = subject.trim();
	if (subject.length < 2) {
		alert("제목 2글자 이상 입력해주세요");
		$('#subject').focus(); // 작성자 칸에 커서 생성
		return false; // 전송하지 않음
	}
	
	// 3) 내용 (2글자 이상 입력)
	let content= $('#content').val(); // 내용 가져오기
	content = content.trim();
	if (content.length < 2) {
		alert("내용 2글자 이상 입력해주세요");
		$('#content').focus(); // 내용 칸에 커서 생성
		return false; // 전송하지 않음
	}
	
	// 4) 비밀번호 (4글자 이상이면서 숫자형 기호만 입력)
	let passwd= $('#passwd').val();
	passwd = passwd.trim();
	if (passwd.length < 2) {
		alert("비밀번호 2글자 이상 입력해주세요");
		$('#passwd').focus();
		return false;
	} else if (isNaN(passwd)) {
		alert("비밀번호에 숫자만 입력해주세요");
		$('#passwd').focus();
		return false;
	}
		
	return true; // onsubmit 이벤트에서 서버로 전송
} // bbsCheck() end

 
 
function pwCheck() {
	let passwd= $('#passwd').val();
	passwd = passwd.trim();
	if (passwd.length < 2 || isNaN(passwd)) {
		alert("비밀번호 2글자 이상 입력해주세요");
		$('#passwd').focus();
	 	return false;
	} // if end
	
	let message = "진행된 내용은 복구되지 않습니다\n계속 진행할까요?";
	if(confirm(message)) { // alert랑 다르게 확인이랑 취소 다 나온다
		return true; // 서버로 전송
	} else {
		return false;
	}
} // pwCheck() end

function pwCheck2() {
	let passwd= $('#passwd').val();
	passwd = passwd.trim();
	if (passwd.length < 2 || isNaN(passwd)) {
		alert("비밀번호 2글자 이상 입력해주세요");
		$('#passwd').focus();
	 	return false;
	} // if end
	
	return true;
} // pwCheck2() end


function searchCheck() {
	// 검색어를 입력해야만 서버로 전송	
	let word = document.getElementById("word").value;
	word = word.trim();
	if(word.length == 0) {
		alert("검색어를 입력해주세요");
		return false;	
	} // if end
	
	return true;
} // searchCheck() end

