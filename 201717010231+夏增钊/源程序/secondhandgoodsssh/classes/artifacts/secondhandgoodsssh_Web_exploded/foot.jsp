<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Yqlink"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!--footer-->
	
	<!--//footer-->
	<div class="footer-bottom">
		<div class="container">
			<p>友情链接
			<%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
			ArrayList<Yqlink> yqlist = (ArrayList<Yqlink>)dao.findByHql(" from Yqlink"); 
			for(Yqlink yqlink:yqlist){%>
			<a href="<%=yqlink.getLinkurl() %>" target="_blank"><%=yqlink.getLinkname() %></a>
			<%} %>
			</p>
		</div>
		<div class="container">
			<p>Copyright &copy; 2021.Company name All rights reserved.More Templates <a href="/secondhandgoodsssh/admin/login.jsp" target="_blank" title="后台管理">后台管理</a></p>
		</div>
	</div>
  </body>
</html>
