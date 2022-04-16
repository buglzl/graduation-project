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
    <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  
    Member member = (Member)session.getAttribute("member");  
    String totalprice = request.getParameter("totalprice");
    System.out.println("totalprice=="+totalprice);
    String zktotalprice = "";
    if(Double.parseDouble(totalprice)>1000){
    	zktotalprice = String.valueOf(Double.parseDouble(totalprice)-100);
    }else{
    	zktotalprice=totalprice;
    }
    %>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
    
<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<div class="register-but">
				   <form name="f1" action="createdd.action?zktotalprice=<%=zktotalprice %>" method="post">
				   <div class="register-top-grid">
						<h3>创建订单</h3>
						<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        <button type="button" class="close" data-dismiss="alert">×</button>
						        	<%=suc %>
					    	</div>
						<%}%>
						<div class="alert alert-info" id="erroinfo" style="display: none">
				        	<button type="button" class="close" data-dismiss="alert">×</button>
			    		</div>
			    		<div class="input">
							<span>订单总金额:<%=zktotalprice.equals("0.0")?totalprice:zktotalprice %>元</span>
						</div>
						
						<div class="input">
							<span>支付方式<label>*</label></span>
							<input type="radio" name="zffs" checked  value="货到付款">&nbsp;&nbsp;货到付款
							<input type="radio" name="zffs"  value="在线支付">&nbsp;&nbsp;在线支付
						</div>
						
						<div class="input" style="display:none;" id="showdiv">
							<span><label></label></span>
							<input type="text" class="form-control" placeholder="支付宝帐号:" name="zfb" id="zfb">
							<span><label></label></span>
							<input type="text" class="form-control" placeholder="支付密码 :" name="mm" id="mm">
						</div>
						
						<div class="input">
							<span>收货人姓名<label>*</label></span>
							<input type="text" class="form-control" placeholder="收货人姓名 :" value="<%=member.getTname() %>" name="shrname" id="shrname" required>
						</div>
						<div class="input">
							<span>收货人电话<label>*</label></span>
							<input type="text" class="form-control" placeholder="收货人电话:" value="<%=member.getTel() %>" name="shrtel" id="shrtel" required>
						</div>
						<div class="input">
							<span>收货人地址<label>*</label></span>
							<input type="text" class="form-control" placeholder="收货人地址 :" value="<%=member.getAddr() %>" name="shraddr" id="shraddr" required>
						</div>
						<div class="clearfix"> </div>
						</div>
					   <input type="submit" value="提交">
					   <div class="clearfix"> </div>
				   </form>
				</div>
			</div>
	    </div>
	</div>
	<!--//account-->
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
<script type="text/javascript">
$("input[name='zffs']").click(function(){
	if($(this).val()=="在线支付"){
		$("#showdiv").css("display","block");
		}else{
			$("#showdiv").css("display","none");
			}
})
</script>
</html>
