<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc</title>
</head>
<body> <!-- 5 -->
	<div style="text-align: center">
		<h3>* 이메일 중복확인 *</h3>
<%
		String email=request.getParameter("email").trim();
		int cnt=dao.duplecateEmail(email);
		out.println("입력Email : <strong>" + email + "</strong>");
		if(cnt==0) {
			out.println("<p>사용 가능한 이메일 입니다</p>");
			// 사용 가능한 id를 부모창에 전달하기
			out.println("<a href='javascript:apply(\"" + email + "\")'>[적용]</a>");
%>
			<script>
				function apply(email) {
					//alert(id);
					// 중복 확인된 id를 부모창(opener)에 적용
					opener.document.memfrm.email.value=email;
					window.close();
				}
			</script>
<%			
		}else {
			out.println("<p style='color:red'>해당 이메일은 사용할 수 없습니다</p>");
		}
%>
		&nbsp;&nbsp;
		<a href="javascript:window.close()">[창닫기]</a>
	</div>
</body>
</html>