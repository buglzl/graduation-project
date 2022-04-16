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
<%@page import="com.model.Chat"%>
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
		<div class="container" >
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne" >
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  在线留言
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">			
	<!--gallery-->
	
		
	<%	 CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
		Member member = (Member)session.getAttribute("member");  
     String hql = " from Chat where 1=1  ";
	 String url = "/secondhandgoodsssh/msg.jsp?1=1";
	 hql+=" order by id desc";
%>
<div class="container" style="width: 1120px;">
<%if(member!=null){ %>
<div class="register">
				<div class="register-but">
	<form name="f1" action="chatadd.action?memberid=<%=member.getId() %>" method="post">
	<div class="register-top-grid">
						<div class="input">
							<span>留言内容<label>*</label></span>
							<input type="text" class="form-control" placeholder="留言内容 :" name="msg" id="msg" required>
						</div>
						<input type="submit" value="提交留言">
					   <div class="clearfix"> </div>
      </div>
      </form>
      </div></div>
<%} %>
    <table class="table">
      <thead>
        <tr>
          <th>留言内容</th>
          <th>回复内容</th>
          <th>留言人</th>
          <th>留言日期</th>
        </tr>
      </thead>
      <tbody>
      <%
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/msg.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Chat> list=( ArrayList<Chat>)bean.getCollection(); 
      for(Chat chat:list){
    	  Member mb = (Member)dao.findById(chat.getMemberid(),"Member");
	    %>
        <tr>
          <td><%=chat.getMsg() %></td>
          <td><%=chat.getHfmsg() %></td>
          <td><%=mb.getUname() %></td>
          <td><%=chat.getSavetime() %></td>
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
