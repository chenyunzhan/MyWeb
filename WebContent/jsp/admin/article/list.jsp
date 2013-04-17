<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.User" %>
<%@ page import="com.snow.model.Article" %>
<%@ page import="java.util.*" %>
<%User u = (User)session.getAttribute("user");%>
<h1>欢迎你：<%=u.getName() %></h1>
<h2>文章列表</h2>
<a href="<%=request.getContextPath()%>/jsp/admin/type/add.jsp"><b>新增</b></a>
<a href="<%=request.getContextPath()%>/jsp/admin/index.jsp"><b>返回管理</b></a><br><br>
<table border="1">
	<tr>
		<th>序号</th>
		<th>标识</th>
		<th>分类标识</th>
		<th>用户标识</th>
		<th>标题</th>
		<th>内容</th>
		<th>发表时间</th>
		<th>操作</th>
	</tr>
	<%
	List<Article> list = (List<Article>)request.getAttribute("list");
	if(null == list) {
		return;
	}
	int num = 0;
	for(Iterator<Article> i = list.iterator(); i.hasNext();) {
		Article a = i.next();
		num ++;
	%>
	<tr>
		<td><%=num %></td>
		<td><%=a.getId() %></td>
		<td><%=a.getTypeid() %></td>
		<td><%=a.getUserid() %></td>
		<td><%=a.getTitle()%></td>
		<td><textarea cols="75"><%=a.getContent() %></textarea></td>
		<td><%=a.getTime() %></td>
		<td><a href="<%=request.getContextPath()%>/ArticleServlet?method=preUpdate&id=<%=a.getId()%>">修改</a>|<a href="<%=request.getContextPath()%>/ArticleServlet?method=delete&id=<%=a.getId()%>">删除</a></td>
	</tr>
	<%
	}
	%>
</table>