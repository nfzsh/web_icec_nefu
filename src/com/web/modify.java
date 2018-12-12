package com.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.Data;

/**
 * Servlet implementation class modify
 */
@WebServlet("/modify")
public class modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		request.setCharacterEncoding("utf-8");
		Data data = new Data();
		PrintWriter out = response.getWriter();
		String id = request.getParameter("num");
		String type = request.getParameter("type");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String sql = "";
		if(type=="")
		{
			out.print("<script>alert('请输入类型!');window.location.href='modify.jsp'</script>");
		}
		if(title=="")
		{
			out.print("<script>alert('请输入标题!');window.location.href='modify.jsp'</script>");
		}
		if(content=="")
		{
			out.print("<script>alert('请输入新闻内容!');window.location.href='modify.jsp'</script>");
		}
		
		sql="UPDATE `web`.`news` SET `type`='"+type+"', `title`='"+title+"', `content`='"+content+"' WHERE `id`='"+id+"';";
		
		data.exeU(sql);
		data.close();
		out.print("<script>alert('修改成功!');window.location.href='modify.jsp'</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
