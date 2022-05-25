<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emailCheckForm</title>
</head>
<body>
	<div style="text-align: center">
		<h3>* 이메일 중복확인 *</h3>
		<form action="emailCheckProc.jsp" onsubmit="return blankCheck()"> <!-- 4 -->
			이메일 : <input type="text" name="email" id="email" maxlength="50" autofocus>
			<input type="submit" value="중복확인">	
		</form>
	</div>
	
	<script>
		function blankCheck() {
			var email=document.getElementById("email").value;
			email=email.trim();
			if(email.length<10) {
				alert("이메일은 10글자 이상으로 입력해 주세요");
				return false;
			}
			
			return true;
		}
	</script>
	
</body>
</html>