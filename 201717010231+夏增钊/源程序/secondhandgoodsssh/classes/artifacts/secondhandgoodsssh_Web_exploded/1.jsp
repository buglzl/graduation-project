<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!--  <!DOCTYPE html>-->
<html lang="en">
    <head>
	<meta charset="utf-8">
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="<%=basePath%>">
    <meta name="description" content="Admin panel developed with the Bootstrap from Twitter.">
    <meta name="author" content="travis">
    
	<!--  <link rel="stylesheet" type="text/css" href="/secondhandgoodsssh/admin/lib/bootstrap/css/bootstrap.css">-->
    <link rel="stylesheet" type="text/css" href="/secondhandgoodsssh/admin/stylesheets/theme.css">
    <link rel="stylesheet" href="/secondhandgoodsssh/admin/lib/font-awesome/css/font-awesome.css">
    
    <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
    
    
    
  </head>
  <body>
  
  <form class="form-inline" action="testAdd.action" method="post">
      <div data-toggle="distpicker">
        <div class="form-group">
          <label class="sr-only" for="province2">Province</label>
          <select class="form-control" name="sheng" id="province2" data-province="---- 选择省 ----"></select>
        </div>
        <div class="form-group">
          <label class="sr-only" for="city2">City</label>
          <select class="form-control" id="city2" name="shi" data-city="---- 选择市 ----"></select>
        </div>
        <div class="form-group">
          <label class="sr-only" for="district2">District</label>
          <select class="form-control" id="district2" name="qu" data-district="---- 选择区 ----"></select>
        </div>
      </div>
      
      <div><input type="submit" value="提交"/></div>
    </form>

  </body>
  
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/bootstrap-3.1.1.min.js"></script>
    
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/distpicker.data.js"></script>
    
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/distpicker.js"></script>
    
    <script type="text/javascript" src="/secondhandgoodsssh/distpicker/main.js"></script>

</html>
