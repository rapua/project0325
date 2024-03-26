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
	width: 75%;
	height: 50%;
	border: 2px solid black;
}

tr {
	border: 1px solid black;
}

th {
	border: 1px solid black;
	padding: 10px 0px 10px 0px;
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
	background-color: #eee;
}

select {
	width: 25%;
	height: 90%;
	padding-top: 0.4em;
	padding-bottom: 0.4em;
	font-size: 1em;
	line-height: 2em;
}

.pcode {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}

.store {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}

.scode {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}
.iodate {
	width: 28.5%;
	line-height: 2em;
	font-size: 1em;
}

.pname {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}

.qty {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}
.io {
	display: inline-block;
	text-align: center;
	padding-left: 15px;
}

</style>
</head>
<%@ include file="dbconn.jsp"%>
<%
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "";
String iodate="";
String store = "";
String pname = "";
String qty = "";
String stockp = "";
String scode = request.getParameter("scode");
String pcode = request.getParameter("pcode");
try {
	sql = "select b.storename, a.productname from product0325 a, store0325 b where a.productcode=? and a.storecode=? and b.storecode=a.storecode";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pcode);
	pstmt.setString(2, scode);
	rs = pstmt.executeQuery();
	pname = request.getParameter("pname");
	store = request.getParameter("store");
	iodate=request.getParameter("iodate");
	qty = request.getParameter("qty");
	stockp = request.getParameter("stockprice");
	if (rs.next()) {
		store = rs.getString(1);
		pname = rs.getString(2);
	} else if (scode == null || pcode == null) {
		iodate = "";
		pname = "";
		store = "";
		pcode = "";
		scode = "";
		pcode = "";
		qty = "0";
		stockp = "0";
	} else {
%><script>
				alert("등록되어 있지 않는 코드 입니다.");
			</script>
<%
pcode = "";
pname = "";
store = "";
scode = "";
qty = "0";
stockp = "0";
}
} catch (Exception e) {
System.out.println("테이블 읽기 오류");
System.out.println("SQL:" + e.getMessage());
}
%>
<body>
	<script type="text/javascript">
		function checkForm() {

			if (frm.pcode.value == "") {
				frm.pcode.focus();
				alert("상품코드가 입력되지 않았습니다.");
				return false;
			}

			frm.action = "inoutProcess.jsp";
		}
		function onchanesubmit() {
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
		<form action="addInout.jsp" method="post" name="frm"
			onSubmit="return checkForm()">
			<h3>입출고 정보 등록</h3>
			<table>
				<tr>
					<th>입출고일자</th>
					<td colspan="3"><input type="text" name="iodate" class="iodate"
						value="<%=iodate%>"></td>
				</tr>
				<tr>
					<th>매장코드</th>
					<td><input type="text" name="scode" class="scode"
						value="<%=scode%>"></td>
					<th>매 장 명</th>
					<td><input type="text" name="store" class="store"
						value="<%=store%>"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="pcode" class="pcode"
						onchange="onchanesubmit()" value="<%=pcode%>"></td>
					<th>상 품 명</th>
					<td><input type="text" name="pname" class="pname"
						value="<%=pname%>"></td>
				</tr>
				<tr>
					<th>입출고 구분</th>
					<td colspan="3"><input type="radio" name="io" class=io
						value="1"> 입고 <input type="radio" name="io" class=io
						value="2"> 출고</td>
				</tr>
				<tr>
					<th>입출고 수량</th>
					<td><input type="text" name="qty" class="qty" value="<%=qty%>"></td>
					<th>입출고 금액</th>
					<td><input type="text" name="stockprice" class="qty" value="<%=stockp%>"></td>
				</tr>
				<tr>
					<td colspan="4" class="bt1"><input type="button" value="목록"
						onclick="location.href='inoutList.jsp'"> <input
						type="submit" value="저장" onclick="checkForm()"></td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>