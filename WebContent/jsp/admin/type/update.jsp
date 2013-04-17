<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.snow.model.User" %>
<%@ page import="com.snow.model.Type" %>
<%User u = (User)session.getAttribute("user");%>
<%Type t = (Type)request.getAttribute("type");%>
<script type="text/javascript">
<!--
	function back() { 
		<%if(t.getPid() < 100){%>
			window.location.href="<%=request.getContextPath()%>/TypeServlet?method=query&source=cadd&pid=<%=t.getPid() %>";
		<%} else {%>
			window.location.href="<%=request.getContextPath()%>/TypeServlet?method=query&source=admin";
		<%}%>
	}
	function update() {
		document.forms[0].submit();
	}
//-->
</script>
<h1>欢迎你：<%=u.getName() %></h1>
<h2>修改分类</h2>
<form name="form1" method="post" action="<%=request.getContextPath()%>/TypeServlet?method=update">
<table border="1">
	<tr>
		<td>标识</td>
		<td><input name="id" value="<%=t.getId()%>"></td>
	</tr>
	<tr>
		<td>分类名称</td>
		<td><input name="name" value="<%=t.getName()%>"></td>
	</tr>
	<tr>
		<td>父标识</td>
		<td><input name="pid" value="<%=t.getPid()%>"></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0);" onclick="update()">更新</a></td>
		<td><a href="javascript:void(0);" onclick="back()">返回</a></td>
	</tr>
</table>
</form>