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
	left: 43.5%;
	margin-top: 15px;
	padding: 10px 50px 10px 50px;
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
		<h2>상품 정보 목록</h2>
		<table>
			<tr>
				<th>no</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>매장코드</th>
				<th>매장명</th>
				<th>단가</th>
				<th>재고수량</th>
				<th>관리</th>
			</tr>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select a.productcode, a.productname, a.storecode, b.storename, to_char(a.unitprice,'999,999,999'), a.stockqty from product0325 a, store0325 b where b.storecode=a.storecode";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ct = 0;
			while (rs.next()) {
				ct++;
				String pcode = rs.getString(1);
				String na1 = rs.getString(2);
				String scode = rs.getString(3);
				String store = rs.getString(4);
				String price = rs.getString(5);
				String qty = rs.getString(6);
			%>
			<tr>
				<td><%=ct%></td>
				<td bgcolor="#aaa"><a href="proUpdate.jsp?pcode=<%=pcode%>"><%=pcode%></a></td>
				<td><%=na1%></td>
				<td><%=scode%></td>
				<td><%=store%></td>
				<td><%=price%></td>
				<td><%=qty%></td>
				<td class="l1"><a
					href="proDelete.jsp?pcode=<%=pcode%>"
					onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="button" value="상품 정보 추가"
			onclick="location.href='addPro.jsp'">
		<p>
			총
			<%=ct%>개의 상품정보가 있습니다.
		</p>
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>