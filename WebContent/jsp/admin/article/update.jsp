<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.snow.model.User" %>
<%@ page import="com.snow.model.Article" %>
<%User u = (User)session.getAttribute("user");%>
<%Article a = (Article)request.getAttribute("article");%>
<script type="text/javascript">
<!--
	function back() { 
			window.location.href="<%=request.getContextPath()%>/ArticleServlet?method=query&source=admin";
	}
	function update() {
		document.forms[0].submit();
	}
//-->
</script>
<h1>欢迎你：<%=u.getName() %></h1>
<h2>修改文章</h2>
<form name="form1" method="post" action="<%=request.getContextPath()%>/ArticleServlet?method=update">
<table border="1">
	<tr>
		<td>标识</td>
		<td><input name="id" value="<%=a.getId()%>"></td>
	</tr>
	<tr>
		<td>分类标识</td>
		<td><input name="typeid" value="<%=a.getTypeid()%>"></td>
	</tr>
	<tr>
		<td>用户标识</td>
		<td><input name="userid" value="<%=a.getUserid()%>"></td>
	</tr>
	<tr>
		<td>标题</td>
		<td><input name="title" value="<%=a.getTitle()%>"></td>
	</tr>
	<tr>
		<td>内容</td>
		<td><textarea name="content" rows="10" cols="75"><%=a.getContent() %></textarea></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0);" onclick="update()">更新</a></td>
		<td><a href="javascript:void(0);" onclick="back()">返回</a></td>
	</tr>
</table>
</form>