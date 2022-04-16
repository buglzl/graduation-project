<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Ppinfo"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Pj"%>
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
	
	<script>
	// Can also be used with $(document).ready()
	$(window).load(function() {
	  $('.flexslider').flexslider({
		animation: "slide",
		controlNav: "thumbnails"
	  });
	});
</script>
	
	<!-- //Custom Theme files -->
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<!-- //js -->	
<!-- cart -->
<!-- cart -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script>
<!-- //the jScrollPane script -->
<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
<!-- the mousewheel plugin -->
  </head>
    <%
    Member member = (Member)session.getAttribute("member");
    CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  
    String gid = request.getParameter("gid");
    Goods goods = (Goods)dao.findById(gid,"Goods");
    goods.setCs(goods.getCs()+1);
    dao.update(goods);
    Member m = (Member)dao.findById(goods.getSaver(),"Member");
    %>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
  						<div align="right" style="background-color: #902068;height: 40px">
						<form class="navbar-form" action="index.jsp?f=f" method="post">
							<input type="text" placeholder="商品名称或编号 :" id="key" name="key" class="form-control">
							<button type="submit" class="btn btn-default" aria-label="Left Align">
								查询
							</button>
						</form>
					</div>		
   
							<div class="alert alert-info" id="tsinfo" style="display: none;">
						        <button type="button" class="close" data-dismiss="alert">×</button>
					    	</div>
					    	
					    	<!-- 眉 开始 -->
					    	    <div class="collpse tabs">
									<div class="container">
										<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
											<div class="panel panel-default">
					    	<div class="panel-heading" role="tab" id="headingOne">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									  商品详情
									</a>
								</h4>
							</div>
							</div>
							</div>
							</div>
							</div>
							<!-- 眉 结束  -->
							
							
<div class="single">
		<div class="container">
			<div class="single-grids">				
				<div class="col-md-4 single-grid">		
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="images/s1.png">
								<div class="thumb-image"> 
								<img src="upfile/<%=goods.getFilename() %>" data-imagezoom="true" class="img-responsive">
								 </div>
							</li>
						</ul>
					</div>
				</div>	
				<%Ppinfo ppmap = (Ppinfo)dao.findById(goods.getGoodpp(),"Ppinfo"); 
				Protype fmap = (Protype)dao.findById(goods.getFid(),"Protype");
				Protype smap = (Protype)dao.findById(goods.getSid(),"Protype");%>
				<div class="col-md-4 single-grid simpleCart_shelfItem">		
					<h3><%=goods.getGoodname() %>
					<%if(member!=null&&!goods.getSaver().toString().equals(member.getId().toString())){ %>
					<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=<%=m.getQq() %>&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<%=m.getQq() %>:42" alt="点击这里给我发消息" title="点击这里给我发消息"></a>
					<%} %>
					</h3>
					<ul class="size">
					  <li><a href="sellerinfo.jsp?saverid=<%=goods.getSaver() %>">查看卖家信息</a></li>
					</ul>
					<ul class="size">
					  <li>
						<B>编号:</B>
				      </li>
				      <li><%=goods.getGoodno() %></li>
					</ul>
					<ul class="size">
					<li><B>品牌:</B></li>
					<li><%=ppmap.getPpname() %></li>
					</ul>
					<ul class="size">
					<li>
						<B>类别:</B>
						</li>
							<li><%=fmap.getTypename() %>&nbsp;--&nbsp;<%=smap.getTypename() %></li>
					</ul>
					
					<ul class="size">
					<li><B>发货方式:</B></li>
					<li><%=goods.getFhfs() %></li>
					</ul>
					
					<ul class="size">
					<li><B>浏览量:</B></li>
					<li><%=goods.getCs() %></li>
					</ul>
					
					<ul class="size">
						<h3>￥:
												<%=goods.getPrice() %>
						</h3>
					</ul>
					<ul class="size">
					<li><B></B></li>
					<li><%=goods.getIstj().equals("no")?"<font color=\"red\">此商品已下架</font>":"" %></li>
					</ul>
					
					<%
					String hql2 = "SELECT distinct a.goodid as goodid,sum(a.sl) as asl  FROM Dddetail a, Ddinfo b where a.ddno=b.ddno and a.goodid='"+goods.getId()+"' and b.fkstatus='已付款' group by a.goodid";
				    ArrayList<Object[]> list2 = (ArrayList<Object[]>)dao.findByHql(hql2);
				    if(list2.size()!=0){
					 %>
					<div class="tag">
						<p>已售 : <%=list2.get(0)[1].toString()%> 件&nbsp;&nbsp;&nbsp;&nbsp;(<%=dao.getkc(goods.getId())==0?"无货":"库存:'"+dao.getkc(goods.getId())+"'件" %>)</p>
					</div>
					<%}else{ %>
					<div class="tag">
						<p>已售 : 0 件</p>
					</div>
					<%} %>
				    <input type="hidden" value="<%=dao.getkc(goods.getId())%>" id="kcnum" name="kcnum" >
					<input type="hidden" value="<%=goods.getId() %>" id="gid" name="gid" >
					<p class="qty"> 数量 :  </p><input min="1" type="number" id="sl" name="sl" value="1" >
					<%
					if(member!=null&&dao.getkc(goods.getId())!=0&&goods.getIstj().equals("yes")){
					 %>
					<div class="btn_form" id="btn_form">
						<a href="javascript:tocar()" class="add-cart item_add">加入购物车</a>	
					<!--  	<a href="javascript:tobuy()" class="add-cart item_add">直接购买</a>	-->
						<a href="javascript:tofav()" class="add-cart item_add">加入收藏</a>	
					</div>
					<%}else if(member==null){ %>
					<div class="btn_form" id="btn_form">
					<a href="login.jsp" class="add-cart item_add">请先登录</a>
					</div>	
					<%} %>
				</div>
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	
	
	<!-- collapse -->
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  商品详情
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<%=goods.getNote() %>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
							   商品评价
							</a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">
		<%	 
     String hql = " from Pj where 1=1 and goodid='"+gid+"' ";
	 String url = "/secondhandgoodsssh/good.jsp?1=1&gid="+gid;
	 hql+=" order by id desc";
