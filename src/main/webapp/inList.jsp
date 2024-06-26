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
		<h2>입고 정보(금액) 목록</h2>
		<table>
			<tr>
				<th>no</th>
				<th>입.출고일자</th>
				<th>매장코드</th>
				<th>매 장 명</th>
				<th>상품코드</th>
				<th>상 품 명</th>
				<th>입고수량</th>
				<th>단가</th>
				<th>입고금액</th>
			</tr>
			<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select to_char(a.inoutdate, 'yyy-mm-dd'), a.storecode, b.storename, a.productcode, c.productname, a.gubun, a.saleqty, c.unitprice from inout0325 a, store0325 b, product0325 c where b.storecode = a.storecode and c.productcode = a.productcode and a.gubun<2 order by a.inoutdate, a.storecode";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ct = 0;
			while (rs.next()) {
				ct++;
				String iodate = rs.getString(1);
				String scode = rs.getString(2);
				String store = rs.getString(3);
				String pcode = rs.getString(4);
				String pname = rs.getString(5);
				String gubun = rs.getString(6);
				String qty = rs.getString(7);
				int price = rs.getInt(8);
				String price2 = rs.getString(8);
				String price3 = price2.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
				int q1=Integer.parseInt(qty);
				int total1 = price * q1;
				String total2 = total1+"";
				String total3 = total2.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
				String in1, out1;
				if(gubun.equals("1")){
					in1 = qty;
					out1 = "";
				}else{
					out1 = qty;
					in1 = "";
				}
			%>
			<tr>
				<td><%=ct%></td>
				<td><%=iodate%></td>
				<td><%=scode%></td>
				<td><%=store%></td>
				<td><%=pcode%></td>
				<td><%=pname%></td>
				<td><%=in1%></td>
				<td><%=price3%></td>
				<td><%=total3%></td>
			</tr>
			<%
			}
			%>
		</table>
		<input type="button" value="입출고 정보 추가"
			onclick="location.href='addInout.jsp'">
	</div>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>