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

.name1 {
	width: 30%;
	line-height: 2em;
	font-size: 1em;
}
.scode {
	width: 70%;
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

</style>
</head>
<%@ include file="dbconn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	int code=0;
	String store="";
	String pname="";
	String pcode=request.getParameter("pcode");
	try{
		sql = "select max(storecode) from store0325";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			code=rs.getInt(1)+1;
		}else{
			code=1;
		}
		sql = "select productname from product0325 where productcode=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pcode);
		rs = pstmt.executeQuery();
		pname = request.getParameter("pname");
		store = request.getParameter("name1");
		if(rs.next()){
			pname=rs.getString(1);
		}else if(pcode==null){
			pname="";
			store="";
			pcode="";
		}else{
			%><script>
			alert("등록되어 있지 않는 상품코드 입니다.");
			</script>
			<%
			pcode="";
			pname="";
		}
	}catch(Exception e){
		System.out.println("테이블 읽기 오류");
		System.out.println("SQL:"+e.getMessage());
	}
%>
<body>
	<script type="text/javascript">
		function checkForm() {
			
			if (frm.name1.value == "") {
				frm.name1.focus();
				alert("매장명이 입력되지 않았습니다.");
				return false;
			}
			if (frm.pcode.value == "") {
				frm.pcode.focus();
				alert("상품코드가 입력되지 않았습니다.");
				return false;
			}
			
			frm.action = "storeProcess.jsp";
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
		<form action="addStore.jsp" method="post" name="frm"
			onSubmit="return checkForm()">
			<h3>매장 등록 화면</h3>
			<table>
				<tr>
					<th>매장 코드(자동생성)</th>
					<td><input type="text" name="scode" class="scode" value="<%=code%>">마지막번호+1</td>
				</tr>
				<tr>
					<th>매 장 명</th>
					<td><input type="text" name="name1" class="name1" value="<%=store%>"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="pcode" class="pcode" onchange="onchanesubmit()" value="<%=pcode%>"></td>
				</tr>
				<tr>
					<th>상 품 명</th>
					<td><input type="text" name="pname" class="pname" value="<%=pname%>"></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="qty" class="qty"></td>
				</tr>
				<tr>
					<td colspan="2" class="bt1"><input type="submit" value="등록"
						onclick="checkForm()"> <input type="button" value="취소"
						onclick="location.href='index.jsp'"></td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>