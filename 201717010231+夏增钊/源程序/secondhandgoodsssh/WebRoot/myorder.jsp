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
<%@page import="com.model.Kcrecord"%>

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
	<script  src="layer/jquery-2.0.3.min.js"></script>
	<script  src="layer/layer.js"></script>
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
							  我的订单
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">	
	<!--gallery-->
	
		<%	 
		CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
		Member member = (Member)session.getAttribute("member");  
     String hql = " from Ddinfo where 1=1 and memberid='"+member.getId()+"' and delstatus='0'";
	 String url = "/secondhandgoodsssh/myorder.jsp?1=1";
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
		 hql+=" and savetime >='"+key1+"'";
	 url+="&key1="+key1;
	 }
	 
	 if(!key2.equals(""))
	 {
	 hql+=" and savetime <='"+key2+"'";
	 url+="&key2="+key2;
	 }
	 hql+=" order by id desc";
	 System.out.println("hql==="+hql);
%>
		<div>
    <table class="table">
      <thead>
        <tr style="border-bottom: 0px;">
          <td colspan="8" align="center" >
          <form name="f1" action="myorder.jsp?f=f" method="post">
          <input type="text"  style="width: 200px;border-radius:5px 5px;borer:1px solid #CCCCCC;background: white;height: 38px;" value="<%=key %>" name="key"/>
          <input type="date" style="width: 200px;border-radius:5px 5px;borer:1px solid #CCCCCC;background: white;" value="<%=key1 %>" name="key1"/>
          <input type="date"  style="width: 200px;border-radius:5px 5px;borer:1px solid #CCCCCC;background: white;"  value="<%=key2 %>" name="key2"/>
          <input type="submit"  value="查询" style="width: 80px;height: 38px;"/>
          </form>
          </td>
        </tr>
        <tr>
          <th>订单编号</th>
          <th>订单信息</th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      <%
      String did = request.getParameter("did");
      if(did!=null)
      {
    	  Ddinfo ddinfo = (Ddinfo)dao.findById(did,"Ddinfo");
    	  ddinfo.setDelstatus("1");
    	  dao.update(ddinfo);
      }
      String shid = request.getParameter("shid");
      if(shid!=null)
      {
    	  Ddinfo di = (Ddinfo)dao.findById(shid,"Ddinfo");
    	  Dddetail ddi = (Dddetail)dao.findByHql(" from Dddetail where ddno='"+di.getDdno()+"'").get(0);
    	  Kcrecord kc = new Kcrecord();
    	  kc.setGid(ddi.getGoodid());
    	  kc.setHappennum(ddi.getSl());
    	  kc.setType("out");
    	  dao.save(kc);
    	  int kcnum = dao.getkc(Integer.parseInt(ddi.getGoodid()));
    	  if(kcnum==0){
    	  Goods g = (Goods)dao.findById(ddi.getGoodid(),"Goods");
    	  g.setIstj("no");
    	  dao.update(g);
    	  }
    	  di.setShstatus("已收货");
    	  dao.update(di);
      }
      PageManager pageManager = PageManager.getPage("/secondhandgoodsssh/myorder.jsp?1=1",10, request);
      pageManager.doList(hql);
      PageManager bean= (PageManager)request.getAttribute("page");
      ArrayList<Ddinfo> list=( ArrayList<Ddinfo>)bean.getCollection(); 
      int i=0;
      for(Ddinfo df:list){
    	  ArrayList<Dddetail> dddetaillist = (ArrayList<Dddetail>)dao.findByHql(" from Dddetail where ddno='"+df.getDdno()+"'");
	    %>
        <tr>
          <td><%=df.getDdno() %>&nbsp;&nbsp;<a href="myorder.jsp?did=<%=df.getId() %>" ><i class="">删除</i></a></td>
          
          
          <td colspan="7">
            <table width="100%">
            <%
                for(Dddetail dddetail:dddetaillist){
                Goods gmap = (Goods)dao.findById(dddetail.getGoodid(),"Goods");
                %>
              <tr>
                <td height="40">
                   <a href="good.jsp?gid=<%=gmap.getId() %>"><%=gmap.getGoodname() %></a>&nbsp;&nbsp;&nbsp;数量：<%=dddetail.getSl() %>
                   <% 
                   ArrayList<Pj> pjlist = (ArrayList<Pj>)dao.findByHql(" from Pj where goodid='"+gmap.getId()+"' and memberid='"+member.getId()+"' and ddid='"+dddetail.getId()+"'");
                   if(pjlist.size()==0&&dddetail.getShstatus().equals("已收货")){
                   %>
                   <a href="pj.jsp?id=<%=gmap.getId() %>&ddid=<%=dddetail.getId() %>">[评价]</a>
                   <%} %>
                </td>
                <td>￥<%=dddetail.getTotal() %></td>
                <td><%=dddetail.getZffs() %></td>
                <td><%=dddetail.getSavetime() %></td>
                <td><%=dddetail.getFkstatus() %></td>
                <td><%=dddetail.getFhstatus() %></td>
                <td><%=dddetail.getShstatus() %></td>
                <td>
                   <%if(dddetail.getZffs().equals("货到付款")&&dddetail.getShstatus().equals("待收货")&&dddetail.getFhstatus().equals("已发货")){ %>
          			<a href="shouhou.action?qsid=<%=dddetail.getId() %>" class="add-cart item_add">付款并签收</a>
          			<%}%>
          			
          			<%if(dddetail.getZffs().equals("在线支付")&&dddetail.getFkstatus().equals("已付款")&&dddetail.getFhstatus().equals("已发货")&&dddetail.getShstatus().equals("待收货")){ %>
          			<a href="shouhou.action?qsid=<%=dddetail.getId() %>" class="add-cart item_add">签收</a>
          			<%}%>
          			
          			<%if(dddetail.getZffs().equals("在线支付")&&dddetail.getFkstatus().equals("待付款")){ %>
          			<a href="orderpay.jsp?ddid=<%=df.getId() %>" class="add-cart item_add">付款</a>
          			<%}%>
          			
          			<%if(dddetail.getZffs().equals("在线支付")&&dddetail.getFkstatus().equals("待付款")){ %>
          			<a href="orderpay.jsp?ddid=<%=df.getId() %>" class="add-cart item_add">付款</a>
          			<%}%>
                </td>
              </tr>
              <%} %>
            </table>
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
  <script type="text/javascript">
  <% 
  String suc = (String)request.getAttribute("suc");
  if(suc!=null){
  %>
  layer.msg('<%=suc %>');
  <%} %>
  </script>
</html>
