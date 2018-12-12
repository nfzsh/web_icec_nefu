<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.web.Data" import="java.sql.*"
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
</head>

<body>
<div align="center">
<%
int pagesize=5;//定义每页现实的条数
int p=1;//定义当前页数
int totalpage=1;//定义总共页数
int totalrecord=1;//定义所有条数
int id=1;//判定当前传递的id
Data data = new Data();
ResultSet rs;
String sql = "select * from news";
String sql1="select count(*) as number from news";
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
	out.println("<table>");
rs.absolute((p-1)*pagesize+1);
for(int i=0;i<5;i++)
{
	id=rs.getInt(1);
	out.println("<tr><td><li class='list-group-item'>"+rs.getString(3)+"</li></td><td align='right' width=200px><a href='modify2.jsp?id="+rs.getString(1)+"'>修改</td></tr>");
	if(!rs.next())
		break;
}
out.println("</table>");
%>

<hr>
<form action="modify.jsp">
共有<%=totalrecord %>数据第<%=p %>/<%=totalpage %>页   转向第<input type="text" size="1" name=p>
页<input type="submit" class="button" value="跳转"></form>
<hr>
<%
if(p==1){
	%>
 <a href=modify.jsp?p=<%=p+1 %>>下一页</a>   <a href=modify.jsp?p=<%=totalpage%>>尾页</a> 
<%}
else if(p==totalpage){
	%>	
	<a href=modify.jsp>首页</a>   <a href=modify.jsp?p=<%=p-1 %>>上一页</a> 
	
	<%
} else{
	%>
	<a href=modify.jsp>首页</a>   <a href=modify.jsp?p=<%=p-1 %>>上一页</a> 
	<a href=modify.jsp?p=<%=p+1 %>>下一页</a>   <a href=modify.jsp?p=<%=totalpage%>>尾页</a> 
	<%
}
data.close();
%>

</div>
</body>
</html>