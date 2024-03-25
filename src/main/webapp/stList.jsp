<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	margin: 0 auto;
	padding: 0;
	width: 100%;
	height: 100%;
}

div {
	box-sizing: border-box;
	height: 83%;
	width: 85%;
	position: absolute;
	top: 12%;
	left: 15%;
}
div h2 {
	text-align: center;
}

h1 {
	margin-top: 20px;
	margin-bottom: 0;
	font-size: 1.5em;
}

table {
	margin: 0 auto;
	margin-top: 1%;
	width: 80%;
	border: 2px solid black;
}

tr {
	border: 1px solid black;
}

th {
	border: 1px solid black;
	padding: 10px;
	background-color: #eee;
}

td {
	border: 1px solid black;
	text-align: center;
	padding: 10px;
	font-weight: 600;
}

td a {
	text-decoration: none;
}

input {
	position: relative;
	left: 44%;
	margin-top: 15px;
	padding: 2px 50px 2px 50px;
	font-size: 1em;
	background-color: #eee;
}
div p {
	position: absolute;
	top: 2%;
	left: 10%;
}
</style>
</head>
<body>
	<%@ include file="dbconn.jsp"%>

	<header>
		<%@ include file="header.jsp"%>
	</header>
	<nav>
		<%@ include file="nav.jsp"%>
	</nav>
	<div>
		<h2>학사정보 목록</h2>
		<table>
			<tr>
				<th>학번</th>
				<th>성명</th>
				<th>학과</th>
				<th>학년</th>
				<th>주소</th>
				<th>연락처</th>
				<th>취미</th>
				<th>관리</th>
			</tr>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select studno,name,dept,position,address,phone,hobby from stud0321";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ct = 0;
			while (rs.next()) {
				ct++;
				String sn = rs.getString(1);
				String na1 = rs.getString(2);
				String dept = rs.getString(3);
				String posi = rs.getString(4);
				String addr = rs.getString(5);
				String phone = rs.getString(6);
				String hobby = rs.getString(7);
			%>
			<tr>
				<td><%=sn%></td>
				<td><%=na1%></td>
				<td><%=dept%></td>
				<td><%=posi%></td>
				<td><%=addr%></td>
				<td><%=phone%></td>
				<td><%=hobby%></td>
				<td class="l1"><a href="stUpdate.jsp?sn=<%=sn%>">수정</a>/<a
					href="stDelete.jsp?sn=<%=sn%>"
					onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="button" value="학사정보 추가"
			onclick="location.href='addSt.jsp'">
		<p>
			총
			<%=ct%>명의 학사정보가 있습니다.
		</p>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>