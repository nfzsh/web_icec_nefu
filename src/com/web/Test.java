package com.web;
import java.sql.*;
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
		      Class.forName("com.mysql.jdbc.Driver");     //����MYSQL JDBC��������   
		      //Class.forName("org.gjt.mm.mysql.Driver");
		     System.out.println("Success loading Mysql Driver!");
		    }
		    catch (Exception e) {
		      System.out.print("Error loading Mysql Driver!");
		      e.printStackTrace();
		    }
		    try {
		      Connection connect = DriverManager.getConnection(
		          "jdbc:mysql://localhost:3306/web?serverTimezone=UTC","root","root");
		           //����URLΪ   jdbc:mysql//��������ַ/���ݿ���  �������2�������ֱ��ǵ�½�û���������

		      System.out.println("Success connect Mysql server!");
		      Statement stmt = connect.createStatement();
		      ResultSet rs = stmt.executeQuery("select * from user");
		                                                              //user Ϊ��������
		while (rs.next()) {
		        System.out.println(rs.getString("username"));
		      }
		    }
		    catch (Exception e) {
		      System.out.print("get data error!");
		      e.printStackTrace();
		    }
	}

}
