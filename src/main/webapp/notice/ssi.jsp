<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ssi.jsp 공통코드 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.bbs.*"%>
<%@ page import="net.utility.*"%>

<jsp:useBean id="dao" class="net.notice.NoticeDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.notice.NoticeDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>
