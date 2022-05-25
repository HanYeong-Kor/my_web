<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 pdsUpdateProc.jsp -->
<div class="container">
	<h3>* 포토 갤러리 수정 결과 *</h3>
<%
	try {
		String saveDirectory=application.getRealPath("/storage");
		int maxPostSize=1024*1024*10;
		String encoding="UTF-8";
		MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		String item=""; 
		String fileName="";
		long fileSize=0; 
		File file=null; 
		
		Enumeration files=mr.getFileNames();
		while(files.hasMoreElements()) {
			item=(String)files.nextElement(); 
			fileName=mr.getFilesystemName(item);
			if(fileName!=null) { 
				file=mr.getFile(item); 
				if(file.exists()) {
					fileSize=file.length();
				} // if end
			} // if end
			
		} // while end
		
		String wname = mr.getParameter("wname").trim();
		String subject = mr.getParameter("subject").trim();
		String passwd = mr.getParameter("passwd").trim();
		int pdsno=Integer.parseInt(mr.getParameter("pdsno"));
		
		dto.setPdsno(pdsno);
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(fileName);
		dto.setFilesize(fileSize);
		
		int cnt=dao.updateProc(dto);
		if (cnt==0) {
			out.println("<p>포토 갤러리 수정을 실패했습니다</p>");
			out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		}else {
			out.println("<script>");
			out.println("alert('포토 갤러리 수정이 되었습니다');");
			out.println("location.href='pdsList.jsp';");
			out.println("</script>");
		}

	}catch(Exception e) {
		out.print(e);
		out.println("<p>사진 올리기 실패</p>");
		out.println("<a href='javascript:history.back()'>[다시시도]</a>");
	}
%>
</div>
<%@ include file="../footer.jsp"%>