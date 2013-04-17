<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.User" %>
<%User u = (User)session.getAttribute("user");%>
<script type="text/javascript">
<!--
	function back() { 
			window.location.href="<%=request.getContextPath()%>/UserServlet?method=query";
	}
	function save() {
		document.forms[0].submit();
	}
//-->
</script>
<h1>欢迎你：<%=u.getName() %></h1>
<h2>添加用户</h2> 
<form name="form1" method="post" action="<%=request.getContextPath()%>/UserServlet?method=insert">
<table border="1">
	<tr>
		<td>名称</td>
		<td><input name="name"></td>
	</tr>
	<tr>
		<td>密码</td>
		<td><input name="password"></td>
	</tr>
	<tr>
		<td>性别</td>
		<td><input name="sex" type="radio" checked value="1">男&nbsp;&nbsp;&nbsp;&nbsp;<input name="sex" type="radio" value="0">女</td>
	</tr>
	<tr>
		<td>邮箱</td>
		<td><input name="email"></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0);" onclick="save()">添加</a></td>
		<td><a href="javascript:void(0);" onclick="back()">返回</a></td>
	</tr>
</table>
</form>