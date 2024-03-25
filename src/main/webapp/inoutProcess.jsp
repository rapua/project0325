<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
	String iodate = request.getParameter("iodate");
	String scode = request.getParameter("scode");
	String pcode = request.getParameter("pcode");
	String io = request.getParameter("io");
	String qty = request.getParameter("qty");
	
	PreparedStatement pstmt = null;
	String sql = "insert into inout0325 values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, iodate);
	pstmt.setString(2, scode);
	pstmt.setString(3, pcode);
	pstmt.setString(4, io);
	pstmt.setString(5, qty);
	pstmt.executeUpdate();
	%>
	<script>
		alert("입출고 테이블 등록 성공");
		location.href="inoutList.jsp"
	</script>
</body>
</html>