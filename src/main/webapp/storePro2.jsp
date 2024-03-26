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
	padding-top: 1%;
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
		<h2>상품/매장(금액) 정보 목록</h2>
		<table>
			<tr>
				<th>no</th>
				<th>상품코드</th>
				<th>상 품 명</th>
				<th>매장코드</th>
				<th>매 장 명</th>
				<th>단 가</th>
				<th>수 량</th>
				<th>금 액</th>
			</tr>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select a.productcode, a.productname, a.storecode, b.storename , to_char(a.unitprice, '999,999,999'), a.stockqty from product0325 a, store0325 b where b.storecode=a.storecode order by a.productcode";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ct = 0;
			while (rs.next()) {
				ct++;
				String pcode = rs.getString(1);
				String pname = rs.getString(2);
				String scode = rs.getString(3);
				String store = rs.getString(4);
				String price = rs.getString(5);
				String qty = rs.getString(6);
				String p2 = price.trim();
				String p3 = p2.replaceAll(",", "");
				int total1 = Integer.parseInt(p3) * Integer.parseInt(qty);
				String total2 = total1+"";
				String total3 = total2.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
			%>
			<tr>
				<td><%=ct%></td>
				<td><%=pcode%></td>
				<td><%=pname%></td>
				<td><%=scode%></td>
				<td><%=store%></td>
				<td><%=price%></td>
				<td><%=qty%></td>
				<td><%=total3%></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="button" value="상품 정보 추가"
			onclick="location.href='addPro.jsp'">
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>