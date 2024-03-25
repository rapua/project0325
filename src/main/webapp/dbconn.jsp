<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn=null;
	try{
	String url="jdbc:oracle:thin:@//localhost:1521/xe";
	String user="system";
	String pwd="1234";
	Class.forName("oracle.jdbc.OracleDriver");
	conn=DriverManager.getConnection(url, user, pwd);
	System.out.println("데이터베이스 연결");
	}catch(Exception e){
		System.out.println("데이터베이스 연결실패");
		e.printStackTrace();
	}
%>
