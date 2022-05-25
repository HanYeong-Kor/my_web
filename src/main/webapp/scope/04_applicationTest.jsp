<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../bbs/ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_applicationTest</title>
</head>
<body>
	<h3>application 내부객체</h3>
<%
	/*
		[application 내부객체]
		- ServletContext application
		- 서버에 대한 정보를 관리하는 객체
		- 사용자 모두가 공유하는 전역적 의미의 객체
	*/
	
	// /bbs폴더의 실제 물리적인 경로
	// 웹경로 http://localhost:9090/myweb/bbs
	// 실제 물리적 경로 C:\Users\HOYA\Documents\java202202\workspace\myweb\src\main\webapp\bbs
	out.print(application.getRealPath("/bbs")); // 추천
	out.print("<hr>");
	out.print(request.getRealPath("/bbs"));
	out.print("<hr>");
	
	// application 내부 변수
	application.setAttribute("uid", "별나무");
	out.print(application.getAttribute("uid"));
	out.print("<hr>");
	//-------------------------------------------------------------------------------------------
	
	// [response 내부객체] - 요청한 사용자에게 응답할 때
	//response.sendRedirect("") 페이지 이동
	
	// 요청한 사용자에게 응답메세지 전송 (AJAX에서 많이 사용)
	PrintWriter print=response.getWriter();
	
%>
</body>
</html>