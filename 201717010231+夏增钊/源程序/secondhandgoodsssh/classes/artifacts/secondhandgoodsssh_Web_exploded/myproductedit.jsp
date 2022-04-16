<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Ppinfo"%>
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
    String id = request.getParameter("id");
    CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
    Goods goods = (Goods)dao.findById(id,"Goods");
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
							  修改商品
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">

<div class="register">
				<div class="register-but">
				   <form name="f1" action="goodsedit.action?id=<%=id %>" method="post" enctype="multipart/form-data">
				   <div>
						<%
						String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        <button type="button" class="close" data-dismiss="alert">×</button>
						        	<%=suc %>
					    	</div>
						<%}%>
						<div class="input">
							<span>商品名称<label>*</label></span>
							<input type="text" class="form-control" id="goodname" name="goodname" value="<%=goods.getGoodname() %>" placeholder="商品名称 ..."  required>
						</div>
						<label></label>
						
						<div class="input">
							<span>商品分类<label>*</label></span>
							<select class="form-control" id="fid" name="fid" onChange="Change_Select()" class="input-xlarge" required>
								<option value="">请选择大类</option>
					    		<%ArrayList<Protype> fprotypelist = (ArrayList<Protype>)dao.findByHql(" from Protype where delstatus='0' and fatherid='0'"); 
					    		for(Protype fprotype:fprotypelist){%>
					    		<option value="<%=fprotype.getId() %>" <%if(fprotype.getId().toString().equals(goods.getFid().toString())){out.println("selected");} %>><%=fprotype.getTypename() %></option>
					    		<%} %>
							</select>
							<select class="form-control" id="sid" name="sid" required>
							    <option value="">请选择小类</option>
							</select>
						</div>
						<label></label>
						
						<div class="input">
							<span>商品品牌<label>*</label></span>
					    <select id="goodpp" name="goodpp" class="form-control" required>
						<option value="">请选择品牌</option>
					    <%ArrayList<Ppinfo> pplist = (ArrayList<Ppinfo>)dao.findByHql(" from Ppinfo where delstatus='0' "); 
					    for(Ppinfo ppmap:pplist){%>
					    <option value="<%=ppmap.getId() %>" <%if(ppmap.getId().toString().equals(goods.getGoodpp().toString())){out.println("selected");} %>><%=ppmap.getPpname() %></option>
					    <%} %>
				</select>
						</div>
						<label></label>
						
						<div class="input">
							<span>商品价格<label>*</label></span>
							<input class="form-control" placeholder="商品价格 ..." type="number" step="0.1" id="price" name="price" value="<%=goods.getPrice() %>" class="input-xlarge" required>
						</div>
						<label></label>
						
						<div class="input">
							<span>商品图片<label>*</label></span>
							<input class="form-control" type="file" id="upFile" name="upFile" class="input-xlarge" >
						</div>
						<label></label>
						
						<div class="input">
							<span>发货方式<label>*</label></span>
							<select name="fhfs" id="fhfs" required class="form-control">
							  <option value="当面交易" <%=goods.getFhfs().equals("当面交易")?"selected":"" %>>当面交易</option>
							  <option value="快递"  <%=goods.getFhfs().equals("快递")?"selected":"" %>>快递</option>
							</select>
						</div>
						<label></label>
						
						
						<div class="input">
							<span>商品描述<label>*</label></span>
							<textarea class="form-control" id="editor_id" id="note" name="note" style="width:680px;height:400px;" ><%=goods.getNote() %></textarea>
						</div>
						
						<div class="clearfix"> </div>
						</div>
					   <input type="submit" value="保存">
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
