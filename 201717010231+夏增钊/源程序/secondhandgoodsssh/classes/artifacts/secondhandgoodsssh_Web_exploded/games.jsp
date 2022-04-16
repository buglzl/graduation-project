<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Member"%>
<%@page import="com.model.Ddinfo"%>
<%@page import="com.model.Dddetail"%>
<%@page import="com.model.Pj"%>

<%@page import="com.model.News"%>
<%@page import="com.model.Games"%>
<%@page import="com.model.Gamebm"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>易物网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!-- //Custom Theme files -->
	<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
	<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
	<!-- js -->
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
	<script src="js/imagezoom.js"></script>
	<!-- //js -->
	<!-- cart -->
	<script src="js/simpleCart.min.js"> </script>
	<!-- cart -->
	<!-- FlexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
  </head>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
    
						
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  公告信息
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
	
		
	<%	 CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
		Member member = (Member)session.getAttribute("member");  
     String hql = " from Games where 1=1  ";
	 String url = "/secondhandgoodsssh/games.jsp?1=1";
	 hql+=" order by id desc";
%>
		<div class="container" style="width: 1120px;">
    <table class="table" >
      <thead>
        <tr>
          <th>标题</th>
          <th>发布日期</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      <%
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/games.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Games> list=( ArrayList<Games>)bean.getCollection(); 
      for(Games news:list){
	    %>
        <tr>
          <td><a href="gamesx.jsp?id=<%=news.getId() %>"><%=news.getTitle() %></a></td>
          <td><%=news.getSavetime() %></td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
	<div align="center">${page.info }</div>
	<!--//gallery-->
						</div>
					</div>
				</div>
</div></div></div>
	
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
