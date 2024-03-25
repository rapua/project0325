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
	String pcode = request.getParameter("pcode");
	String na1 = request.getParameter("name1");
	String scode = request.getParameter("scode");
	String price = request.getParameter("price");
	String qty = request.getParameter("qty");
	
	PreparedStatement pstmt = null;
	String sql = "insert into product0325 values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pcode);
	pstmt.setString(2, na1);
	pstmt.setString(3, scode);
	pstmt.setString(4, price);
	pstmt.setString(5, qty);
	pstmt.executeUpdate();
	%>
	<script>
		alert("상품 테이블 등록 성공");
		location.href="proList.jsp"
	</script>
</body>
</html>