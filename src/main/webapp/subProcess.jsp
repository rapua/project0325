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
	String credit = request.getParameter("credit");
	String lec = request.getParameter("lec");
	String week = request.getParameter("week");
	String time1 = request.getParameter("time1");
	String time2 = request.getParameter("time2");
	PreparedStatement pstmt = null;
	String sql = "insert into sub0321 values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, na1);
	pstmt.setString(3, credit);
	pstmt.setString(4, lec);
	pstmt.setString(5, week);
	pstmt.setString(6, time1);
	pstmt.setString(7, time2);
	pstmt.executeUpdate();
	%>
	<script>
		alert("교과목 저장 완료");
		location.href="subList.jsp"
	</script>
</body>
</html>