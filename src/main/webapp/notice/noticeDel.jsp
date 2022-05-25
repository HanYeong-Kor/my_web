<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 noticeDel.jsp -->
<!-- 글번호(ntcno)와 비밀번호(passwd)가 일치하면 삭제 -->
<%
int ntcno=Integer.parseInt(request.getParameter("ntcno"));
%>
<h3>* 공지사항 삭제 *</h3>
<p><a href="noticeList.jsp">[공지사항 목록]</a></p>
<div class="container">
	<form method="post" action="noticeDelProc.jsp" onsubmit="return pwCheck()"> <!-- myscript.js -->
		<input type="hidden" name="ntcno" value="<%=ntcno%>">
		<table class="table">
			<tr>
				<th class="success">비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" required></td>
			</tr>
			<tr>
				<td colspan="2">
			    	<input type="submit" value="삭제" class="btn btn-danger">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../footer.jsp"%>