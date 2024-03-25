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
	String sql="update sub0321 set subject_name=?,credit=?,lecturer=?,week=?,start_hour=?,end_hour=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, na1);
	pstmt.setString(2, credit);
	pstmt.setString(3, lec);
	pstmt.setString(4, week);
	pstmt.setString(5, time1);
	pstmt.setString(6, time2);
	pstmt.setString(7, id);
	pstmt.executeUpdate();
	%>
	<script>
		alert("교과목 수정 완료");
		location.href="subList.jsp"
	</script>
</body>
</html>