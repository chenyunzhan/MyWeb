<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String typeid =request.getParameter("typeid");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/TopicServlet?method=insert">
	<input type="hidden" name="typeid" value="<%=typeid%>">
	标题：<input name="title" style="width:230px;"><br>
	内容：<textarea name="content" rows="10" cols="30"></textarea><br>
	<input type="submit" value="发表">
</form>
</body>
</html>