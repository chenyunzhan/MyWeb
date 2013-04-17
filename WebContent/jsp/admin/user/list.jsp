<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.User" %>
<%@ page import="com.snow.model.User" %>
<%@ page import="java.util.*" %>
<%User u = (User)session.getAttribute("user");%>
<h1>欢迎你：<%=u.getName() %></h1>
<h2>用户列表</h2>
<a href="<%=request.getContextPath()%>/jsp/admin/user/add.jsp"><b>新增</b></a>
<a href="<%=request.getContextPath()%>/jsp/admin/index.jsp"><b>返回管理</b></a><br><br>
<table border="1">
	<tr>
		<th>序号</th>
		<th>标识</th>
		<th>名称</th>
		<th>密码</th>
		<th>性别</th>
		<th>邮箱</th>
		<th>注册时间</th>
		<th>操作</th>
	</tr>
	<%
	List<User> ulist = (List<User>)request.getAttribute("ulist");
	if(null == ulist) {
		return;
	}
	int num = 0;
	for(Iterator<User> i = ulist.iterator(); i.hasNext();) {
		User temp = i.next();
		num ++;
	%>
	<tr>
		<td><%=num %></td>
		<td><%=temp.getId() %></td>
		<td><%=temp.getName() %></td>
		<td><%=temp.getPassword() %></td>
		<td><%=temp.getSex() %></td>
		<td><%=temp.getEmail() %></td>
		<td><%=temp.getTime() %></td>
		<td><a href="<%=request.getContextPath()%>/UserServlet?method=preUpdate&id=<%=temp.getId()%>">修改</a>|<a href="#">删除</a></td>
	</tr>
	<%
	}
	%>
</table>