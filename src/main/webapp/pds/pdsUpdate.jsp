<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 pdsUpdate.jsp -->

<div class="container">
	<h3>* 사직삭제 *</h3>
	<p><a href="pdsList.jsp">[글목록]</a></p>
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	dto=dao.read(pdsno);
	if(dto==null) {
		out.println("해당 글 없음");
	}else { //수정하고자 하는 행을 수정폼에 출력 (pdsForm.jsp 참조)
%>
		<form name="photofrm.jsp" method="post" action="pdsUpdateProc.jsp" enctype="multipart/form-data" onsubmit="return pdsCheck()">
			<input type="hidden" name="pdsno" value="<%=pdsno%>">
			<table class="table">
				<tr>
				    <th>이름</th>
				    <td style="text-align: left"><input type="text" name="wname" id="wname" value="<%=dto.getWname()%>" size="20" maxlength="100" required autofocus></td>
				</tr>
				<tr>
				    <th>제목</th>
				    <td style="text-align: left">
				    	<textarea rows="5" cols="30" name="subject" id="subject"><%=dto.getSubject()%></textarea>
				    </td>
				</tr>
				<tr>
				    <th>비밀번호</th>
				    <td style="text-align: left"><input type="password" name="passwd" id="passwd"></td>
				</tr>
				<tr>
				    <th>첨부파일</th>
				    <td style="text-align: left"><input type="file" name="filename" id="filename" value="<%=dto.getFilename()%>"></td>
				</tr>
				<tr>
				    <td colspan="2">
				    	  <input type="submit" value="수정" class="btn btn-success">
				    	  <input type="reset"  value="취소"      class="btn btn-danger">
				    </td>
				</tr>
			</table>
		</form>
<%
	}
%>
	
</div>
<%@ include file="../footer.jsp"%>