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
		<form action="stProcess.jsp" method="post" name="frm"
			onSubmit="return checkForm()">
			<h3>학사 정보 등록 화면</h3>
			<table>
				<tr>
					<th>학번</th>
					<td><input type="text" name="sn" class="ju1"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name1" class="name1"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><select name="dept" class="pno">
							<option value="1" class="pno">컴퓨터공학과</option>
							<option value="2" class="pno">기계공학과</option>
							<option value="3" class="pno">전자과</option>
							<option value="4" class="pno">영문학과</option>
							<option value="5" class="pno">일어과</option>
							<option value="6" class="pno">경영학과</option>
							<option value="7" class="pno">무역학과</option>
							<option value="8" class="pno">교육학과</option>
					</select></td>
				</tr>
				<tr>
					<th>학년</th>
					<td><input type="radio" name="posi" class=vcon value="1"
						checked="checked"> 1학년 <input type="radio" name="posi"
						class=vcon value="2"> 2학년 <input type="radio" name="posi"
						class=vcon value="3"> 3학년 <input type="radio" name="posi"
						class=vcon value="4"> 4학년</td>
				</tr>
				<tr>
					<th>취미</th>
					<td><input type="checkbox" name="hobby" value="프로그램">프로그램
						<input type="checkbox" name="hobby" value="독서">독서 <input
						type="checkbox" name="hobby" value="등산">등산 <input
						type="checkbox" name="hobby" value="여행">여행 <input
						type="checkbox" name="hobby" value="낚시">낚시 <input
						type="checkbox" name="hobby" value="영화보기">영화보기 <input
						type="checkbox" name="hobby" value="잠자기">잠자기 <input
						type="checkbox" name="hobby" value="멍때리기">멍때리기
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="addr" class="addr"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" class="phone"></td>
				</tr>
				<tr>
					<td colspan="2" class="bt1"><input type="button" value="등록"
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