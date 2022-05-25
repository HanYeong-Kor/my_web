<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Index</title>
	
	<link rel="stylesheet" href="./css/layout.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 메인 카테고리 -->
	<nav class="navbar navbar-default">
  		<div class="container">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>                        
      			</button>
      			<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">Home</a>
    		</div>
    		<div class="collapse navbar-collapse" id="myNavbar">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="./bbs/bbsList.jsp">게시판</a></li>
        			<li><a href="./notice/noticelist.jsp">공지사항</a></li>
        			<li><a href="./member/loginForm.jsp">로그인</a></li>
        			<li><a href="./pds/pdslist.jsp">포토갤러리</a></li>
        			<li><a href="./mail/mailForm.jsp">문의</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>

	<!-- Contents -->
	<div class="container-fluid bg-3 text-center">    
  		<div class="row">
    		본문은 여기에 작성해 주세요
  		</div>
	</div>

	<!-- Footer -->
	<footer class="container-fluid bg-4 text-center">
  		Copyright &copy; 2022 MYWEB
	</footer>
</body>
</html>