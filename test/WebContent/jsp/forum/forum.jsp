<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.snow.model.Topic" %>
<%Topic topic = (Topic)request.getAttribute("topic"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
搂主<br>
论题：<%=topic.getTitle() %><br>
内容：<%=topic.getContent() %><br>
<form action="<%=request.getContextPath()%>/TopicServlet?method=insert">
	<input type="hidden" name="tid" value="<%=topic.getId()%>">
	<input type="submit" value="发表回复"><br>
	<textarea rows="20" cols="80"></textarea><br>
	<input type="submit" value="发表回复">
</form>
</body>
</html>