<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Protype"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
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

	
  </head>
  
  <body class="">
    
    <%	 CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
     String hql = " from Goods where 1=1 and delstatus='0' ";
	 String url = "/secondhandgoodsssh/admin/goodskc.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (goodname like'%"+key+"%' or goodno like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 if(!key1.equals(""))
	 {
		 hql+=" and (fid ='"+key1+"')";
	 url+="&key1="+key1;
	 }
	 if(!key2.equals(""))
	 {
		 hql+=" and (sid ='"+key2+"')";
	 url+="&key2="+key2;
	 }
	 hql+=" order by id desc";
%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">商品库存</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">商品库存</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            <%String suc = (String)request.getAttribute("suc");
			if(suc!=null){%>
			    <div class="alert alert-info">
			        <button type="button" class="close" data-dismiss="alert">×</button>
			        	<%=suc %>
			        	<script type="text/javascript">
			        		location.href="admin/goodskc.jsp";
			        	</script>
		    	</div>
			<%}%>
				<div class="btn-toolbar">
					<div class="search-well">
						<form action="admin/goodskc.jsp?f=f" method="post" class="form-inline">
							<input class="input-xlarge" placeholder="商品编号或名称..." id="key" name="key" type="text" value="<%=key %>">
							<select id="key1" name="key1" onChange="Change_Select()" class="input-xlarge">
							<option value="">请选择大类</option>
					    		<%
					    		ArrayList<Protype> fprotypelist = (ArrayList<Protype>)dao.findByHql("from Protype where delstatus='0' and fatherid='0'"); 
					    		for(Protype fprotype:fprotypelist){%>
					    		<option value="<%=fprotype.getId() %>" <%if(key1.equals(fprotype.getId().toString())){out.print("selected==selected");} %>><%=fprotype.getTypename() %></option>
					    		<%} %>
							</select>
							<select id="key2" name="key2" class="input-xlarge">
						    		<option value="">请选择小类</option>
						    		<%ArrayList<Protype> sprotypelist = (ArrayList<Protype>)dao.findByHql("from Protype where  fatherid='"+key1+"'"); 
						    		for(Protype sprotype:sprotypelist){%>
						    		<option value="<%=sprotype.getId() %>" <%if(key2.equals(sprotype.getId().toString())){out.print("selected==selected");} %>><%=sprotype.getTypename() %></option>
						    		<%} %>
						    </select>
		                    <button class="btn" type="submit"><i class="icon-search"></i> Go</button>
						</form>	
					</div>  	
				</div>
			
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>商品编号</th>
          <th>商品名称</th>
          <th>所属大类</th>
          <th>所属小类</th>
          <th>库存数量</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      <%
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/admin/goodskc.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Goods> list=( ArrayList<Goods>)bean.getCollection(); 
      for(Goods goods:list){
    	  	Protype fmap = (Protype)dao.findById(goods.getFid(),"Protype");
   			Protype smap = (Protype)dao.findById(goods.getSid(),"Protype");
	    %>
        <tr>
          <td><%=goods.getGoodno() %></td>
          <td><%=goods.getGoodname() %></td>
          <td><%=fmap.getTypename() %></td>
          <td><%=smap.getTypename() %></td>
          <td>
          	<%=dao.getkc(goods.getId()) %>
		    <%if(dao.getkc(goods.getId())==0){ %>
		    <font color="red">(该商品库存不足，请补仓)</font>
		    <%} %>
          </td>
          <td>
              <a href="admin/goodskcadd.jsp?gid=<%=goods.getId() %>" title="入库"><i class="icon-plus"></i></a>
          </td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
<div class="pagination">
    ${page.info }
</div>

    <script src="/secondhandgoodsssh/admin/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
        
        $(function(){
      	  var key2 = $("#key2");
      	  //var opt = $("#key2 option");
      	  $('#key1').change(function(){
	        	  $.ajax({
		        	  url:"searchsontype.action?fatherid="+$('#key1').val(),
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
