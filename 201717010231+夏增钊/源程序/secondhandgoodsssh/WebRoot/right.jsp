<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Ppinfo"%>
<%@page import="com.model.Goods"%>
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
    <div class="col-md-3 rsidebar span_1_of_left">
				<section  class="sky-form">
					<div class="product_right">
						<h4 class="m_2"><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>品牌分类</h4>
						<div class="tab1">
							<ul class="place">								
								<li class="sort">全部品牌</li>
								<li class="by"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true"></span></li>								
							</ul>
							<div class="clearfix"> </div>
							<div class="single-bottom">		
							<%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); 
								String hql = " from Ppinfo where 1=1 and delstatus='0' ";
								ArrayList<Ppinfo> pplist  = (ArrayList<Ppinfo>)dao.findByHql(hql);
								for(Ppinfo ppmap:pplist){%>				
								<a href="index.jsp?key3=<%=ppmap.getId() %>"><p><%=ppmap.getPpname() %></p></a>
								<%} %>
						    </div>
					    </div>						  
						
						<!--script-->
						<script>
							$(document).ready(function(){
								$(".tab1 .single-bottom").hide();
								
								$(".tab1 ul").click(function(){
									$(".tab1 .single-bottom").slideToggle(300);
								})
								
							});
						</script>
						<!--//script -->	
					</div>
				</section>
				<section  class="sky-form">
					<h4><span class="glyphicon glyphicon-minus" aria-hidden="true"></span>销售排行</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
						<%
						String hql2 = "SELECT distinct a.goodid as goodid,sum(a.sl)  FROM Dddetail a, Ddinfo b where a.ddno=b.ddno and b.fkstatus='已付款' group by a.goodid order by a.sl desc ";
				        ArrayList<Object[]> list2 = (ArrayList<Object[]>)dao.findByHql(hql2);
				        String gname = "";
				        for(Object[] obj:list2){
				        	Goods gmap = (Goods)dao.findById(obj[0].toString(),"Goods");
				        	gname = gmap.getGoodname();
		            	  if(gmap.getGoodname().length()>=10){
		            		  gname = gmap.getGoodname().toString().substring(0,10)+"...";
		            	  }
		            	  %>
							<label class="checkbox"><a href="good.jsp?gid=<%=gmap.getId() %>"><i></i><%=gname %></a> <br/>销售<%=obj[1].toString().substring(0,obj[1].toString().length()-2) %></label>
							<%} %>
						</div>
					</div>
				</section>  				 
			</div>
  </body>
</html>
