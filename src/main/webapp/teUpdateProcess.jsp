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
	String id = request.getParameter("id");
	String na1 = request.getParameter("name1");
	String major = request.getParameter("major");
	String field = request.getParameter("field");
	PreparedStatement pstmt = null;
	String sql="update LECTURER0321 set name=?,major=?,field=? where idx=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, na1);
	pstmt.setString(2, major);
	pstmt.setString(3, field);
	pstmt.setString(4, id);
	pstmt.executeUpdate();
	%>
	<script>
		alert("수정 완료");
		location.href="teList.jsp"
	</script>
</body>
</html>