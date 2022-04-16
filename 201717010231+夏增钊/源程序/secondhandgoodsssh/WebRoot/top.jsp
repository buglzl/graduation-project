<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.model.Member"%>
<%@page import="com.model.Dddetail"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  %>
  <body>
  			<div align="right" style="background-color: #902068;height: 30px">
				<div class="container">
				<%Member member = (Member)session.getAttribute("member");  
				if(member==null){%>
					<span> <a href="login.jsp" class="dropdown-toggle" style="color: #fff">登录|</a></span>
					<span> <a href="reg.jsp" class="dropdown-toggle" style="color: #fff">注册|</a></span>
					<span> <a href="findupass.jsp" class="dropdown-toggle" style="color: #fff">忘记密码</a></span>
				<%}else{ %>	
					<span> <a style="color: #fff">你好,<%=member.getUname()%>|</a></span>
					<span> <a href="yue.jsp" class="dropdown-toggle" style="color: #fff">余额|</a></span>
					<span> <a href="cart.jsp" class="dropdown-toggle" style="color: #fff">购物车|</a></span>
					<span> <a href="myorder.jsp" style="color: #fff">我的订单|</a></span>
					<span> <a href="fav.jsp" style="color: #fff">收藏夹|</a></span>
					<%ArrayList<Dddetail> list = (ArrayList<Dddetail>)dao.findByHql("from Dddetail where ckstatus='new' and delstatus='0' and goodid in (select id from Goods where saver='"+member.getId()+"')"); %>
					<span> <a href="saleproduct.jsp" style="color: #fff">
					销售订单<%=list.size()!=0?"&nbsp;&nbsp;<span style=\"color:red\">"+list.size()+"&nbsp;笔新订单</span>":"" %>|</a></span>
					<span> <a href="myproduct.jsp" style="color: #fff">卖家中心|</a></span>
					<!-- <span> <a href="publishqiougoulist.jsp" style="color: #fff">求购信息|</a></span> -->
					<span> <a href="memberinfo.jsp" style="color: #fff">资料修改|</a></span>
					<span> <a href="memberExit.action" style="color: #fff">退出</a></span>
				<%} %>		
				</div>
			</div>
    	<!--header-->
	<div class="header">
		<div class="container">
			<!-- end:top -->
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<h1 class="navbar-brand"><a  href="index.jsp">易物网站</a></h1>
				</div>
				<!--navbar-header-->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="games.jsp">公告信息</a></li>
						<%ArrayList<Protype> protypelist = (ArrayList<Protype>)dao.findByHql("from Protype where 1=1 and delstatus='0' and fatherid='0'"); 
						for(Protype protype:protypelist){%>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=protype.getTypename() %><b class="caret"></b></a>
							<ul class="dropdown-menu multi-column columns-4">
								<div class="row">
									<div class="col-sm-3">
										<ul class="multi-column-dropdown">
										<%ArrayList<Protype> sonlist = (ArrayList<Protype>)dao.findByHql("from Protype where delstatus='0' and fatherid="+protype.getId()); 
		    							for(Protype spro:sonlist){%>
											<li><a class="list" href="index.jsp?key2=<%=spro.getId() %>"><%=spro.getTypename() %></a></li>
										<%} %>	
										</ul>
									</div>																		
									
								</div>
							</ul>
						</li>
					   	<%} %>	
					<!--  	<li><a href="qiugoulist.jsp">求购信息</a></li> -->  
					   	<li><a href="msg.jsp">在线留言</a></li>
					   	<li><a href="about.jsp">使用指南</a></li>
					</ul> 
					<!--/.navbar-collapse-->
				</div>
				<!--//navbar-header-->
			</nav>

			<div class="clearfix"> </div>
		</div>
	</div>
	<!--//header-->

	
	 <!-- Carousel -->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
    				<!-- Wrapper for slides -->
						<%ArrayList<Imgadv> imglist = (ArrayList<Imgadv>)dao.findByHql(" from Imgadv  order by id");  %>
						<div class="carousel-inner">
							<div class="item active">
								<img src="upfile/<%=imglist.get(0).getFilename() %>" alt="First slide" width="100%" height="40%">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
						<% 
						for(int i=1;i<imglist.size();i++){
						%>
							<div class="item">
								<img src="upfile/<%=imglist.get(i).getFilename() %>" alt="First slide" width="100%" height="40%">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
						<%} %>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div><!-- /carousel -->
    <!-- Controls -->
  </body>
</html>
