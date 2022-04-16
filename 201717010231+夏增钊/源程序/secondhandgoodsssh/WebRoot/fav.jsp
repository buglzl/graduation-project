<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Member"%>
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
    <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  %>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
    
						
 <div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  收藏夹
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">	
	<!--gallery-->
	
		<div class="container">
			<div class="gallery-grids">
				
				<%Member member = (Member)session.getAttribute("member"); 
				 String hql = " from Goods where 1=1 and delstatus='0' and shstatus='通过' and id in (select goodid from Fav where memberid='"+member.getId()+"') ";
				 String url = "/secondhandgoodsssh/fav.jsp?1=1";
				 String key = request.getParameter("key")==null?"":request.getParameter("key");
				 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
				 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
				 String key3 = request.getParameter("key3")==null?"":request.getParameter("key3");
				 String f = request.getParameter("f");
				 if(f==null)
				 {
				 key = Info.getUTFStr(key);
				 }
				 if(!key.equals(""))
				 {
					 hql+=" and (goodname like'%"+key+"%' or goodno like'%"+key+"%')";
				 url+="&key="+key;
				 }
				 if(!key1.equals(""))
				 {
					 hql+=" and (fid ='"+key1+"')";
				 	url+="&key1="+key1;
				 }
				 if(!key2.equals(""))
				 {
					 hql+=" and (sid ='"+key2+"')";
				 url+="&key2="+key2;
				 }
				 if(!key3.equals(""))
				 {
					 hql+=" and (goodpp ='"+key3+"')";
				 url+="&key3="+key3;
				 }
				 hql+=" order by id desc";
				  PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/fav.jsp?1=1",10, request);
			      pageManager.doList(hql);
			      PageManager bean= (PageManager)request.getAttribute("page");
			      ArrayList<Goods> list=( ArrayList<Goods>)bean.getCollection(); 
				for(Goods goods:list){
				%>
				<div class="col-md-3 gallery-grid ">
					<a href="good.jsp?gid=<%=goods.getId() %>"><img src="upfile/<%=goods.getFilename() %>" class="img-responsive" alt=""/>
						<div class="gallery-info">
							<a class="shop" href="good.jsp?gid=<%=goods.getId() %>">SHOP NOW</a>
							<div class="clearfix"> </div>
						</div>
					</a>
					<div class="galy-info">
						<p><%=goods.getGoodname() %></p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">
										￥<%=goods.getPrice() %>
								</h5>
							</div>
							<div>
							</div>		
							<div>   <a href="favDel.action?goodid=<%=goods.getId() %>">移出</a>	</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<%} %>
			</div>	
		</div>
	<div align="center">${page.info }</div>
	<!--//gallery-->
								</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
