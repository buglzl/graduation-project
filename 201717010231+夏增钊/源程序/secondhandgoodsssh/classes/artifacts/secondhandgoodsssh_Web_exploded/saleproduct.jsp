<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Imgadv"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Goods"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Member"%>
<%@page import="com.model.Ddinfo"%>
<%@page import="com.model.Dddetail"%>
<%@page import="com.model.Pj"%>

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
  <body>
  	<jsp:include page="top.jsp"></jsp:include>
    
						
    <div class="collpse tabs">
		<div class="container">
			<div class="panel-group collpse" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							  销售订单
							</a>
						</h4>
					</div>
					
					<%String suc = (String)request.getAttribute("suc");
						if(suc!=null){%>
						    <div class="alert alert-info">
						        <button type="button" class="close" data-dismiss="alert">×</button>
						        	<%=suc %>
					    	</div>
						<%}%>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">	
	<!--gallery-->
	
		<%	 
	 CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
	 Member member = (Member)session.getAttribute("member");  
     String hql = "from Dddetail where 1=1 and delstatus='0' and goodid in (select id from Goods where saver='"+member.getId()+"') and ddno in (select ddno from Ddinfo where delstatus='0')";
	 String url = "/secondhandgoodsssh/saleproduct.jsp?1=1";
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
		 hql+=" and (ddno like '%"+key+"%')";
	 url+="&key="+key;
	 }
	 if(!key1.equals(""))
	 {
		 hql+=" and (savetime >='"+key1+"')";
	 url+="&key1="+key1;
	 }
	 
	 if(!key2.equals(""))
	 {
		 hql+=" and (savetime <='"+key2+"')";
	 url+="&key2="+key2;
	 }
	 hql+=" order by id desc";
%>
		<div>
    <table class="table">
      <thead>
        <tr>
          <td colspan="8" align="center">
          <form name="f1" action="saleproduct.jsp?f=f" method="post">
          <input type="text"  style="width: 200px;border-radius:5px 5px;borer:1px solid #CCCCCC;background: white;height: 38px;" value="<%=key %>" name="key"/>
          <input type="date" style="width: 200px;border-radius:5px 5px;borer:1px solid #CCCCCC;background: white;" value="<%=key1 %>" name="key1"/>
          <input type="date"  style="width: 200px;border-radius:5px 5px;borer:1px solid #CCCCCC;background: white;"  value="<%=key2 %>" name="key2"/>
          <input type="submit"  value="查询" style="width: 80px;height: 38px;"/>
          </form>
          </td>
        </tr>
        <tr>
          <th>销售订单编号</th>
          <th>订单商品</th>
          <th>订单金额</th>
          <th>支付方式</th>
          <th>创建时间</th>
          <th>付款状态</th>
          <th>发货状态</th>
          <th>收货状态</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody>
      <%
      String did = request.getParameter("did");
      if(did!=null)
      {
    	  Dddetail di = (Dddetail)dao.findById(did,"Dddetail");
    	  di.setDelstatus("1");
    	  dao.update(di);
      }
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/saleproduct.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Dddetail> list=( ArrayList<Dddetail>)bean.getCollection(); 
      for(Dddetail df:list){
      df.setCkstatus("old");
      dao.update(df);
     //Ddinfo ddinfo = (Ddinfo)dao.findByHql("from Ddinfo where ddno='"+df.getDdno()+"'").get(0);
	    %>
        <tr>
          <td><%=df.getGoodno() %></td>
          <td>
          		<%
                	Goods gmap = (Goods)dao.findById(df.getGoodid(),"Goods");
                %>
                <a href="good.jsp?gid=<%=gmap.getId() %>"><%=gmap.getGoodname() %></a>
                
                &nbsp;&nbsp;&nbsp;数量：<%=df.getSl() %>&nbsp;&nbsp;&nbsp;
          </td>
          <td><%=df.getTotal() %></td>
          <td><%=df.getZffs() %></td>
          <td><%=df.getSavetime() %></td>
          <td><%=df.getFkstatus() %></td>
          <td><%=df.getFhstatus() %></td>
          <td><%=df.getShstatus() %></td>
          <td>
   			  <%if(df.getZffs().equals("在线支付")&&df.getFkstatus().equals("已付款")&&df.getFhstatus().equals("待发货")){ %>
               <a href="fahuo.action?ddid=<%=df.getId() %>" class="add-cart item_add">发货</a>
               <%} %>
               <%if(df.getZffs().equals("货到付款")&&df.getFhstatus().equals("待发货")){ %>
               <a href="fahuo.action?ddid=<%=df.getId() %>" class="add-cart item_add">发货</a>
               <%} %>
               
               <% 
               ArrayList<Pj> plist = (ArrayList<Pj>)dao.findByHql("from Pj where ddid='"+df.getId()+"' and hf=''");
                %>
               <%if(plist.size()!=0){ %>
               <a href="pjhf.jsp?ddid=<%=df.getId() %>" class="add-cart item_add">评价回复</a>
               <%} %>
               
               <a href="saleproduct.jsp?did=<%=df.getId() %>" class="add-cart item_add">删除</a>
						                
          </td>
        </tr>
        <%} %>
      </tbody>
    </table>
</div>
	<div align="center">${page.info }</div>
	<!--//gallery-->
							</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
