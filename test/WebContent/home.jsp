<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.Type" %>
<%@ page import="com.snow.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.snow.model.User" %>
<%User u = (User)session.getAttribute("user");%>
<% 
	String ip = request.getRemoteAddr();
	String host = request.getRemoteHost();
	Integer port = request.getRemotePort(); 
	String user = request.getRemoteUser();
	
	Counter c = new Counter();  
	c.count(ip, host, port, user);
%>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.10.0.custom.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.layout-latest.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/ui-lightness/jquery-ui-1.10.0.custom.css">
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/favicon.ico" />
		<title>cloud</title>
		<script type="text/javascript">
			$(function() {
				$('body').layout({ applyDefaultStyles: true }); 
				$("#west").css('padding','0').css('width','197').css('height','');
				$( "#accordion" ).accordion();
				$('a').click(function() {
					$('#myframe').css('background', '');
					$('#myframe').attr('src', $(this).attr('title'));
				});
				 
				var options = {
					   	beforeSubmit:showStart,
					   	success:showSuccess,
					   	resetForm:true
				};
				
				$('#login_form').submit(function(){
					$(this).ajaxSubmit(options);
					return false;
				});
				
				function showStart(){
				    return true;
				}
				
				function showSuccess(responseText){
					if(responseText == 1){
						alert("帐号或者密码不正确，请重新输入！");
					}else{
						window.location.href="<%=request.getContextPath()%>";
					}
				}
				
				
				var opts = {
					   	beforeSubmit:showStart1,
					   	success:showSuccess1,
					   	resetForm:true
				};
				
				
				$('#register_form').submit(function(){
					$(this).ajaxSubmit(opts);
					return false;
				});
				
				function showStart1(){
					if($('#password').val() == $('#repassword').val() && $('#password').val() != ""){
					    return true;
					}
					alert("验证不通过！");
					return false;
				}
				
				function showSuccess1(responseText){
					if(responseText == 1){
						alert("注册失败！");
					}else{
						var name = responseText.split(":");
						//alert(name[0]);
						window.location.href="<%=request.getContextPath()%>/UserServlet?method=login&source=register&name=" + name[0] + "&password=" + name[1];
					}
				}
			});
			
			function tologin() {
				//alert(1);
				$( "#login" ).dialog({
					autoOpen: true,
					modal: true,
					width: 400,
					buttons: [
						{
							text: "Login",
							click: function() {
								$("#login_form").submit();
							}
						},
						{
							text: "Cancel",
							click: function() {
								$( this ).dialog( "close" );
							}
						}
					]
				});
			}
			
			function toregister() {
				
				$( "#register" ).dialog({
					autoOpen: true,
					modal: true,
					width: 400,
					buttons: [
						{
							text: "Register",
							click: function() {
								$("#register_form").submit();
							}
						},
						{
							text: "Cancel",
							click: function() {
								$( this ).dialog( "close" );
							}
						}
					]
				});
			}
		</script>
		
		<style>
			body{
				font: 62.5% "Trebuchet MS", sans-serif;
				margin: 50px;
			}
			li a{
				cursor: pointer;
			}
			.demoHeaders {
				margin-top: 2em;
			}
			#dialog-link {
				padding: .4em 1em .4em 20px;
				text-decoration: none;
				position: relative;
			}
			#dialog-link span.ui-icon {
				margin: 0 5px 0 0;
				position: absolute;
				left: .2em;
				top: 50%;
				margin-top: -8px;
			}
			#icons {
				margin: 0;
				padding: 0;
			}
			#icons li {
				margin: 2px;
				position: relative;
				padding: 4px 0;
				cursor: pointer;
				float: left;
				list-style: none;
			}
			#icons span.ui-icon {
				float: left;
				margin: 0 4px;
			}
			.fakewindowcontain .ui-widget-overlay {
				position: absolute;
			}
		</style>
	</head>
	<body>
	
		<div class="ui-layout-center">
			<%--
			<iframe id="myframe" style="background:url('images/blank.jpg'); background-repeat:no-repeat ; background-position: center;" width="100%" scrolling="no" height=100% frameborder="0"></iframe>
			 --%>
			<iframe id="myframe" width="100%" scrolling="yes" height=100% frameborder="0"></iframe>
		</div>  
		<%if(null == u) { %>
			<div class="ui-layout-north">welcome guest !!!&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="tologin()">login</a>|<a href="javascript:void(0)" onclick="toregister()">register</a></div>  
		<%} else {%>
			<div class="ui-layout-north">welcome <%=u.getName() %> !!!</div>  
		<%} %>
		<div id="west" class="ui-layout-west">
			<div id="accordion" >
				 <%
					List<Type> plist = (List<Type>)request.getAttribute("plist");
					List<List<Type>> clist = (List<List<Type>>)request.getAttribute("clist");
					
					for(Iterator<Type> i = plist.iterator(); i.hasNext();) {
						Type t = i.next();
						out.print("<h3>" + t.getName() + "</h3>"); 
						out.print("<div style='padding: 0px'>");
						out.print("<ul>");
						for(Iterator<List<Type>> j = clist.iterator(); j.hasNext();) {
							List<Type> temp = j.next();
							for(Iterator<Type> k = temp.iterator(); k.hasNext();) {
								Type tt = k.next();
								if(t.getId() == tt.getPid()) {
									out.print("<li><a title='" + request.getContextPath() + "/ArticleServlet?typeid=" + tt.getId() + "&method=query'>" + tt.getName() + "</a></li>"); 
								}
							}
						}
						out.print("</ul>");
						out.print("</div>");
					}
				%>
			</div>
		</div> 
	
	
		<div id="login" title="Login Panel">
			<div style="text-align: center; padding-top: 20">
				<form id="login_form" method="post" action="<%=request.getContextPath()%>/UserServlet?method=login">
				<font size="3px">username:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="name" size="35"><br><br>
				<font size="3px">password:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="password" size="35">
				</form>
			</div>
		</div>
		<div id="register" title="Register Panel">
			<div style="text-align: center; padding-top: 20">
				<form id="register_form" method="post" action="<%=request.getContextPath()%>/UserServlet?method=insert&source=register">
				<font size="3px">username:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="username" size="35" name="name"><br><br>
				<font size="3px">sex:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;boy&nbsp;&nbsp;<input checked name="sex" type="radio" value="1" size="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;girl&nbsp;&nbsp;<input name="sex" value="0" type="radio" size="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
				<font size="3px">password:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="password" name="password" size="35"><br><br>
				<font size="3px">repassword:</font>&nbsp;&nbsp;<input id="repassword" name="repassword" size="35"><br><br>
				<font size="3px">email:</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input size="35" name="email">
				</form>
			</div>
		</div>
		
	</body>
</html>

