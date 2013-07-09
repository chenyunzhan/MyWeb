<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.snow.model.Topic" %>
<%String typeid = (String)request.getAttribute("typeid"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addtopic() {
		window.location.href="jsp/forum/topic/add.jsp?typeid=<%=typeid%>";
	}
</script>
</head>
<body>
<button onclick="addtopic()">发表新贴</button><br>
<table>
<%
List<Topic> list = (List<Topic>)request.getAttribute("list");
for(Iterator<Topic> i = list.iterator(); i.hasNext();) {
	Topic t = i.next();
%>
<tr><td>论题：<a href="<%=request.getContextPath()%>/TopicServlet?method=detail&id=<%=t.getId()%>"><%=t.getTitle() %></a></td></tr>
<%
}
%>
</table>
<button onclick="addtopic()">发表新贴</button>
</body>
</html>