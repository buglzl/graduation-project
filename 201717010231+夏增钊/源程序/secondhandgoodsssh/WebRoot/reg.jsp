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
	<script src="js/imagezoom.js"></script>
	<!-- //js -->
	<!-- cart -->
	<script src="js/simpleCart.min.js"> </script>
	<!-- cart -->
	<!-- FlexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	
	
	
	
	<script type="text/javascript" src="/secondhandgoodsssh/distpicker/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/bootstrap-3.1.1.min.js"></script>
    
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/distpicker.data.js"></script>
    
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/distpicker.js"></script>
    
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/main.js"></script>
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
							  新用户注册
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">	


			<div class="register">
				<div class="register-but">
				   <form name="f1" action="memberReg.action" method="post" enctype="multipart/form-data">
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
							<span>头像<label>*</label></span>
							<input type="file" id="upFile" name="upFile" class="form-control" required>
						</div>
						<div class="input">
							<span>登录名<label>*</label></span>
							<input type="text" class="form-control" placeholder="登录名 :" name="uname" id="uname" onblur="validatorloginName()" required>
						</div>
						
						<div class="alert alert-info" id="pwderroinfo" style="display: none">
				        	<button type="button" class="close" data-dismiss="alert">×</button>
			    		</div>
						<div class="input">
							<span>密码<label>*</label></span>
							<input type="password" class="form-control" placeholder="密码 :" name="upass" id="upass" required>
						</div>
						<div class="input">
							<span>重复密码<label>*</label></span>
							<input type="password" class="form-control" placeholder="再次输入密码 :" name="upass1" id="upass1" onblur="validatorpwd()" required>
						</div>
						<div class="input">
							<span>姓名<label>*</label></span>
							<input type="text" class="form-control" placeholder="姓名:" name="tname" id="tname" required>
						</div>
						<div class="input">
							<span>性别<label>*</label></span>
							<input name="sex" id="sex" type="radio" checked="checked" value="男"> 男 
							<input name="sex" id="sex" type="radio" value="女"> 女
						</div>
						
						<div class="input">
							<span>电子邮箱<label>*</label></span>
							<input type="text" class="form-control" placeholder="电子邮箱 :" name="email" id="email" required>
						</div>
						
						<div class="input">
							<span>QQ<label>*</label></span>
							<input type="text" class="form-control" placeholder="qq :" name="qq" id="qq" required>
						</div>
						
						<div class="input">
							<span>电话<label>*</label></span>
							<input type="text" class="form-control" placeholder="电话 :" name="tel" id="tel" required>
						</div>
						
						<div class="input" >
							<span>地区<label>*</label></span>
							<div data-toggle="distpicker">
        						<div class="form-group">
          							<label class="sr-only" for="province2">Province</label>
          							<select class="form-control" name="sheng" id="province2" data-province="---- 选择省 ----"></select>
        						</div>
						        <div class="form-group">
						          <label class="sr-only" for="city2">City</label>
						          <select class="form-control" id="city2" name="shi"  data-city="---- 选择市 ----"></select>
						        </div>
     						 </div>
						</div>
						
						<div class="input">
							<span>地址<label>*</label></span>
							<input type="text" class="form-control" placeholder="地址 :" name="addr" id="addr" required>
						</div>
						
						<div class="input">
							<span>签名<label>*</label></span>
							<textarea cols="" rows="" class="form-control" name="qianming" id="qianming"></textarea>
						</div>
						
						<div class="clearfix"> </div>
						</div>
					   <input type="submit" value="注册">
					   <div class="clearfix"> </div>
				   </form>
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
  <script type="text/javascript">
function validatorpwd(){
	if(f1.upass.value!=f1.upass1.value){
		$("#pwderroinfo").show(); 
		$("#pwderroinfo").html("两次密码不一致");
		return false;
	}else{
		$("#pwderroinfo").hide(); 
	}
}

function validatorloginName(){     
	 var uname=f1.uname.value;
	 $.ajax({  
	        type: "POST",      
	         url: "usernamecheck.action", //servlet的名字     
	          data: "uname="+uname, 
	         success: function(data){   
	    if(data==0){     
	    	$("#erroinfo").show();
	     	$("#erroinfo").html("用户名可用");
	    }else{    
	    	$("#erroinfo").show(); 
	     	$("#erroinfo").html("用户名已存在");
	     	f1.uname.value = "";
	    }     
	 }     
	}); 
	}     
</script>
</html>
