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
	String scode = request.getParameter("scode");
	String na1 = request.getParameter("name1");
	String pcode = request.getParameter("pcode");
	String qty = request.getParameter("qty");
	
	PreparedStatement pstmt = null;
	String sql = "insert into store0325 values(?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, scode);
	pstmt.setString(2, na1);
	pstmt.setString(3, pcode);
	pstmt.setString(4, qty);
	pstmt.executeUpdate();
	%>
	<script>
		alert("매장 테이블 등록 성공");
		location.href="storeList.jsp"
	</script>
</body>
</html>