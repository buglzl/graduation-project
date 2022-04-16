<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Ppinfo"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
	<meta charset="utf-8">
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=basePath%>">
    <meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">
    
	<link rel="stylesheet" type="text/css" href="/secondhandgoodsssh/admin/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/secondhandgoodsssh/admin/stylesheets/theme.css">
    <link rel="stylesheet" href="/secondhandgoodsssh/admin/lib/font-awesome/css/font-awesome.css">

    <script src="/secondhandgoodsssh/admin/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">

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
  
  <body class="">
	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    
<%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");  %>
    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">商品新增</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">商品新增</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">

<div class="well">
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
		    <form id="form" action="goodsadd.action" method="post" enctype="multipart/form-data">
		        <label>商品名称</label>
		        <input type="text" id="goodname" name="goodname" class="input-xlarge span5" required>
		        <label>商品分类</label>
		        			<select id="fid" name="fid" onChange="Change_Select()" class="input-xlarge" required>
								<option value="">请选择大类</option>
					    		<%ArrayList<Protype> fprotypelist = (ArrayList<Protype>)dao.findByHql(" from Protype where delstatus='0' and fatherid='0'"); 
					    		for(Protype fprotype:fprotypelist){%>
					    		<option value="<%=fprotype.getId() %>"><%=fprotype.getTypename() %></option>
					    		<%} %>
							</select>
							<select id="sid" name="sid" required>
							    <option value="">请选择小类</option>
							</select>
				<label>品牌</label>
		        <select id="goodpp" name="goodpp" class="input-xlarge" required>
						<option value="">请选择品牌</option>
					    <%ArrayList<Ppinfo> pplist = (ArrayList<Ppinfo>)dao.findByHql(" from Ppinfo where delstatus='0' "); 
					    for(Ppinfo ppmap:pplist){%>
					    <option value="<%=ppmap.getId() %>"><%=ppmap.getPpname() %></option>
					    <%} %>
				</select>
		        <label>商品价格</label>
		        <input type="number" step="0.1" id="price" name="price" class="input-xlarge" required>
		        <label>图片</label>
		        <input type="file" id="upFile" name="upFile" class="input-xlarge" required>
		        <label>商品描述</label>
		        <textarea id="editor_id" id="note" name="note" style="width:1000px;height:400px;" ></textarea>
		        <button class="btn btn-primary"><i class="icon-save"></i> Save</button>
		    </form>
      </div>
  </div>

</div>

<div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Delete Confirmation</h3>
  </div>
  <div class="modal-body">
    
    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
    <button class="btn btn-danger" data-dismiss="modal">Delete</button>
  </div>
</div>
            </div>
        </div>
    </div>

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
  </body>
</html>
