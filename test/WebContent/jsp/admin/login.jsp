<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.User" %>
<form method="post" action="<%=request.getContextPath()%>/UserServlet?method=login">
<input name="source" value="admin" type="hidden">
	姓名：<input name="name">
	密码：<input name="password">
	<input type="submit" value="提交">
</form>