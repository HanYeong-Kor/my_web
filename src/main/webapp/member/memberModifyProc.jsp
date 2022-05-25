<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 memberModify.jsp-->
<div>
	<h3>* 회/원/수/정 결과 *</h3>
<%
	// memberProc.jsp 참조
	
	// 1) 사용자가 입력 요청한 값 가져오기
	String passwd = request.getParameter("passwd").trim();
	String mname = request.getParameter("mname").trim();
	String email = request.getParameter("email").trim();
	String tel = request.getParameter("tel").trim();
	String zipcode = request.getParameter("zipcode").trim();
	String address1 = request.getParameter("address1").trim();
	String address2 = request.getParameter("address2").trim();
	String job = request.getParameter("job").trim();

	// 2) dto객체 담기
	dto.setId((String)session.getAttribute("s_id"));
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setEmail(email);
	dto.setTel(tel);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);

	// 3) member테이블에 추가하기
	int cnt=dao.modifyProc(dto);
	if(cnt==0) {
		out.println("<p>회원 정보 수정 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else {
		out.println("<script>");
		out.println("alert('회원 정보 수정 되었습니다');");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
%>		
</div>
<!-- 본문 끝 -->           
<%@ include file="../footer.jsp"%>