<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
我在云端；<br>
我的环境变量信息：
<%
String name = System.getenv("MOPAAS_MYSQL700_NAME");
String host = System.getenv("MOPAAS_MYSQL700_HOST");
String port = System.getenv("MOPAAS_MYSQL700_PORT");
String username = System.getenv("MOPAAS_MYSQL700_USERNAME");
String password = System.getenv("MOPAAS_MYSQL700_PASSWORD");
out.println("name:" + name + " host:" + host + " port:" + port + " username:" + username + " password:" + password);
%>
</body>
</html>