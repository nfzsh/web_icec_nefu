<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.web.Data" import="java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/global.css">
<style type="text/css">
div.t1 {padding: 1.5cm}
div.title {text-align:center}
div.date {text-align:right}
</style>
<title>文章详情</title>
</head>
<body>
<div class="home_top d-none d-sm-block">
<div class="container">
<div class="row float-right mr-3">
<a href="index.jsp" role="button">LOGIN</a>
</div>
</div>
</div>
<!-- home_top end! -->
<div class="home_nav" id="home_nav">
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light">
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<a class="navbar-brand" href="index.jsp"><img src="media/logo.png" alt="软件工程"></a>
<div class="collapse navbar-collapse"  id="navbarTogglerDemo03">
<ul class="navbar-nav mr-auto home_top_nav">
<li class="nav-item"><a class="nav-link" href="index.jsp">首页</a></li>
<li class="nav-item"><a class="nav-link" href="#">专业介绍</a></li>
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">实验室</a>
<div class="dropdown-menu" aria-labelledby="navbarDropdown">
<a class="dropdown-item" href="#"><i class="fa fa-chevron-right"></i> 大数据</a>
<a class="dropdown-item" href="#"><i class="fa fa-chevron-right"></i> 物联网</a>
<a class="dropdown-item" href="#"><i class="fa fa-chevron-right"></i> 嵌入式</a>
<a class="dropdown-item" href="#"><i class="fa fa-chevron-right"></i> iOS</a>
<a class="dropdown-item" href="#"><i class="fa fa-chevron-right"></i> Android</a>
</div>
</li>
<li class="nav-item"><a class="nav-link" href="#">教师团队</a></li>
<li class="nav-item"><a class="nav-link" href="#">就业指南</a></li>
</ul>
</div>
</nav>
</div>
</div>
<!-- hoem_nav end! --> 
<div class="t1">
<%
Data data = new Data();
String id = request.getParameter("id");
String sql = "select * from news where id="+id;
ResultSet rs;
rs = data.exeQ(sql);
rs.next();
%>
<div class="title"><%out.println(rs.getString(3));%></div>
<div class="content"><%out.println(rs.getString(4));%></div>
<div class="date"><%out.println(rs.getString(5));%></div>
<%data.close(); %>
</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>