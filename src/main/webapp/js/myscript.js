/*
	myscript.js 
*/

function bbsCheck() { // 게시판 유효성 검사
	// 1) 작성자 2글자 이상 입력
	var wname = document.getElementById("wname").value; // 작성자 가져오기
	wname = wname.trim(); // 좌우 공백제거
	if(wname.length<2) {
		alert("작성자 2글자 이상 입력해 주세요");
		document.getElementById("wname").focus(); // 작성자칸에 커서 생성
		return false; // 전송하지 않음
	}

	// 2) 제목 2글자 이상 입력
	var subject = document.getElementById("subject").value; // 작성자 가져오기
	subject = subject.trim(); // 좌우 공백제거
	if(subject.length<2) {
		alert("작성자 2글자 이상 입력해 주세요");
		document.getElementById("subject").focus(); // 작성자칸에 커서 생성
		return false; // 전송하지 않음
	}

	// 3) 내용 2글자 이상 입력
	var content= document.getElementById("content").value; // 작성자 가져오기
	content = content.trim(); // 좌우 공백제거
	if(content.length<2) {
		alert("작성자 2글자 이상 입력해 주세요");
		document.getElementById("content").focus(); // 작성자칸에 커서 생성
		return false; // 전송하지 않음
	}

	// 4) 비밀번호는 4글자 이상이면서, 숫자형 기호만 입력
	var passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<4 || isNaN(passwd)) {
		alert("비밀번호를 4글자 이상 숫자로 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}

	return true; // onsubmit 이벤트에서 서버로 전송

}

function pwCheck() {
	var passwd = document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<4 || isNaN(passwd)) {
		alert("비밀번호를 4글자 이상 숫자로 입력해 주세요");
		document.getElementById("passwd").focus();
		return false;
	}
	var message="진행된 내용은 복구되지 않습니다\n계속 진행하겠습니까?";
	if(confirm(message)) { // 확인true, 취소false
		return true; // 서버로 전송
	}else {
		return false;
	}
}

function loginCheck() { // 로그인 유효성검사(아이디, 비번)
	// 1) 아이디 5~10글자이내인지 검사
	var id = document.getElementById("id").value;
	id = id.trim(); // 좌우 공백제거
	if(id.length<5 || id.length>10) {
		alert("아이디 5~10글자이내 입력해 주세요");
		document.getElementById("id").focus();
		return false; // 전송하지 않음
	}

	// 2) 비밀번호 5~10글자이내인지 검사
	var passwd= document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<5 || passwd.length>10) {
		alert("비밀번호 5~10글자이내 입력해 주세요");
		document.getElementById("passwd").focus();
		return false; // 전송하지 않음
	}

	return true;
}

function idCheck() { // 아이디 중폭확인 //3
	// bootstrap 모달창
	//-> 부모창과 자식창이 한몸으로 구성되어 있음
	//-> 참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp
	
	// 새창만들기
	//-> 부모창과 자식창이 별개로 구성되어 있음
	//-> 모바일에 기반을 둔 frontend단에서는 사용하지 말것
	//-> 참조 https://www.w3schools.com/jsref/met_win_open.asp
	//window.open("파일명", "새창이름", "다양한 옵션들")
	window.open("idCheckForm.jsp", "idwin", "width=400, height=350");
		
}

function emailCheck() {
	
	window.open("emailCheckForm.jsp", "emailwin", "width=400, height=350");
		
}

