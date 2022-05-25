<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 pdsDel.jsp -->
<!-- 글번호(pdsno)와 비밀번호(passwd)가 일치하면 행삭제 및 첨부파일 삭제 -->
<%
int pdsno=Integer.parseInt(request.getParameter("pdsno"));
%>
<div class="container">
	<h3>* 사직삭제 *</h3>
	<p><a href="pdsList.jsp">[글목록]</a></p>
	<form method="post" action="pdsDelProc.jsp" onsubmit="return pwCheck2()"> <!-- myscript.js -->
		<input type="hidden" name="pdsno" value="<%=pdsno%>">
		<table class="table">
			<tr>
				<th class="success">비밀번호</th>
				<td><input type="password" name="passwd" id="passwd" maxlength="15" required></td>
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