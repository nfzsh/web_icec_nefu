package com.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import com.web.Data;
import com.web.user;
//import Test;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public loginservlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.getRequestDispatcher("Login.html").forward(request, response);
		response.setContentType("text/html;utf-8");
	    response.setCharacterEncoding("utf-8");
	    request.setCharacterEncoding("utf-8");
	  //使用request对象的getSession()获取session，如果session不存在则创建一个
	    PrintWriter out = response.getWriter();
	    String name = request.getParameter("user");
	    String ps = request.getParameter("ps");
	    String sql = "select * from user";
	    int flag = 0;
	    Data data = new Data();
	    //Test test = new Test();
	    System.out.println("数据库");
	    
	    ResultSet rs = data.exeQ(sql);
	    System.out.println(rs);
	    
	    user u1 = new user();
	    u1.setU(name);
	    u1.setPs(ps);
	    HttpSession session = request.getSession();
	    //将数据存储到session中
	    session.setAttribute("name", name);
	    try
	    {
	      while (rs.next()) {
	    	  System.out.println("循环");
	        if (name.equals(rs.getString(2)))
	        {
	          if (ps.equals(rs.getString(1)))
	          {
	            HttpSession s1 = request.getSession();
	            s1.setAttribute("user", u1);
	            System.out.println("登陆成功");
	            response.sendRedirect("/WebExamples/Add.html");
	          }
	          else
	          {
	            out.print("<script>alert('用户名或密码错误!');window.location.href='Login.html'</script>");
	            System.out.println("错误");
	          }
	          flag = 1;
	          break;
	        }
	      }
	    }
	    catch (Exception e)
	    {
	      System.out.println(e);
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
