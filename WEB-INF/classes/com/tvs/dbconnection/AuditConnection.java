package com.tvs.dbconnection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AuditConnection {
   
	
	 public static Connection getConnection() {
		 
		    Connection con=null;
		    Context initContext=null;
			Context envContext=null;
			DataSource ds=null;

			try {
				initContext = new InitialContext();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				envContext = (Context)initContext.lookup("java:/comp/env");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				ds = (DataSource)envContext.lookup("MDM/Config");
			} catch (NamingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				con = ds.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
		 return con;
	 }
	
	 
	 public static void shutdown(ResultSet rs,PreparedStatement ps,Connection con) 
	 {
		 try
		 {

		if(rs!=null)
			rs.close();
		if(ps!=null)
			ps.close();
		if(con!=null)
			con.close();
		 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
		 
	 }
	 
	 public static void shutdown(PreparedStatement ps,Connection con) 
	 {
		 try
		 {
		if(ps!=null)
			ps.close();
		if(con!=null)
			con.close();
		 
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 
		 
	 }
	
	
}