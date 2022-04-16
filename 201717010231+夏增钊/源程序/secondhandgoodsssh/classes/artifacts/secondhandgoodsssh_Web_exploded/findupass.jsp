<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
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
							  找回密码
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">	

			<div class="register">
				<div class="register-but">
				   <form name="f1" action="finduPass.action" method="post">
				   <div class="register-top-grid">
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
							<span>用户名<label>*</label></span>
							<input type="text" class="form-control" placeholder="登录名 :" name="uname" id="uname" required>
						</div>
						<div class="alert alert-info" id="pwderroinfo" style="display: none">
				        	<button type="button" class="close" data-dismiss="alert">×</button>
			    		</div>
						<div class="input">
							<span>电话<label>*</label></span>
							<input type="number" class="form-control" placeholder="电话:" name="tel" id="tel" required>
						</div>
						
						<div class="input">
							<input type="number" class="form-control" placeholder="验证码:" name="yzm" id="yzm" required>
							<img id="vcodeimg" src="./plusin/image.jsp" style="cursor: hand" onclick="this.src='./plusin/image.jsp?time=' + Math.random()"
                                title="点击刷新验证码" align="absMiddle" src="" />
						</div>
						
						<div class="clearfix"> </div>
						</div>
					   <input type="submit" value="提交 ">
					   <div class="clearfix"> </div>
				   </form>
				</div>
			</div>


							</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>


	<!--//account-->
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
  
  
</html>
