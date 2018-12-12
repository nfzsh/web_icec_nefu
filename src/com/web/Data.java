package com.web;
import java.sql.*;

public class Data {

	String str = "com.mysql.cj.jdbc.Driver";
	  String user = "root";
	  String pass = "root";
	  String url = "jdbc:mysql://localhost:3306/web?serverTimezone=UTC&useSSL=false";
	  //String url = "jdbc:mysql://zsh199803.b1.luyouxia.net:40286/web?serverTimezone=UTC&useSSL=false";
	  Connection conn = null;
	  Statement stmt = null;
	  ResultSet rs = null;
	  
	  public Data()
	  {
		  try
		    {
		      Class.forName(this.str);
		      this.conn = DriverManager.getConnection(this.url, this.user, this.pass);
		      if (this.conn != null) {
		        System.out.println("连接数据库成功！");
		      }
		      this.stmt = this.conn.createStatement();
		    }
		    catch (Exception e)
		    {
		      System.out.println(e);
		    }
	  }
	  
	  public int exeU(String sql)
	  {
	    int n = 0;
	    try
	    {
	      n = this.stmt.executeUpdate(sql);
	    }
	    catch (Exception e)
	    {
	      System.out.println(e);
	    }
	    return n;
	  }
	  
	  public ResultSet exeQ(String sql)
	  {
	    try
	    {
	      this.rs = this.stmt.executeQuery(sql);
	      System.out.println("数据返回");
	    }
	    catch (Exception e)
	    {
	      System.out.println(e);
	    }
	    return this.rs;
	  }
	  
	  public void close()
	  {
	    try
	    {
	      if (this.rs != null) {
	        this.rs.close();
	      }
	      this.stmt.close();
	      this.conn.close();
	      System.out.println("链接关闭");
	    }
	    catch (Exception e)
	    {
	      System.out.println(e);
	    }
	  }
}
