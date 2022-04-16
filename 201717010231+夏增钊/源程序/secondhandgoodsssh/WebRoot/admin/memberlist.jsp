<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.util.Info"%>
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
    
    <%	CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
	 String hql = "from Member where 1=1  and delstatus=0 ";
	 String url = "/secondhandgoodsssh/admin/memberlist.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String f = request.getParameter("f");
	 if(f!=null)
	 {
	 key = Info.getUTFStr(key);
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (uname like'%"+key+"%' or tname like'%"+key+"%')";
	 url+="&key="+key;
	 }
	 hql+=" order by id desc";
	%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
          <div class="header">
            
            <h1 class="page-title">会员管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">会员管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            
            	<div class="btn-toolbar">
					<div class="search-well">
						<form action="admin/memberlist.jsp?f=f" method="post" class="form-inline">
							<input class="input-xlarge" placeholder="登陆名或姓名..." id="key" name="key" type="text" value="<%=key %>">
		                    <button class="btn" type="submit"><i class="icon-search"></i> Go</button>
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
          <th>email</th>
          <th>qq</th>
          <th>省</th>
          <th>市</th>
          <th>审核状态</th>
          <th style="width: 100px;"></th>
        </tr>
      </thead>
      <tbody>
      <%
      String did = request.getParameter("did");
	   if(did!=null)
	   {
		   Member mb = (Member)dao.findById(did,"Member");
		   mb.setDelstatus("1");
		   dao.update(mb);
	   }
	   
	   String tgid = request.getParameter("tgid");
	   if(tgid!=null)
	   {
		   Member mb = (Member)dao.findById(tgid,"Member");
		   mb.setShstatus("通过");
		   dao.update(mb);
	   }
	    PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/admin/memberlist.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Member> list=( ArrayList<Member>)bean.getCollection(); 
	   for(Member member:list){
	    %>
        <tr>
          <td><%=member.getUname() %></td>
          <td><%=member.getUpass() %></td>
          <td><%=member.getTname() %></td>
          <td><%=member.getSex() %></td>
          <td><%=member.getTel() %></td>
          <td><%=member.getEmail() %></td>
          <td><%=member.getQq() %></td>
          <td><%=member.getSheng() %></td>
          <td><%=member.getShi() %></td>
          <td><%=member.getShstatus() %></td>
          <td>
              <%if(member.getShstatus().equals("待审核")){ %>
              <a href="admin/memberlist.jsp?tgid=<%=member.getId() %>" ><i class="">通过</i></a>
              <%} %>
              <a href="admin/memberlist.jsp?did=<%=member.getId() %>" ><i class="icon-remove"></i></a>
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
    </script>
  </body>
</html>
