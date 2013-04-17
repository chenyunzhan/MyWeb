<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.User" %>
<%@ page import="com.snow.model.Type" %>
<%@ page import="java.util.*" %>
<%User u = (User)session.getAttribute("user");%>
<h1>欢迎你：<%=u.getName() %></h1>
<h2>分类子列表</h2>
<a href="<%=request.getContextPath()%>/jsp/admin/type/add.jsp?pid=<%=request.getAttribute("pid")%>"><b>新增</b></a>
<a href="<%=request.getContextPath()%>/jsp/admin/index.jsp"><b>返回管理</b></a>
<a href="<%=request.getContextPath()%>/TypeServlet?method=query&source=admin"><b>返回主分类列表</b></a><br><br>
<table border="1">
	<tr>
		<th>序号</th>
		<th>标识</th>
		<th>父标识</th>
		<th>分类名称</th>
		<th>操作</th>
	</tr>
	<%
	List<Type> clist = (List<Type>)request.getAttribute("clist");
	if(null == clist) {
		return;
	}
	int num = 0;
	for(Iterator<Type> i = clist.iterator(); i.hasNext();) {
		Type t = i.next();
		num ++;
	%>
	<tr>
		<td><%=num %></td>
		<td><a href="<%=request.getContextPath()%>/TypeServlet?method=queryChild&id=<%=t.getId()%>"><%=t.getId() %></a></td>
		<td><%=t.getPid() %></td>
		<td><%=t.getName() %></td>
		<td><a href="<%=request.getContextPath()%>/TypeServlet?method=preUpdate&id=<%=t.getId()%>">修改</a>|<a href="<%=request.getContextPath()%>/TypeServlet?method=delete&id=<%=t.getId()%>">删除</a></td>
	</tr>
	<%
	}
	%>
</table>