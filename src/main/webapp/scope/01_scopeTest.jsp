<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>01_scopeTest</title>
</head>
<body>
	<h3>내장객체 및 내부변수</h3>
<%
/*
	[JSP 내부객체]
	- JSP페이지가 서블릿Servlet(WAS)에서 변환될때(.class)
	- JSP페이지 내에서 제공하는 특수한 레퍼런스(참조) 타입의 변수
	- 객체 생성 없이 바로 사용할 수 있는 JSP의 객체
	
	1) out
	2) pageContext : JSP페이지 자체의  Context 제공
	3) request : 사용자 요청에 관한 정보
	4) response : 응답에 관한 정보
	5) session : 요청에 관한 Context 제공
	6) application : 서블릿 및 외부 환경 정보 Context 제공
	---------------------------------------------------------------------------------

	[Scope의 종류]
	- myweb 프로젝트에서 페이지들간에 값을 공유하기 위해 사용
	1) pageContext : 현재 페이지에서만 유효. 기본값
	2) request : 부모페이지와 자식페이지에서만 유효
	3) session : myweb프로젝트의 모든 페이지에서 유효 (사용자 개별 접근, 시간)
	4) application : myweb프로젝트의 모든 페이지에서 유효 (모든 사용자 접근, 서버정보)
	---------------------------------------------------------------------------------
	
	[내부변수 선언 형식]
	1) pageContext.setAttribute("변수명", 값)
	2) request.setAttribute("변수명", 값)
	3) session.setAttribute("변수명", 값)
	4) application.setAttribute("변수명", 값)

	[내부변수값 가져오기]
	1) pageContext.getAttribute("변수명")
	2) request.getAttribute("변수명")
	3) session.getAttribute("변수명")
	4) application.getAttribute("변수명")
	---------------------------------------------------------------------------------				
*/

	// 각 내부변수에 값 올리기
	pageContext.setAttribute("kor", 100);
	request.setAttribute("eng", 200);
	session.setAttribute("mat", 300);
	application.setAttribute("uname", "HOYA");
	
	// 내부 변수값 가져오기
	out.print(pageContext.getAttribute("kor"));
	out.print("<hr>");
	out.print(request.getAttribute("eng"));
	out.print("<hr>");
	out.print(session.getAttribute("mat"));
	out.print("<hr>");
	out.print(application.getAttribute("uname"));
	out.print("<hr>");
	
	Object obj=pageContext.getAttribute("kor");
	int kor=(int)obj;
	int eng=(int)request.getAttribute("eng");
	int mat=(int)session.getAttribute("mat");
	String uname=(String)application.getAttribute("uname");
	
	out.print("1) pageContext 영역 : " + kor + "<hr>");
	out.print("2) request 영역 : " + eng + "<hr>");
	out.print("3) session 영역 : " + mat + "<hr>");
	out.print("4) application 영역 : " + uname + "<hr>");
	
	// 내부 변수 삭재
	pageContext.removeAttribute("kor");
	request.removeAttribute("eng");
	session.removeAttribute("mat");
	application.removeAttribute("uname");
	
	// null값 반환
	out.print("<p>* SCOPE영역 변수 삭제 후 *</p>");
	out.print("1) pageContext 영역 : " + pageContext.getAttribute("kor") + "<hr>");
	out.print("2) request 영역 : " + request.getAttribute("eng") + "<hr>");
	out.print("3) session 영역 : " + session.getAttribute("mat") + "<hr>");
	out.print("4) application 영역 : " + application.getAttribute("uname") + "<hr>");
	
%>
</body>
</html>