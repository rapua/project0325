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
<%@ include file="dbconn.jsp"%>
<body>
	<script type="text/javascript">
		function checkForm() {
			if (frm.id.value == "") {
				frm.id.focus();
				alert("교과목 코드가 입력되지 않았습니다.");
				return false;
			}
			if (frm.name1.value == "") {
				frm.name1.focus();
				alert("교과목명이 입력되지 않았습니다.");
				return false;
			}
			if (frm.credit.value == "") {
				frm.credit.focus();
				alert("학점이 입력되지 않았습니다.");
				return false;
			}
			if (frm.lec.value == "") {
				alert("담당강사가 입력되지 않았습니다.");
				return false;
			}
			if (frm.time1.value == "") {
				frm.time1.focus();
				alert("시작시간이 입력되지 않았습니다.");
				return false;
			}
			if (frm.time2.value == "") {
				frm.time2.focus();
				alert("종료시간이 입력되지 않았습니다.");
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
		<form action="subProcess.jsp" method="post" name="frm"
			onSubmit="return checkForm()">
			<h3>교과목 추가</h3>
			<table>
				<tr>
					<th>교과목 코드</th>
					<td><input type="text" name="id" class="ju1"></td>
				</tr>
				<tr>
					<th>과 목 명</th>
					<td><input type="text" name="name1" class="name1"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit" class="name1"></td>
				</tr>
				<tr>
					<th>담 당 강 사</th>
					<td><select name="lec" class="pno" required="required">
						<option value="" class="pno">담당강사 선택</option>
							<%
							PreparedStatement pstmt = null;
							ResultSet rs = null;
							String sql = "";
							String id = "";
							String na1 = "";
							try {
								sql = "select idx,name from LECTURER0321";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
								while (rs.next()) {
									id = rs.getString(1);
									na1 = rs.getString(2);
							%>
							<option value="<%=id%>" class="pno"><%=na1%></option>
							<%
					}
					} catch (Exception e) {
					System.out.println("테이블 읽기 오류");
					System.out.println("SQL:" + e.getMessage());
					}
					%>
					</select></td>
				</tr>
				<tr>
					<th>요 일</th>
					<td><input type="radio" name="week" class=vcon value="1"
						checked="checked"> 월 <input type="radio" name="week"
						class=vcon value="2"> 화 <input type="radio" name="week"
						class=vcon value="3"> 수 <input type="radio" name="week"
						class=vcon value="4"> 목<input type="radio" name="week"
						class=vcon value="5"> 금</td>
				</tr>
				<tr>
					<th>시 작</th>
					<td><input type="text" name="time1" class="addr"></td>
				</tr>
				<tr>
					<th>종 료</th>
					<td><input type="text" name="time2" class="phone"></td>
				</tr>
				<tr>
					<td colspan="2" class="bt1"><input type="button" value="목록"
						onclick="location.href='subList.jsp'"> <input
						type="button" value="등록" onclick="checkForm()"></td>
				</tr>
			</table>
		</form>
	</section>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>