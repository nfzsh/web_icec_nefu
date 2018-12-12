package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import com.web.Data;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class addservlet
 */
@WebServlet("/addservlet")
public class addservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		request.setCharacterEncoding("utf-8");
		Data data = new Data();
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        //System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
		String sql = "";
		if(title=="")
		{
			out.print("<script>alert('请输入标题!');window.location.href='Add.html'</script>");
		}
		if(content=="")
		{
			out.print("<script>alert('请输入内容!');window.location.href='Add.html'</script>");
		}
		sql="INSERT INTO `web`.`news` (`type`, `title`, `content`,`date`) VALUES ('"+type+"', '"+title+"', '"+content+"', '"+df.format(new Date())+"');";
		data.exeU(sql);
		System.out.println(sql);
		data.close();
		out.print("<script>alert('添加成功!');window.location.href='Add.html'</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
