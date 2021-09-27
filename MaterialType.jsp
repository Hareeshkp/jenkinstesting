<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
	<%@page import="java.util.*"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   try{
     String s[]=null;

     Connection con=AuditConnection.getConnection();
     Statement st=con.createStatement();
     ResultSet rs = st.executeQuery("select * from \"Material_Group_Master\"");

       List li = new ArrayList();
       List icode = new ArrayList();

       while(rs.next())
       {
           li.add(rs.getString("Material_Group_Desc_"));
           icode.add(rs.getString("Material_Group"));
       }

       String[] str = new String[li.size()];
       Iterator it = li.iterator();

       int i = 0;
       while(it.hasNext())
       {
           String p = (String)it.next();
           str[i] = p;
           i++;
       }

    //jQuery related start
       String query = (String)request.getParameter("q");

       int cnt=1;
       for(int j=0;j<str.length;j++)
       {
           if(str[j].toUpperCase().startsWith(query.toUpperCase()))
           {
              out.print(str[j]+"\n");
              if(cnt>=5)// 5=How many results have to show while we are typing(auto suggestions)
              break;
              cnt++;
            }
       }
      
    //jQuery related end

rs.close();
st.close();
con.close();

}
catch(Exception e){
e.printStackTrace();
}
%>
</body>
</html>