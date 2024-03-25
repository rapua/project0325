<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
header {
	height: 12%;
	background-color: rgb(13, 165, 252);
	color:white;
	font-size: 1.5em;
	text-align: center;
}

header h3 {
	vertical-align: middle;
	padding-top : 25px;
}

nav {
	box-sizing:border-box;
	position: absolute;
	top: 12%;
	left: 0%;
	width: 15%;
	height: 83%;
	background-color: black;
}

nav ul {
	list-style-type: none;
	width: 250px;
	position:relative;
	top: -70px;
}

nav li {
	width: 100%;
	padding-bottom: 20px;
	padding-left: 10px;
	text-align: center;
}

nav a {
	color: white;
	text-decoration: none;
	width: 100%;
	text-align: center;
}

footer {
	box-sizing:border-box;
	position: absolute;
	bottom: 0%;
	left: 0%;
	width: 100%;
	height: 5%;
	padding: 0.5% 0 2% 0;
	background-color: gray;
	color: white;
	text-align: center;
}
</style>
</head>
<body>
	<header>
		<h3>매장 입출고 관리 시스템ver 1.0</h3>
	</header>
</body>
</html>