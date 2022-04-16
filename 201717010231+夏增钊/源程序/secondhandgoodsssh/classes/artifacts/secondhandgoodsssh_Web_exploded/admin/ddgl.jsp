<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Ddinfo"%>
<%@page import="com.model.Addr"%>
<%@page import="com.model.Dddetail"%>
<%@page import="com.model.Goods"%>
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
    String hql = " from Ddinfo where 1=1  ";
	 String url = "/secondhandgoodsssh/admin/ddgl.jsp?1=1";
	 String key = request.getParameter("key")==null?"":request.getParameter("key");
	 String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
	 String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
	 String f = request.getParameter("f");
	 if(f==null)
	 {
	 key = Info.getUTFStr(key);
	 key1 = Info.getUTFStr(key1);
	 key2 = Info.getUTFStr(key2);
	 }
	 if(!key.equals(""))
	 {
		 hql+=" and (ddno = '"+key+"')";
	 url+="&key="+key;
	 }
	 if(!key1.equals(""))
	 {
		 hql+=" and (fkstatus ='"+key1+"')";
	 url+="&key1="+key1;
	 }
	 if(!key2.equals(""))
	 {
		 hql+=" and (fhstatus ='"+key2+"')";
	 url+="&key2="+key2;
	 }
	 hql+=" order by id desc";
%>

	<jsp:include page="/admin/top.jsp"></jsp:include>
    
    <jsp:include page="/admin/left.jsp"></jsp:include>
    

    
       <div class="content">
        
        <div class="header">
            
            <h1 class="page-title">订单管理</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="admin/index.jsp">Home</a> <span class="divider">/</span></li>
            <li class="active">订单管理</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
            <%String info = (String)request.getAttribute("info");
			if(info!=null){%>
			    <div class="alert alert-info">
			        <button type="button" class="close" data-dismiss="alert">×</button>
			        	<%=info %>
			        	<script type="text/javascript">
			        		location.href="admin/ddgl.jsp";
			        	</script>
		    	</div>
			<%}%>
				<div class="btn-toolbar">
					<div class="search-well">
						<form action="admin/ddgl.jsp?f=f" method="post" class="form-inline">
							<input class="input-xlarge" placeholder="订单号..." id="key" name="key" type="text" value="<%=key %>">
							<select id="key2" name="key2">
					    		<option value="">发货状态</option>
					    		<option value="待发货" <%if(key2.equals("待发货")){out.print("selected==selected");} %>>待发货</option>
					    		<option value="已发货" <%if(key2.equals("已发货")){out.print("selected==selected");} %>>已发货</option>
					    	</select>
		                    <button class="btn" type="submit"><i class="icon-search"></i> Go</button>
						</form>	
					</div>  	
				</div>
			
<div class="well">
    <table class="table">
      <thead>
        <tr>
          <th>订单编号</th>
          <th>订单商品</th>
          <th>订单金额</th>
          <th>收货人信息</th>
          <th>付款状态</th>
          <th>发货状态</th>
          <th>收货状态</th>
          <th>物流信息</th>
          <th style="width: 26px;"></th>
        </tr>
      </thead>
      <tbody>
      <%
      String did = request.getParameter("did");
      if(did!=null)
      {
    	  dao.delete(did,"Ddinfo");
      }
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/admin/goodsgl.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Ddinfo> list=( ArrayList<Ddinfo>)bean.getCollection(); 
      for(Ddinfo df:list){
	    %>
        <tr>
          <td><%=df.getDdno() %></td>
          <td>
          		<%ArrayList<Dddetail> dddetaillist = (ArrayList<Dddetail>)dao.findByHql(" from Dddetail where ddno="+df.getDdno()); 
                for(Dddetail dddetail:dddetaillist){
                	Goods gmap = (Goods)dao.findById(dddetail.getGoodid(),"Goods");
                %>
                <%=gmap.getGoodname() %>&nbsp;&nbsp;&nbsp;数量：<%=dddetail.getSl() %><br/>
                <%} %>
          </td>
          <td><%=df.getDdprice() %></td>
          <td><%=df.getShrname() %><br/><%=df.getShrtel() %><br/><%=df.getShraddr() %></td>
          <td><%=df.getFkstatus() %></td>
          <td><%=df.getFhstatus() %></td>
          <td><%=df.getShstatus() %></td>
          <td><%=df.getWlinfo() %></td>
          <td>
          <%if(df.getFkstatus().equals("已付款")&&df.getFhstatus().equals("待发货")){ %>
			<a href="admin/ddfh.jsp?ddid=<%=df.getId() %>" title="发货"><i class="icon-pencil"></i></a>
		   <%} %>
		   <%if(df.getFkstatus().equals("待付款")){ %>
		    <a href="admin/ddgl.jsp?did=<%=df.getId() %>" title="删除"><i class="icon-remove"></i></a>
		    <%} %>
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
