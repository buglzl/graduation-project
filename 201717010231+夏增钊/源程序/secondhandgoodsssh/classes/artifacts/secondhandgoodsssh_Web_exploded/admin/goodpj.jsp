<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.util.Info"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Pj"%>
<%@page import="com.model.Member"%>
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
    
    <%
     CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
     String gid = request.getParameter("gid");
	 String hql = " from Pj where 1=1  ";
	 String url = "/secondhandgoodsssh/admin/goodpj.jsp?1=1&gid="+gid;
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 	key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (title like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 	hql+=" order by id desc";
%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">评价管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">评价管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            <%String suc = (String)request.getAttribute("suc");
			if(suc!=null){%>
			    <div class="alert alert-info">
			        <button type="button" class="close" data-dismiss="alert">×</button>
			        	<%=suc %>
		    	</div>
			<%}%>
			
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>内容</th>
          <th>评分</th>
          <th>时间</th>
          <th>评价人</th>
          <th>回复</th>
          <th>操作</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      <%String did = request.getParameter("did");
      if(did!=null)
      {
    	  dao.delete(did,"Pj");
      }
      
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/admin/goodsgl.jsp?1=1&gid="+gid,10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Pj> list=( ArrayList<Pj>)bean.getCollection(); 
      for(Pj pj:list){
    	  Member member = (Member)dao.findById(pj.getMemberid(),"Member");
	    %>
        <tr>
          <td><%=pj.getMsg() %></td>
          <td><%=pj.getJb() %></td>
          <td><%=pj.getSavetime() %></td>
          <td><%=member.getTname() %></td>
          <td><%=pj.getHf() %></td>
          <td>
              
              <a href="admin/goodpj.jsp?did=<%=pj.getId() %>" ><i class="icon-remove"></i></a>
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
  </body>
</html>
