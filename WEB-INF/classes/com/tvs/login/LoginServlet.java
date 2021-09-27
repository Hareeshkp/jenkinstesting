package com.tvs.login;

import java.io.IOException;  
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {  
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException

{  
    response.setContentType("text/html");  
    PrintWriter out =response.getWriter();
    String n=request.getParameter("username");  
    String p=request.getParameter("password");  
    String s="active";
    
	 HttpSession sessioon = request.getSession(false);
	
	 
	 if( sessioon!=null && sessioon.getAttribute("username")!=null)
	 {			
			  HttpSession session = request.getSession();
			  session.setAttribute("result","!You are already logged in. Please logout");
			  RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			  rd.include(request,response);
		//response.sendRedirect("ui");
	 }

	 else
	 {
		 
    if( StatusDAO.status(n,s) && LoginDAO.validate(n,p)){  

    	 java.sql.Timestamp dbSqlDate=null;
    	 HttpSession session = request.getSession();
         session.setAttribute("userid",n);
         Userlogin u=UserloginDAO.getUserloginbyuserid(n);
         dbSqlDate=u.getPassmodifieddate();
         java.util.Date    passwordmodifieddate = new java.util.Date(dbSqlDate.getTime());
         String email=u.getEmail();
         String username=u.getUsername();
        
        // System.out.println("password changed date:-  "+ passwordmodifieddate);
      
        Calendar cal = Calendar.getInstance();
        cal.setTime(passwordmodifieddate);
        cal.add(Calendar.DATE,30);
        Date passwordexpirydate=cal.getTime();
      //  System.out.println("password expiry  date:-  "+passwordexpirydate);
        //------------------------------------------------------------------
        Calendar cals = Calendar.getInstance();
        cals.setTime(passwordmodifieddate);
        cals.add(Calendar.DATE,27);
       Date passwordwarningdate=cals.getTime();
      //System.out.println("password warning  date:-  "+passwordwarningdate);
        //---------------------------------------------------------
        Calendar call = Calendar.getInstance();
        Date todaydate = call.getTime();
     //   System.out.println("this is today date:-   "+todaydate);
 
       
      long  daysBetween = ChronoUnit.DAYS.between(todaydate.toInstant(), passwordexpirydate.toInstant());

      SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
      String strDate= formatter.format(passwordexpirydate);  
    
        if(todaydate.after(passwordexpirydate))//if todaydate>passwordexpirydate
        {
        	//password screen redirection or don't allows to login
        	// RequestDispatcher rd=request.getRequestDispatcher("secure");  
           //  rd.forward(request,response);  
         	response.sendRedirect("secure");
        }
       else if(todaydate.after(passwordwarningdate))
        	
        {      
    	   String uri = request.getScheme() + "://" +   
                   request.getServerName() +       
                   ":" + request.getServerPort() + 
                   request.getRequestURI() ;    
    	   
    	   // send mail welcome page redirection
            Mailer.send(email,"Reset Your Password","Hi " +username+",\n Your MDM login ID ( " +n+ " ) password expires in " +daysBetween+ "days dated on "+strDate+"\n Request you to Change your password.\tClick the link below to reset your password \n" +uri);  

        	 //RequestDispatcher rd=request.getRequestDispatcher("ui");  
            // rd.forward(request,response);  
        	response.sendRedirect("ui");
        }
        else
        	
        {        	//welcome page redirection
           // Mailer.send(email,"Change Password!!!","Hi " +username+",\n Your password will expire on "+passwordexpirydate+",Please Change your password!!");  

        	int ds=LoginDAO.useraudit(n);
        	// RequestDispatcher rd=request.getRequestDispatcher("ui");  
            // rd.forward(request,response);  
        	response.sendRedirect("ui");
        	
        }
    	
    	    }  
    
    else if(LoginDAO.validate(n,p))//userid 
    {
    	  HttpSession session = request.getSession();
     	  session.setAttribute("result","your account is inactive!");
     	  RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
          rd.include(request,response);  
    }
    
    else{  
    	HttpSession session = request.getSession();
    	session.setAttribute("result","Invalid credentials!");
        RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
        rd.include(request,response); 
    }  
          
    }  
}
}
