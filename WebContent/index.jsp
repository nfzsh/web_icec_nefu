<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.web.Data"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-cn">
  <head>
    <!-- Required meta tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/global.css">

    <title>软件工程</title>
  </head>
  <body>
<div class="home_top d-none d-sm-block">
<div class="container">
<div class="row float-right mr-3">
<a href="Login.html" role="button">LOGIN</a>
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
<li class="nav-item active"><a class="nav-link" href="index.jsp">首页</a></li>
<li class="nav-item"><a class="nav-link" href="introduce.html">专业介绍</a></li>
<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="laboratory.html" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">实验室</a>
<div class="dropdown-menu" aria-labelledby="navbarDropdown">
<a class="dropdown-item" href="dsj.html"><i class="fa fa-chevron-right"></i> 大数据</a>
<a class="dropdown-item" href="wlw.html"><i class="fa fa-chevron-right"></i> 物联网</a>
<a class="dropdown-item" href="qrs.html"><i class="fa fa-chevron-right"></i> 嵌入式</a>
<a class="dropdown-item" href="ios.html"><i class="fa fa-chevron-right"></i> iOS</a>
<a class="dropdown-item" href="and.html"><i class="fa fa-chevron-right"></i> Android</a>
</div>
</li>
<li class="nav-item"><a class="nav-link" href="teachers.html">教师团队</a></li>
<li class="nav-item"><a class="nav-link" href="workguide.html">就业指南</a></li>
</ul>
</div>
</nav>
</div>
</div>
<!-- hoem_nav end! --> 

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
   <div class="carousel-inner">
      <div class="carousel-item active"> <img class="first-slide" width="100%" src="media/autumn.jpg" alt="First slide">
        <div class="container">
          <div class="carousel-caption text-left">
            <h1>One</h1>
            <p>2016年金秋九月，迈进东北林业大学的校门，开始学习软件工程。</p>
     
          </div>
        </div>
      </div>
      <div class="carousel-item"> <img class="second-slide" width="100%" src="media/winter.jpg" alt="Second slide">
        <div class="container">
          <div class="carousel-caption">
            <h1>Two</h1>
            <p style="color:#A3A3A3;">经历四个寒冬，不断提升自我，努力code，修改bug。</p>
            
          </div>
        </div>
      </div>
      <div class="carousel-item"> <img class="third-slide" width="100%" src="media/summer.jpg" alt="Third slide">
        <div class="container">
          <div class="carousel-caption text-right">
            <h1>Three</h1>
            <p>2020年盛夏6月，学有所成，各奔前程，天南海北，勿忘东林。</p>
      
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a> </div>
  <!-- 轮播图 --> 
  <%
  int id=1;//判定当前传递的id
  Data data = new Data();
  ResultSet rs;
  String sql = "select * from web.news where type = '新闻';";
  rs = data.exeQ(sql);
  rs.last();//移到最后一行
  int count = rs.getRow();
  %>
  <div class="row mb-2">
  <div class="col-md-6">
  <div class="card flex-md-row mb-4 box-shadow h-md-250">
<table class="table">
  <thead>
    <tr>
      <th scope="col" align="center">新闻</th>
    </tr>
  </thead>
  <tbody>
<%
for(int i=0;i<5;i++)
{
	//id=rs.getInt(1);
	out.println("<tr><td><a class='a' href='shownews.jsp?id="+rs.getString(1)+"'>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td></tr>");
	if(!rs.previous())
	break;
}
%>
<td align="center"><button type="button" onclick="window.location.href='news.jsp'" class="btn btn-link">查看更多</button></td>
  </tbody>
</table>
</div>
</div>
<%
String sql1 = "select * from web.news where type = '公告';";
rs = data.exeQ(sql1);
rs.last();//移到最后一行
count = rs.getRow();
%>
<div class="col-md-6">
<div class="card flex-md-row mb-4 box-shadow h-md-250">
<table class="table">
  <thead>
    <tr>
      <th scope="col" align="center">公告</th>
    </tr>
  </thead>
  <tbody>
  <%
for(int i=0;i<5;i++)
{
	//id=rs.getInt(1);
	out.println("<tr><td><a class='a' href='shownews.jsp?id="+rs.getString(1)+"'>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td></tr>");
	if(!rs.previous())
	break;
}
  data.close();
%>
<td align="center"><button type="button" onclick="window.location.href='note.jsp'" class="btn btn-link">查看更多</button></td>
  </tbody>
</table>
  </tbody>
  </table>
  </div>
  </div>
</div>

<footer>
<div class="container">
<div class="row">
<div class="col-lg-3 col-md-3 col-sm-3 col-12">
<header class="d-block font-weight-normal"><strong>联系</strong>我们</header>
<address class="d-inline-flex"><span>黑龙江省哈尔滨市香坊区和兴路26号东北林业大学，成栋楼9,10#</span></address>
<address class="d-inline-flex">xxx@edu.nefu.cn</span></address>
</div>
</div>

<div class="fooer_copy">
<ul>
<li><a href="#">首页</a></li>
Copyright &copy; 2018 123</li>
</ul>
</div>
</div>
</footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
  <script>
 //滚动检测
 $(window).scroll(function(){
	if($(window).scrollTop()>0){
		$(".home_nav").addClass("active");
        $(".home_nav").css({
            "position":"fixed",
            "top":0,
            "z-index":999
        
        });
        $(".home_top").css("display","none");
	}
	else{
		$(".home_nav").removeClass("active");
        $(".home_top").css("display","block");
        $(".home_nav").css("position","relative");
	}
   });
</script>
  </body>
</html>