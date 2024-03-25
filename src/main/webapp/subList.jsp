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
		<h2>교과목 목록</h2>
		<table>
			<tr>
				<th>no</th>
				<th>강사코드</th>
				<th>담당강사</th>
				<th>과목코드</th>
				<th>과목명</th>
				<th>학점</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>관리</th>
			</tr>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select a.id, a.subject_name, a.credit, a.lecturer, a.week, a.start_hour, a.end_hour, b.idx from sub0321 a, lecturer0321 b where b.idx=a.lecturer order by b.idx, a.id";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ct = 0;
			while (rs.next()) {
				ct++;
				String id = rs.getString(1);
				String na1 = rs.getString(2);
				String credit = rs.getString(3);
				String lec = rs.getString(4);
				String week = rs.getString(5);
				String starth = rs.getString(6);
				String endh = rs.getString(7);
				String idx = rs.getString(8);
			%>
			<tr>
				<td><%=ct%></td>
				<td><%=idx%></td>
				<td><%=lec.equals("1")?"김교수":lec.equals("2")?"이교수":lec.equals("3")?"박교수":lec.equals("4")?"우교수":lec.equals("5")?"최교수":lec.equals("6")?"강교수":lec.equals("7")?"황교수":""%></td>
				<td><%=id%></td>
				<td><%=na1%></td>
				<td><%=credit%></td>
				<td><%=week.equals("1")?"월":week.equals("2")?"화":week.equals("3")?"수":week.equals("4")?"목":week.equals("5")?"금":""%></td>
				<td><%=starth%></td>
				<td><%=endh%></td>
				<td class="l1"><a href="subUpdate.jsp?id=<%=id%>">수정</a>/<a
					href="subDelete.jsp?id=<%=id%>"
					onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="button" value="작성"
			onclick="location.href='addSub.jsp'">
		<p>
			총
			<%=ct%>개의 교과목이 있습니다.
		</p>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>