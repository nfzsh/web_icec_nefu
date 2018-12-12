<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.web.Data"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/global.css">
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
<div align="center">
<%
int pagesize=5;//定义每页现实的条数
int p=1;//定义当前页数
int totalpage=1;//定义总共页数
int totalrecord=1;//定义所有条数
int id=1;//判定当前传递的id
Data data = new Data();
ResultSet rs;
String sql = "select * from news where type = '新闻'";
String sql1="select count(*) as number from news where type ='新闻'";
rs = data.exeQ(sql1);
rs.next();
totalrecord=rs.getInt(1);
rs = data.exeQ(sql);
if(totalrecord%pagesize==0){
	totalpage=totalrecord/pagesize;//确定总的页数
}else{
	totalpage=totalrecord/pagesize+1;
}
if(request.getParameter("p")==null||request.getParameter("p").equals("")){
	p=1;//判断是否有参数传入 
}
try{
	p=Integer.parseInt(request.getParameter("p"));//获得想要跳转的页面 
}
catch(NumberFormatException e){
	p=1;// 捕获格式化异常 
}
if(p>totalpage)
		p=totalpage;
if(p<1)p=1;
	out.println("<ul class='list-group'>");
rs.absolute((p-1)*pagesize+1);
for(int i=0;i<5;i++)
{
	id=rs.getInt(1);
	out.println("<li class='list-group-item'><a class='a' href='shownews.jsp?id="+rs.getString(1)+"'>"+rs.getString(3)+"</li>");
	if(!rs.next())
		break;
}
out.println("</ul>");
%>

<hr>
<form action="news.jsp">
共有<%=totalrecord %>数据第<%=p %>/<%=totalpage %>页   转向第<input type="text" size="1" name=p>
页<input type="submit" value="跳转"></form>
<hr>
<%
if(p==1){
	%>
 <a href=news.jsp?p=<%=p+1 %>>下一页</a>   <a href=news.jsp?p=<%=totalpage%>>尾页</a> 
<%}
else if(p==totalpage){
	%>	
	<a href=news.jsp>首页</a>   <a href=news.jsp?p=<%=p-1 %>>上一页</a> 
	
	<%
} else{
	%>
	<a href=news.jsp>首页</a>   <a href=news.jsp?p=<%=p-1 %>>上一页</a> 
	<a href=news.jsp?p=<%=p+1 %>>下一页</a>   <a href=news.jsp?p=<%=totalpage%>>尾页</a> 
	<%
}
%>
</div>
</body>
</html>