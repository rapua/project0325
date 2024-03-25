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
	font-weight: 600;
}

td a {
	text-decoration: none;
}

input {
	position: relative;
	left: 45%;
	margin-top: 15px;
	padding: 2px 75px 2px 75px;
	font-size: 1em;
	background-color: #555555;
	color: white;
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
		<h2>강사 리스트</h2>
		<table>
			<tr>
				<th>강사코드</th>
				<th>강사명</th>
				<th>전공</th>
				<th>세부전공</th>
				<th>관리</th>
			</tr>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from LECTURER0321";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ct = 0;
			while (rs.next()) {
				ct++;
				String id = rs.getString(1);
				String na1 = rs.getString(2);
				String major = rs.getString(3);
				String field = rs.getString(4);
			%>
			<tr>
				<td><%=id%></td>
				<td><%=na1%></td>
				<td><%=major%></td>
				<td><%=field%></td>
				<td class="l1"><a href="teUpdate.jsp?id=<%=id%>">수정</a>/<a
					href="teDelete.jsp?id=<%=id%>"
					onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="button" value="작성"
			onclick="location.href='addTe.jsp'">
		<p>
			총
			<%=ct%>명의 강사가 있습니다.
		</p>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>