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

section {
	box-sizing: border-box;
	height: 83%;
	width: 85%;
	position: absolute;
	top: 12%;
	left: 15%;
}

html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

section h2 {
	text-align: center;
	padding: 2% 0 2% 0;
}

section h3 {
	text-align: center;
	font-size: 2em;
}

table {
	margin: auto;
	width: 50%;
	height: 50%;
	border: 2px solid black;
}

tr {
	border: 1px solid black;
}

th {
	border: 1px solid black;
	padding: 9px 30px 9px 30px;
	background-color: #eee;
}

td {
	border: 1px solid black;
}

.bt1 {
	padding: 3px;
}

.bt1 input {
	position: relative;
	left: 30%;
	width: 20%;
	height: 90%;
	padding: 2px 10px 2px 10px;
	font-size: 1em;
	background-color: #555555;
	color: white;
}

select {
	width: 25%;
	height: 90%;
	padding-top: 0.4em;
	padding-bottom: 0.4em;
	font-size: 1em;
	line-height: 2em;
}

.ju1 {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}

.name1 {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}

.addr {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}

.phone {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}
</style>
</head>
<body>
	<script type="text/javascript">
		function checkForm() {
			
			if (frm.name1.value == "") {
				frm.name1.focus();
				alert("강사명이 입력되지 않았습니다.");
				return false;
			}
			if (frm.major.value == "") {
				frm.major.focus();
				alert("전공이 입력되지 않았습니다.");
				return false;
			}
			if (frm.field.value == "") {
				frm.field.focus();
				alert("세부전공이 입력되지 않았습니다.");
				return false;
			}
			
			document.frm.submit();
		}
	</script>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<nav>
		<%@ include file="nav.jsp"%>
	</nav>
	<section>
		<%@ include file="dbconn.jsp" %>
	<% 
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from LECTURER0321 where idx=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String na1 = rs.getString(2);
			String major = rs.getString(3);
			String field = rs.getString(4);
		%>
		<form action="teUpdateProcess.jsp" method="post" name="frm"
			onSubmit="return checkForm()">
			<h3>강사 수정</h3>
			<table>
				<tr>
					<th>강사 ID</th>
					<td><input type="text" name="id" class="ju1" value="<%=id%>">자동증가(마지막번호+1)</td>
				</tr>
				<tr>
					<th>강 사 명</th>
					<td><input type="text" name="name1" class="name1" value="<%=na1%>"></td>
				</tr>
				<tr>
					<th>전 공</th>
					<td><input type="text" name="major" class="addr" value="<%=major%>"></td>
				</tr>
				<tr>
					<th>세부 전공</th>
					<td><input type="text" name="field" class="phone" value="<%=field%>"></td>
				</tr>
				<tr>
					<td colspan="2" class="bt1"><input type="button" value="목록"
						onclick="location.href='teList.jsp'"> <input type="button" value="수정"
						onclick="checkForm()"></td>
				</tr>
				<% 
				}
				%>
			</table>
		</form>
	</section>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>