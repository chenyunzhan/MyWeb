<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.User" %>
<%User u = (User)session.getAttribute("user");%>
<h1>欢迎你：<%=u.getName() %></h1>
<h2><a href="<%=request.getContextPath()%>/UserServlet?method=query&source=admin">管理用户</a></h2>
<h2><a href="<%=request.getContextPath()%>/TypeServlet?method=query&source=admin">管理分类</a></h2>
<h2><a href="<%=request.getContextPath()%>/ArticleServlet?method=query&source=admin">管理文章</a></h2>