%>						
	<div>
    <table class="table">
      <thead>
        <tr>
          <th>评价等级</th>
          <th>评价内容</th>
          <th>回复</th>
          <th>评价人</th>
          <th>评价时间</th>
        </tr>
      </thead>
      <tbody>
      <%
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/myorder.jsp?1=1&gid="+gid,10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Pj> list=( ArrayList<Pj>)bean.getCollection(); 
      for(Pj pj:list){
    	  Member pjmb = (Member)dao.findById(pj.getMemberid(),"Member");
	    %>
        <tr>
          <td><%=pj.getJb() %>分</td>
          <td><%=pj.getMsg() %></td>
          <td><%=pj.getHf() %></td>
          <td><%=pjmb.getUname() %></td>
          <td><%=pj.getSavetime() %></td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
	<div align="center">${page.info }</div>
							
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<!--//collapse -->

	<jsp:include page="foot.jsp"></jsp:include>
  </body>
  <script type="text/javascript">
  function tocar(){     
		 var gid=document.getElementById("gid").value;
		 var sl=document.getElementById("sl").value;    
		 if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "cartAdd.action", //servlet的名字     
		          data: "gid="+gid+"&sl="+sl, 
		         success: function(data){       
		    if(data==0){   
			    alert("该商品已加入到购物车");
		    }else{ 
		        alert("不能购买自己发布的商品");
		     	location.href="good.jsp?gid="+data;
		    }     
		 }     
		});     
	}     

  function tofav(){     
		 var gid=document.getElementById("gid").value;
		 $.ajax({  
		        type: "POST",      
		         url: "favAdd.action", //servlet的名字     
		          data: "goodid="+gid, 
		         success: function(data){       
		    if(data==0){   
			    alert("该商品已加入收藏夹");
		    }else{    
		     	location.href="login.jsp";
		    }     
		 }     
		});     
	}   


	function tobuy(){     
		 var gid=document.getElementById("gid").value;
		 var sl=document.getElementById("sl").value;    
		 if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "tobuy.action", //servlet的名字     
		          data: "goodid="+gid+"&sl="+sl, 
		         success: function(data){       
		    if(data==0){     
		    	location.href="myorder.jsp";
		    }else{
		    	alert("不能购买自己发布的商品");
		     	location.href="good.jsp?gid="+data;
			}   
		 }     
		});     
	} 
	
	
	    
  </script>
</html>
