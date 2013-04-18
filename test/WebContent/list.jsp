<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.snow.model.Article" %>
<%@ page import="com.snow.model.User" %>
<%@ page import="java.util.*" %>
<%User u = (User)session.getAttribute("user");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.0.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.10.0.custom.js"></script>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/ui-lightness/jquery-ui-1.10.0.custom.css">
		<title>cloud</title>
		<script type="text/javascript">
			$(function() {
				$( "#button" ).button();
				
				var options = {
				   	beforeSubmit:showStart,
				   	success:showSuccess,
				   	error:showError,
				   	resetForm:true
				};
				$('#myform').submit(function(){
					$(this).ajaxSubmit(options);
					return false;
				});
				
				function showError() {
					$("#post_error").css("display", "block");
				    $('#post_error').delay(1000).hide(0);
				}
				
				function showStart(){
				    return true;
				}
				
				function showSuccess(){
				    $("#post_success").css("display", "block");
				    $('#post_success').delay(1000).hide(0);
				}
			});
			
			
			
			function post () {
				$( "#post" ).dialog({
					autoOpen: true,
					//modal: true,
					resizable: false,
					width: 800,
					buttons: [
						{
							text: "Post",
							click: function() {
								$("#myform").submit();
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
		<style type="text/css">
			#d_right{
				width:100%;
				height:1000px;
				float:right;
			}
			#d_cell{
				width:100%;
				padding:0px;
			}
			#d_content{
				border-style:groove;
				
			}
		</style>
		
	</head>
	<body>
			<div style="float: right;">
				<button onclick="post()" style="font-size: 0.8em;" id="button"><span class="ui-button-text">发表新文章</span></button>
			</div>
			<%
				List<Article> list = (ArrayList<Article>)request.getAttribute("list");
			%>
			<%
				if(list.size() <= 0) {
			%>
					<%="<font color='red'>没有相关内容</font>" %>
			<%
				} else {
			%>
			<%
					for(Iterator<Article> i = list.iterator(); i.hasNext();) {
						Article a = i.next();
			%>
			<div id="d_cell">
			
			
			<!-- 单元里的内容-start -->
				<h2>
						<%if(a.getUserid() != 1){ %>
						<%=a.getTitle() %>
						<%
						  } else { 
								String[] temp = a.getTitle().split("-");
						%>
						<%=temp[1] %>
						<%} %>
				</h2>
				<hr>
				<div id="d_content">
						<%=a.getContent() %>
				</div>
			<!-- 单元里的内容-end -->
			
			
			
			</div>
			<%
					}
				}
			%>
			<div id="d_cell">
			
			
			<!-- 单元里的内容-start -->
				<h2>重要说明</h2>
				<hr>
				<div id="d_content">
<h2 style="color:#FF0000">持续更新中。。。。。。</h2>
				</div>
			<!-- 单元里的内容-end -->
			
			
			
			</div>
			
			<div id="post" title="Post Panel" style="display: none;">
				<div style="text-align: center; padding-top: 20px;">
					<form id="myform" method="post" action="<%=request.getContextPath()%>/ArticleServlet?method=insert&userid=<%=u == null ? 9999 : u.getId() %>&typeid=<%=request.getAttribute("typeid")%>">
						title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="title" size="76"><br><br>
						author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="author" value="<%=u == null ? "admin" : u.getName() %>" size="76"><br><br>
						content:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea rows="10" name="content" cols="75"></textarea>
					</form>
				</div>
			</div>
			
			<div class="ui-widget" id="post_success" style="display: none;">
				<div class="ui-state-highlight ui-corner-all" style="position: absolute; top: 40%; left: 35%; z-index: 999">
					<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
					<strong>您好！</strong>恭喜您，您的操作成功！</p>
				</div>
			</div>
			<div class="ui-widget" id="post_error" style="display: none;">
				<div class="ui-state-error ui-corner-all" style="position: absolute; top: 40%; left: 35%; z-index: 999">
					<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
					<strong>您好！</strong>对不起，您的操作失败！</p>
				</div>
			</div>
	</body>
</html>

