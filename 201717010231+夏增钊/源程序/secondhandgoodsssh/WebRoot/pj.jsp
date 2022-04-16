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
    <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  
    String id = request.getParameter("id");
    String ddid = request.getParameter("ddid");
    Goods gs = (Goods)dao.findById(id,"Goods");%>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
    
<!--account-->
	
	<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							 商品评价
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
	
			<div class="register">
				<div class="register-but">
				   <form name="f1" action="pjAdd.action?goodid=<%=id %>&ddid=<%=ddid %>" method="post">
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
							<span>商品名称</span>
							<%=gs.getGoodname() %>
						</div>
						<div class="input">
							<span>评分等级<label>*</label></span>
									<select id="jb" name="jb" required>
                                  		<option value="5">5</option>
                                  		<option value="4">4</option>
                                  		<option value="3">3</option>
                                  		<option value="2">2</option>
                                  		<option value="1">1</option>
                                  	</select>分
						</div>
						<div class="input">
							<span>评价内容<label>*</label></span>
							<input type="text" class="form-control" placeholder="评价内容:" name="msg" id="msg" required>
						</div>
						<div class="clearfix"> </div>
						</div>
					   <input type="submit" value="提交评价">
					   <div class="clearfix"> </div>
				   </form>
				</div>
			</div>


								</div>
					</div>
				</div>
</div></div></div>


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
