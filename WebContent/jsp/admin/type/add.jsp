<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.User" %>
<%User u = (User)session.getAttribute("user");%>
<%String pid =request.getParameter("pid");%>
<script type="text/javascript">
<!--
	function back() { 
		<%if(request.getParameter("pid") != null && Integer.parseInt(request.getParameter("pid")) !=0){%>
			window.location.href="<%=request.getContextPath()%>/TypeServlet?method=query&source=cadd&pid=<%=pid %>";
		<%} else {%>
			window.location.href="<%=request.getContextPath()%>/TypeServlet?method=query&source=admin";
		<%}%>
	}
	function save() {
		document.forms[0].submit();
	}
//-->
</script>
<h1>欢迎你：<%=u.getName() %></h1>
<h2>添加分类</h2> 
<form name="form1" method="post" action="<%=request.getContextPath()%>/TypeServlet?method=insert">
<table border="1">
	<tr>
		<td>标识</td>
		<td><input name="id"></td>
	</tr>
	<tr>
		<td>分类名称</td>
		<td><input name="name"></td>
	</tr>
	<tr>
		<td>父标识</td>
		<td><input name="pid" value="<%=pid == null ? 0 : pid%>"></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0);" onclick="save()">添加</a></td>
		<td><a href="javascript:void(0);" onclick="back()">返回</a></td>
	</tr>
</table>
</form>