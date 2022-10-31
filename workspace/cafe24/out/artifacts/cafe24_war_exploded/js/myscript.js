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
	/*
	let content= $('#content').val(); // 내용 가져오기
	content = content.trim();
	if (content.length < 2) {
		alert("내용 2글자 이상 입력해주세요");
		$('#content').focus(); // 내용 칸에 커서 생성
		return false; // 전송하지 않음
	}
	*/
	
	// 4) 비밀번호 (4글자 이상)
	let passwd= $('#passwd').val();
	passwd = passwd.trim();
	if (passwd.length < 4) {
		alert("비밀번호 2글자 이상 입력해주세요");
		$('#passwd').focus();
		return false;
	} 
	/*
		else if (isNaN(passwd)) {
		alert("비밀번호에 숫자만 입력해주세요");
		$('#passwd').focus();
		return false;
	}
	*/
	
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
		$('#passwd').val().empty();
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


function loginCheck() { // 로그인 유효성 검사 (아이디, 비번)

	// 1) 아이디 5~15 글자 이내인지 검사
	let id = $('#id').val();
	id = id.trim();
	if(!(id.length >= 5 && id.length <= 15)) {
		alert("아이디 5~15글자 이내로 입력해주세요");
		$('#id').focus();
		return false;
	} // if end
		
	// 2) 비밀번호는 5~10 글자 이내인지 검사
	let passwd = $('#passwd').val();
	passwd = passwd.trim();
	if(!(passwd.length >= 5 && passwd.length <= 10)) {
		alert("비밀번호 5~10글자 이내로 입력해주세요");
		$('#passwd').focus();
		return false;
	} // if end
	
	return true;
	
} // loginCheck() end


function idCheck() { // 아이디 중복 확인
	
	// 모달창
	// -> 부모창과 자식창이 한몸으로 구성되어 있음
	// -> 참조 : https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	
	// 새창 만들기
	// -> 부모창과 자식창이 별개로 구성되어 있음
	// -> 모바일에 기반을 둔 frontend 단에서는 사용하지 말 것
	// -> 참조 : https://www.w3schools.com/jsref/met_win_open.asp
	// window.open("파일명", "새창이름", "다양한옵션들")
	window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
} // idCheck() end

function emailCheck() { // 이메일 중복 확인
	window.open("emailCheckForm.jsp", "emailwin", "width=400, height=350");
} // emailCheck() end

function memberCheck() {
	//1)아이디 5~10글자 인지?
	if ($('#id').val().length <= 5 || $('#id').val().length >= 10) {
		alert("아이디를 5~10글자 사이로 입력해주세요");
		$('#id').focus();
		return false;
	}
	
    //2)비밀번호 5~10글자 인지?
	if ($('#passwd').val().length <= 5 || $('#passwd').val().length >= 10) {
		alert("비밀번호를 5~10글자 사이로 입력해주세요");
		$('#passwd').focus();
		return false;
	}
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	if ($('#passwd').val() != $('#repasswd').val()) {
		alert("비밀번호와 비밀번호 확인 란에 입력된 내용이 서로 다릅니다");
		$('#passwd').focus();
		return false;
	}


    //4)이름 2글자 이상 인지?
    if ($('#mname').val().length < 2) {
		alert("이름을 2글자 이상으로 적어주세요");
		$('#mname').focus();
		return false;
	}

    //5)이메일 5글자 인지?
    if ($('#email').val().length < 5) {
		alert("이메일을 5글자 이상으로 적어주세요");
		$('#email').focus();
		return false;
	}

    //6)직업을 선택했는지?
    if ($('#job').val() == '0') {
		alert("직업을 선택해주세요");
		$('#job').focus();
		return false;
	}

	return true;
} // memberCheck() end

function pdsCheck() { // 포토갤러리 유효성 검사
	// 1) 이름
	let wname = $("#wname").val();
	if (wname.length > 10) {
		alert("이름은 10 글자 이내로 작성해주세요");
		return false;
	} // if end

	// 2) 제목
	let subject = $("#subject").val();
	if (subject.length <= 1) {
		alert("제목은 1글자 이상 작성해주세요");
		return false;
	} // if end
	
	// 3) 비밀번호
	if ($('#passwd').val().length < 5 || $('#passwd').val().length > 10) {
		alert("비밀번호를 5~10글자 사이로 입력해주세요");
		$('#passwd').focus();
		return false;
	} // if end
	
	// 4) 첨부파일
	// -> 파일의 확장명이 이미지 파일(png, jpg, gif)인지 확인하시오!
	// let filename = document.getElementById("filename").value; // 예) sky.png
	let filename = $("#filename").val();
	filename = filename.trim();
	if(filename.length == 0) {
		alert("첨부파일 선택하세요~");
		return false;
	} else {
		let dot = filename.lastIndexOf("."); // filename 변수값에서 마지막 .의 순서값
		let ext = filename.substr(dot+1); // 확장명 : 마지막 . 이후 문자열 자르기
		ext = ext.toLowerCase(); // 확장명을 전부 소문자 치환
		if (ext == "png" || ext == "jpg" || ext == "gif") {
			return true;
		} else {
			alert("이미지 파일만 업로드 가능합니다!");
			return false;
		} // if end
	} // if end
} // pdsCheck() end


function pwCheck3() {
	let passwd= document.getElementById("passwd").value;
	passwd = passwd.trim();
	if (!(passwd.length >= 4 && passwd.length <= 15)) {
		alert("비밀번호 4글자 이상 15글자 이하로 입력해주세요");
		document.getElementById("passwd").focus();
	 	return false;
	} // if end
	
	let message = "첨부파일도 삭제됩니다\n계속 진행할까요?";
	if(confirm(message)) {
		return true;
	} else {
		return false;
	} // if end
} // pwCheck3() end
