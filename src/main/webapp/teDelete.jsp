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
		PreparedStatement pstmt = null;
		String id = request.getParameter("id");
		String sql="delete from LECTURER0321 where idx=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
	%>
	<script>
		alert("강사 삭제 완료");
		location.href="teList.jsp"
	</script>
</body>
</html>