<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Dddetail"%>
<%@page import="com.model.Goods"%>
<%@page import="java.text.DecimalFormat"%>
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
	 String hql = " from Sysuser where 1=1  and delstatus=0 and username<>'admin'";
	 String url = "/secondhandgoodsssh/admin/userlist.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 	key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (username like'%"+key+"%' or realname like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 	hql+=" order by id desc";
	%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
          <div class="header">
            
            <h1 class="page-title">用户管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">用户管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            <%String suc = (String)request.getAttribute("suc");
			if(suc!=null){%>
			    <div class="alert alert-info">
			        <button type="button" class="close" data-dismiss="alert">×</button>
			        	<%=suc %>
			        	<script type="text/javascript">
			        		location.href="admin/userlist.jsp";
			        	</script>
		    	</div>
			<%}%>
            	<div class="btn-toolbar">
					<div class="search-well">
						<form action="admin/userlist.jsp?f=f" method="post" class="form-inline">
							<input class="input-xlarge" placeholder="用户名或姓名..." id="key" name="key" type="text" value="<%=key %>">
		                    <button class="btn" type="submit"><i class="icon-search"></i> Go</button>
		                    <button class="btn btn-primary" onclick="useradd()" type="button"><i class="icon-plus"></i> 系统用户</button>
						</form>	
					</div>  	
				</div>
<div class="well">

    <table class="table">
      <thead>
        <tr>
          <th>登陆名</th>
          <th>登陆密码</th>
          <th>姓名</th>
          <th>性别</th>
          <th>身份证号</th>
          <th>联系电话</th>
          <th>email</th>
          <th>地址</th>
          <th>用色</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      <%String did = request.getParameter("did");
	   if(did!=null)
	   {
		   Sysuser sr = (Sysuser)dao.findById(did,"Sysuser");
		   sr.setDelstatus("1");
		   dao.update(sr);
	   }
	   PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/admin/userlist.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Sysuser> list=( ArrayList<Sysuser>)bean.getCollection(); 
	   for(Sysuser sysuser:list){
	    %>
        <tr>
          <td><%=sysuser.getUsername() %></td>
          <td><%=sysuser.getUserpwd() %></td>
          <td><%=sysuser.getRealname() %></td>
          <td><%=sysuser.getSex() %></td>
          <td><%=sysuser.getIdcard() %></td>
          <td><%=sysuser.getTel() %></td>
          <td><%=sysuser.getEmail() %></td>
          <td><%=sysuser.getAddr() %></td>
          <td><%=sysuser.getUsertype() %></td>
          <td>
          	  <a href="admin/useredit.jsp?id=<%=sysuser.getId() %>"><i class="icon-pencil"></i></a>
              <a href="admin/userlist.jsp?did=<%=sysuser.getId() %>" ><i class="icon-remove"></i></a>
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
	function useradd(){
		location.href="admin/useradd.jsp";
    }
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
  </body>
</html>