function memberCheck() { // 회원가입 유효성 검사
	//1)아이디 5~10글자 인지?
	var id = document.getElementById("id").value;
	id = id.trim(); // 좌우 공백제거
	if(id.length<5 || id.length>10) {
		alert("아이디 5~10글자이내 입력해 주세요");
		document.getElementById("id").focus();
		return false; // 전송하지 않음
	}
	
    //2)비밀번호 5~10글자 인지?
    var passwd= document.getElementById("passwd").value;
	passwd = passwd.trim();
	if(passwd.length<5 || passwd.length>10) {
		alert("비밀번호 5~10글자이내 입력해 주세요");
		document.getElementById("passwd").focus();
		return false; // 전송하지 않음
	}
	
    //3)비밀번호와 비밀번호확인이 서로 일치하는지?
    var passwd= document.getElementById("passwd").value;
    var repasswd= document.getElementById("repasswd").value;
	passwd = passwd.trim();
	repasswd = repasswd.trim();
	if(passwd!=repasswd) {
		alert("비밀번호를 확인해 주세요");
		document.getElementById("repasswd").focus();
		return false; // 전송하지 않음
	}

    //4)이름 두글자 이상 인지?
    var mname= document.getElementById("mname").value;
	mname = mname.trim();
	if(mname.length<2) {
		alert("이름을 2글자이상 입력해 주세요");
		document.getElementById("mname").focus();
		return false; // 전송하지 않음
	}

    //5)이메일 5글자 인지?
    var email = document.getElementById("email").value;
	email = email.trim(); // 좌우 공백제거
	if(email.length<5) {
		alert("이메일 5글자이상 입력해 주세요");
		document.getElementById("email").focus();
		return false; // 전송하지 않음
	}

    //6)직업을 선택했는지?
    var job= document.getElementById("job").value;
	if(job=="0") {
		alert("직업을 선택해 주세요");
		return false; // 전송하지 않음
	}
	
	return true;
}

function findIDCheck() { // 아이디,비번 찾기 유효성 검사
	// 1) 이름 두 글자 이상인지?

	// 2) 이메일 주소 5글자 이상인지?

}

function pdsCheck() { // 포토갤러리 유효성 검사
	// 1) 이름
	// 2) 제목
	// 3) 비밀번호

	// 4) 첨부파일
	// -> 확장명이 이미지 파일(png, jpg, gif)인지 확인하시오
	var filename=document.getElementById("filename").value; // 예) sky, png
	filename=filename.trim();
	if(filename.length==0) {
		alert("첨부 파일 선택하세요");
		return false;
	}else {
		// filename 변수값에서 마지막 . 의 순서값
		var dot=filename.lastIndexOf(".");
		// 확장명 : 마지막 . 이후 문자열 자르기
		var ext=filename.substr(dot+1);
		// 확장명을 전부 소문자 치환
		ext=ext.toLowerCase();
		if(ext=="png"||ext=="jpg"||ext=="gif") {
			return true;
		}else {
			alert("이미지 파일만 업로드 가능합니다");
			return false;
		}
	}
	
	function pwCheck2() {
		var passwd = document.getElementById("passwd").value;
		passwd = passwd.trim();
		if(passwd.length<4 || isNaN(passwd)) {
			alert("비밀번호를 4글자 이상 숫자로 입력해 주세요");
			document.getElementById("passwd").focus();
			return false;
		}
		var message="첨부파일도 삭제됩니다\n계속 진행하겠습니까?";
		if(confirm(message)) { // 확인true, 취소false
			return true; // 서버로 전송
		}else {
			return false;
		}
	}

	function ntcCheck() { // 게시판 유효성 검사
		// 1) 작성자 2글자 이상 입력
		var wname = document.getElementById("wname").value; // 작성자 가져오기
		wname = wname.trim(); // 좌우 공백제거
		if(wname.length<2) {
			alert("작성자 2글자 이상 입력해 주세요");
			document.getElementById("wname").focus(); // 작성자칸에 커서 생성
			return false; // 전송하지 않음
		}
	
		// 2) 제목 2글자 이상 입력
		var subject = document.getElementById("subject").value; // 작성자 가져오기
		subject = subject.trim(); // 좌우 공백제거
		if(subject.length<2) {
			alert("작성자 2글자 이상 입력해 주세요");
			document.getElementById("subject").focus(); // 작성자칸에 커서 생성
			return false; // 전송하지 않음
		}
	
		// 3) 내용 2글자 이상 입력
		var content= document.getElementById("content").value; // 작성자 가져오기
		content = content.trim(); // 좌우 공백제거
		if(content.length<2) {
			alert("작성자 2글자 이상 입력해 주세요");
			document.getElementById("content").focus(); // 작성자칸에 커서 생성
			return false; // 전송하지 않음
		}
	
		// 4) 비밀번호는 4글자 이상이면서, 숫자형 기호만 입력
		var passwd = document.getElementById("passwd").value;
		passwd = passwd.trim();
		if(passwd.length<4 || isNaN(passwd)) {
			alert("비밀번호를 4글자 이상 숫자로 입력해 주세요");
			document.getElementById("passwd").focus();
			return false;
		}
	
		return true; // onsubmit 이벤트에서 서버로 전송

	}

}
