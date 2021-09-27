package com.tvs.costing;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.*;  
  
public class MyFilter implements Filter{  
  
public void init(FilterConfig arg0) throws ServletException {}  
      
public void doFilter(ServletRequest req, ServletResponse resp,  
    FilterChain chain) throws IOException, ServletException {  
          
    PrintWriter out=resp.getWriter();  
    RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");  
    rd.forward(req,resp);   
    chain.doFilter(req, resp);//sends request to next resource  
          
    }  
    public void destroy() {}  
}  