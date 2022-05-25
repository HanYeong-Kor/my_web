<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>02_scopeTest</title>
</head>
<body>
	<h3>웹페이지의 SCOPE(유효범위)</h3>
<%
	pageContext.setAttribute("one", 100);
	request.setAttribute("two", 200);
	session.setAttribute("three", 300);
	application.setAttribute("uid", "HOYA");
/*
	[페이지 이동]
	1) <a href=""></a>
	2) <form action=""></form>
	3) location.href=""
	4) <jsp:forward page=""></jsp:forward>
	5) response.sendRedirect("")
*/
	
%>
<!--
	1) request.getAttribute("two") null값
	<a href="02_scopeResult.jsp">[SCOPE 결과 페이지 이동]</a>
-->

<!--
	2) request.getAttribute("two") null값
	<form action="02_scopeResult.jsp">
		<input type="submit" value="[SCOPE 결과 페이지 이동]">
	</form>
-->

<!--
	3) request.getAttribute("two") null값
	<script>
		alert("[SCOPE 결과 페이지 이동]");
		location.href="02_scopeResult.jsp";
	</script>
-->	

<%-- 
	4) 액션태그로 페이지 이동
	request.getAttribute("two") 200 접근 가능
	request내부변수는 부모페이지(02_scopeTest.jsp)와 자식페이지(02_scopeResult.jsp)에서만 유효하다
		
	<jsp:forward page="02_scopeResult.jsp"></jsp:forward>
--%>

<%
	// 5) request.getAttribute("two") null값
	//response.sendRedirect("02_scopeResult.jsp");
	
	// 6) request.getAttribute("two") 200 접근 가능
	String view="02_scopeResult.jsp";
	RequestDispatcher rd = request.getRequestDispatcher(view);
	rd.forward(request, response);
	
	/*
		내부변수					02_scopeTest.jsp(부모)				02_scopeResult.jsp(자식)
		------------------------------------------------------------------------------------
		pageContext						O									X
		request							O								 O 또는 X
		session							O									O
		application						O									O
	*/
%>

</body>
</html>