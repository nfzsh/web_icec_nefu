<%@page import="java.sql.*"%>
<%@page import="java.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.web.Data"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/global.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
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
<li class="nav-item"><a class="nav-link" data-id="index" href="index.jsp">首页</a></li>
<li class="nav-item"><a class="nav-link" href="Add.html">添加</a></li>
<li class="nav-item"><a class="nav-link" href="delete.jsp">删除/查看</a></li>
<li class="nav-item active"><a class="nav-link" href="modify.jsp">修改</a></li>
</ul>
</div>
</nav>
</div>
</div>
<!-- hoem_nav end! --> 
<div align="center">
<%
	Data data = new Data();
	ResultSet rs;
	String id = request.getParameter("id");
	String sql = "select * from news where id="+id;
	String type[] = new String[6]; 
	int i,flag=0,local=0;
	rs = data.exeQ(sql);
	rs.next();
	
%>
<form action="modify" method="post">
<table>
<tr height=80px><td align="left">编号：</td><td align="left"><input class="read" readonly="readonly" name="num" value=<%=rs.getString(1) %>></td></tr>
<tr height=80px><td align="left">请选择类型：（新闻或公告）</td>
<td align="left"><input type="text" name="type" size=5 value=<%=rs.getString(2) %>></td></tr>
<tr height=60px><td align="left">请输入标题:</td>
<td align="left"><input type="text" name="title" size=80 value=<%=rs.getString(3) %>></td></tr>
<tr height=60px><td align="left">请输入内容:</td>
<td align="left"><textarea name="content" ><%=rs.getString(4)%></textarea></td></tr>
<tr><td colspan=2 align="center"><input class="btn btn-warning" type="submit" value="提交"></td></tr>
</table>
</form>
<%data.close(); %>
</div>
</body>
</html>