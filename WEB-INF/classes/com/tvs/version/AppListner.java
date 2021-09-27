package com.tvs.version;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * Application Lifecycle Listener implementation class AppListner
 *
 */
@WebListener
public class AppListner implements ServletContextListener {

	
	
    private  Logger logger =Logger.getLogger(AppListner.class);
    
    public AppListner() {
    }

    public void contextDestroyed(ServletContextEvent arg0)  { 
    }

	
    public void contextInitialized(ServletContextEvent ob)  { 
    	ServletContext sc =ob.getServletContext();
    	String logfilelocation=sc.getInitParameter("ab-ab");
    	String fullpath=sc.getRealPath("")+File.separator+logfilelocation;
    	PropertyConfigurator.configure(fullpath);
        
    }
	
}
