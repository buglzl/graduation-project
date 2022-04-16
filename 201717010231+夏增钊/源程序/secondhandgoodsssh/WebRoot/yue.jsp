<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Ppinfo"%>
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
	<script charset="utf-8" src="/secondhandgoodsssh/kindeditor/kindeditor.js"></script>
	<script charset="utf-8" src="/secondhandgoodsssh/kindeditor/lang/zh-CN.js"></script>
	<script>
	        KindEditor.ready(function(K) {
	                window.editor = K.create('#editor_id');
	        });
	</script>
	<script>

KindEditor.ready(function(K) {

K.create('textarea[name="note"]', {

uploadJson : '/secondhandgoodsssh/kindeditor/jsp/upload_json.jsp',

                fileManagerJson : '/secondhandgoodsssh/kindeditor/jsp/file_manager_json.jsp',

                allowFileManager : true,

                allowImageUpload : true, 

autoHeightMode : true,

afterCreate : function() {this.loadPlugin('autoheight');},

afterBlur : function(){ this.sync(); }  //Kindeditor下获取文本框信息

});

});

</script>
  </head>
    <%
    CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  
    Member member = (Member)session.getAttribute("member");
    Member m = (Member)dao.findById(member.getId(),"Member");
    %>
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
    
<div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  余额
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">

<div class="register">
				<div class="register-but">
				   <form name="f1" action="chongzhiAdd.action?id=<%=m.getId() %>" method="post" >
				   <div>
						<%
						String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        <button type="button" class="close" data-dismiss="alert">×</button>
						        	<%=suc %>
					    	</div>
						<%}%>
						<div class="input" style="text-align: center;font-size:20px; color:red">
							<b><%=m.getYue().toString() %>￥</b>
						</div>
						<label></label>
						
						<div class="input">
							<input type="number" class="form-control" id="jine" name="jine" placeholder="充值金额 ..."  required>
						</div>
						<label></label>
						
						
						<div class="clearfix"> </div>
						</div>
					   <input type="submit" value="充值">
					   <div class="clearfix"> </div>
				   </form>
</div></div>
						</div>
					</div>
				</div>
</div></div></div>


	<!--//account-->
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
  <script src="/secondhandgoodsssh/admin/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
    	
	
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });

        $(function(){
      	  var key2 = $("#sid");
      	  //var opt = $("#key2 option");
      	  $('#fid').change(function(){
	        	  $.ajax({
		        	  url:"searchsontype.action?fatherid="+$('#fid').val(),
		        	  datetype:"json",
		        	  type:"post",
		        	  contentType: "application/Json; charset=UTF-8",
		        	  success:function(msg){
			        	  key2.empty();
			        	  //key2.append("<option value=\"\">请选择</option>");
			        	  key2.append(msg);
      	  		  }
      	  		});
      		});
      	});
    </script>
</html>
