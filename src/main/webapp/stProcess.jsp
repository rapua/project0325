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
	String sn = request.getParameter("sn");
	String na1 = request.getParameter("name1");
	String dept = request.getParameter("dept");
	String posi = request.getParameter("posi");
	String [] val = request.getParameterValues("hobby");
	String hobby="";
	if(val!=null){
		for(int i=0;i<val.length;i++){
			if(i==(val.length-1)){
				hobby+=val[i];
			}else{
				hobby+=val[i]+",";
			}
		}
	}
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	PreparedStatement pstmt = null;
	String sql = "insert into stud0321 values(?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, sn);
	pstmt.setString(2, na1);
	pstmt.setString(3, dept);
	pstmt.setString(4, posi);
	pstmt.setString(5, addr);
	pstmt.setString(6, phone);
	pstmt.setString(7, hobby);
	pstmt.executeUpdate();
	%>
	<script>
		alert("등록이 완료되었습니다!");
		location.href="stList.jsp"
	</script>
</body>
</html>