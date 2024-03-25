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

.vcon {
	display: inline-block;
	text-align: center;
	padding-left: 15px;
}

.ju1 {
	width: 70%;
	line-height: 2em;
	font-size: 1em;
}

.pno {
	width: 40%;
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
			if (frm.sn.value == "") {
				frm.sn.focus();
				alert("학번이 입력되지 않았습니다.");
				return false;
			}
			if (frm.name1.value == "") {
				frm.name1.focus();
				alert("이름이 입력되지 않았습니다.");
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
		String sn = request.getParameter("sn");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from stud0321 where studno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, sn);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String na1 = rs.getString(2);
			String dept = rs.getString(3);
			String posi = rs.getString(4);
			String addr = rs.getString(5);
			String phone = rs.getString(6);
			String hobby = rs.getString(7);
			String arr[]= hobby.split(",");
		%>
		<form action="stUpdateProcess.jsp" method="post" name="frm"
			onSubmit="return checkForm()">
			<h3>학사 정보 수정 화면</h3>
			<table>
				<tr>
					<th>학번</th>
					<td><input type="text" name="sn" class="ju1" value="<%=sn%>"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name1" class="name1" value="<%=na1%>"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><select name="dept" class="pno">
							<option value="1" class="pno" <%=dept.equals("1")?"Selected":"" %>>컴퓨터공학과</option>
							<option value="2" class="pno" <%=dept.equals("2")?"Selected":"" %>>기계공학과</option>
							<option value="3" class="pno" <%=dept.equals("3")?"Selected":"" %>>전자과</option>
							<option value="4" class="pno" <%=dept.equals("4")?"Selected":"" %>>영문학과</option>
							<option value="5" class="pno" <%=dept.equals("5")?"Selected":"" %>>일어과</option>
							<option value="6" class="pno" <%=dept.equals("6")?"Selected":"" %>>경영학과</option>
							<option value="7" class="pno" <%=dept.equals("7")?"Selected":"" %>>무역학과</option>
							<option value="8" class="pno" <%=dept.equals("8")?"Selected":"" %>>교육학과</option>
					</select></td>
				</tr>
				<tr>
					<th>학년</th>
					<td><input type="radio" name="posi" class=vcon value="1"
						<%=posi.equals("1")?"checked":""%>> 1학년 <input type="radio" name="posi"
						class=vcon value="2" <%=posi.equals("2")?"checked":""%>> 2학년 <input type="radio" name="posi"
						class=vcon value="3" <%=posi.equals("3")?"checked":""%>> 3학년 <input type="radio" name="posi"
						class=vcon value="4" <%=posi.equals("4")?"checked":""%>> 4학년</td>
				</tr>
				<tr>
					<th>취미</th>
					<td><input type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<arr.length;i++)if("프로그램".equals(arr[i])) out.print("checked");%>>프로그램
						<input type="checkbox" name="hobby" value="독서" <%for(int i=0;i<arr.length;i++)if("독서".equals(arr[i])) out.print("checked");%>>독서 <input
						type="checkbox" name="hobby" value="등산" <%for(int i=0;i<arr.length;i++)if("등산".equals(arr[i])) out.print("checked");%>>등산 <input
						type="checkbox" name="hobby" value="여행" <%for(int i=0;i<arr.length;i++)if("여행".equals(arr[i])) out.print("checked");%>>여행 <input
						type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<arr.length;i++)if("낚시".equals(arr[i])) out.print("checked");%>>낚시 <input
						type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<arr.length;i++)if("영화보기".equals(arr[i])) out.print("checked");%>>영화보기 <input
						type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<arr.length;i++)if("잠자기".equals(arr[i])) out.print("checked");%>>잠자기 <input
						type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<arr.length;i++)if("멍때리기".equals(arr[i])) out.print("checked");%>>멍때리기
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr" class="addr" value="<%=addr%>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" class="phone" value="<%=phone%>"></td>
				</tr>
				<tr>
					<td colspan="2" class="bt1"><input type="button" value="목록"
						onclick="location.href='stList.jsp'"> <input type="button" value="수정"
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