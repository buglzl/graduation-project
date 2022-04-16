<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Car"%>
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
							  购物车
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">	
						
	<!--gallery-->
	
			<div class="alert alert-info" id="tsinfo" style="display: none;">
				<button type="button" class="close" data-dismiss="alert">×</button>	
			</div>
		
		<div class="cart-items">
		<div class="container">
		
		<%Member member = (Member)session.getAttribute("member"); 
		ArrayList<Car> list = (ArrayList<Car>)dao.findByHql("from Car where mid='"+member.getId()+"' order by id desc"); 
		double totalprice = 0.0;
		for(int i=0;i<list.size();i++){
			Car car = list.get(i);
			Goods gd = (Goods)dao.findById(car.getGid(),"Goods");
	   			totalprice += Double.valueOf(gd.getPrice())*car.getSl();
		%>
		
			<div class="cart-header">
				<div class="cart-sec simpleCart_shelfItem">
					<div class="cart-item cyc">
						 <img src="upfile/<%=gd.getFilename() %>" class="img-responsive" alt="" width="100" height="100">
					</div>
					<div class="cart-item-info">
						<h3><a href="#"> <%=gd.getGoodname() %> </a></h3>
						<ul class="qty">
							<input type="hidden" value="<%=car.getId() %>" id="carid<%=i %>" name="carid<%=i %>">
							<li><p>购买数量:<input min="1" type="number" id="sl<%=i %>" name="sl<%=i %>" value="<%=car.getSl() %>"></p></li>
							<li><p>单价:
								￥<%=gd.getPrice() %>
							</p></li>
						</ul>
					</div>
					<div class="btn_form">
						
						<a href="javascript:updatecart(<%=i %>)" class="add-cart item_add">修改数量</a>	
						<a href="cartDel.action?id=<%=car.getId() %>" class="add-cart item_add">移出</a>	
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		<%} %>


		</div>
	</div>
		<div class="row">
				<div class="col-md-4 col-md-offset-8 ">
					<center><a href="index.jsp" class="add-cart item_add">继续购物</a></center>
				</div>
			</div>
			<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>满1000立减100</h6>
							<tr>
								<td>Total</td>
								<td id="dprice"><%=totalprice %></td>
							</tr>
							<tr style="border-top: 1px solid #333">
								<td><h5>TOTAL</h5></td>
								<td id="tprice">
								<%
								double zktotalprice = 0.0;
								if(totalprice<1000.0){ %>
								<%=totalprice %>
								<%}else{ 
									zktotalprice=totalprice-100;
								%>
								<%=zktotalprice%>
								<%} %>
								</td>
							</tr>
						</table>
						<%if(list.size()>0){ %>
						<center><a href="createdd.jsp?totalprice=<%=totalprice %>&zktotalprice=<%=zktotalprice %>" class="add-cart item_add">创建订单</a></center>
						<%}else{ %>
						<center><a href="index.jsp" class="add-cart item_add">购物车内无商品，快去选购吧!</a></center>
						<%} %>
								</div>
					</div>
				</div>
</div></div></div>
		
	<!--//gallery-->
	
	
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
  <script type="text/javascript">
  function updatecart(i){
		var carid=$("#carid"+i).val();
		var sl=$("#sl"+i).val();
		if(sl==""||sl<=0){
		    $("#tsinfo").show();
		    $("#tsinfo").html("请填写正确的数量");
		    return;
		 }  
		 $.ajax({  
		        type: "POST",      
		         url: "updatecart.action", //servlet的名字     
		         data: "id="+carid+"&sl="+sl, 
		         success: function(data){       
		    if(data==1){     
		    	$("#tsinfo").show();
		     	$("#tsinfo").html("数量已更新");
		     	updatetprice();
		    }else{    
		    	$("#tsinfo").show(); 
		     	$("#tsinfo").html("数量更新失败");
		    }     
		 }     
		}); 
	}

	function updatetprice(){
		$.ajax({  
	        type: "POST",      
	         url: "updatetprice.action", //servlet的名字     
	          data: "", 
	         success: function(data){ 
	    if(data!=null){ 
		    if(data>1000){
		    	$("#tprice").html(data-100);
			    }else{
			    	$("#tprice").html(data);
				    }
	    	$("#dprice").html(data);
	    	location.replace("/secondhandgoodsssh/cart.jsp");
	    }else{    
	    }     
	 }     
	}); 
	}
  </script>
</html>
