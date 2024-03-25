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
		String sn = request.getParameter("sn");
		String sql="delete from stud0321 where studno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sn);
		pstmt.executeUpdate();
	%>
	<script>
		alert("학사 정보 삭제 완료");
		location.href="stList.jsp"
	</script>
</body>
</html>