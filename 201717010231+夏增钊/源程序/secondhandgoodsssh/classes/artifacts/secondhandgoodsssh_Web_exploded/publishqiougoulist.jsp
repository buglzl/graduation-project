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

<%@page import="com.model.Protype"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.model.Ppinfo"%>
<%@page import="com.model.Qiugou"%>
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
    
						
	<!--gallery-->
	
	
	
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  我发布的求购信息
							</a>
							
						</h4>
					</div>
					<div align="right" ><a href="publishqiougouadd.jsp" class="add-cart item_add">发布求购信息</a></div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
	
		
	<%	 
     Member member = (Member)session.getAttribute("member");  
	 CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
     String hql = " from Qiugou where 1=1  and memberid ='"+member.getId()+"' ";
	 String url = "/secondhandgoodsssh/publishqiougoulist.jsp?1=1";
	 hql+=" order by id desc";
%>
		<div class="container" style="width:  1120px;">
    <table class="table" >
      <thead>
        <tr>
          <th>商品名称</th>
          <th>求购数量</th>
          <th>发布时间</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <%
      String did = request.getParameter("did");
      if(did!=null){dao.delete(did,"Qiugou");}
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/publishqiougoulist.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Qiugou> list=( ArrayList<Qiugou>)bean.getCollection(); 
      for(Qiugou q:list){
            Member m = (Member)dao.findById(q.getMemberid(),"Member");
	    %>
        <tr>
          <td><%=q.getGoodsname() %></td>
          <td><%=q.getNum() %></td>
           <td><%=q.getSavetime() %></td>
          <td>
          <a href="publishqiougouedit.jsp?id=<%=q.getId() %>" class="add-cart item_add">编辑</a>
          <a href="publishqiougoulist.jsp?did=<%=q.getId() %>" class="add-cart item_add">删除</a>
          </td>
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
