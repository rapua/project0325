<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main화면</title>
<style>
* {
	margin: 0;
	padding: 0;
}

section {
	box-sizing: border-box; height : 83%;
	width: 85%;
	position: absolute;
	top: 12%;
	left: 15%;
	height: 83%;
}

html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

ol li {
	margin: 0 20px 0 20px;
}

section ol {
	padding: 0 2% 0 2%;
}

section h2 {
	text-align: center;
	margin-top: 15px;
}

section h3 {
	text-indent: 3%;
	margin-top: 15px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp"%>
	</header>
	<nav>
		<%@ include file="nav.jsp"%>
	</nav>
	<section>
		<h2>입출고 관리 시스템</h2>
		<h3>입출고 관리 시스템을 작성한다.</h3>
		<ol>
			<li>입출고 관리 데이터베이스를 구축한다.</li>
			<li>상품정보, 매장정보, 입출고 정보 테이블에 샘플데이터를 SQL문을 사용하여 데이터를 추가생성한다.</li>
			<li>주어진 화면디자인을 이용하며 화면을 디자인한다.</li>
			<li>업무요건에 따라 프로그램을 작성한다.</li>
		</ol>
	</section>
	<footer>
		<%@ include file="footer.jsp"%>
	</footer>
</body>
</html>