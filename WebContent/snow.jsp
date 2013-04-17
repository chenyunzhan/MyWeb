<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.Type" %>
<%@ page import="java.util.*" %>

<%
	List<Type> plist = (List<Type>)request.getAttribute("plist");
	List<List<Type>> clist = (List<List<Type>>)request.getAttribute("clist");
	
	for(Iterator<Type> i = plist.iterator(); i.hasNext();) {
		Type t = i.next();
		out.print(t.getName() + "<br>"); 
		for(Iterator<List<Type>> j = clist.iterator(); j.hasNext();) {
			List<Type> temp = j.next();
			for(Iterator<Type> k = temp.iterator(); k.hasNext();) {
				Type tt = k.next();
				if(t.getId() == tt.getPid()) {
					out.print("----" + tt.getName() + "<br>"); 
				}
			}
		}
	}
%>

