<%-- 
    Document   : Select_NoImages
    Created on : Feb 22, 2015, 10:51:10 AM
    Author     : Tasha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



<%@page import="java.sql.*"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.Connection"%>

<%@page import="java.sql.DriverManager"%>

<%@page import="java.io.IOException"%>


<%@page import="java.io.PrintWriter"%>

<%@page import="java.sql.Connection"%>

<%@page import="java.sql.ResultSet"%>


<%@page import="java.sql.Statement"%>


<%@page import="java.util.logging.Level"%>


<%@page import="javax.servlet.ServletException"%>

<%@page import="javax.servlet.http.HttpServlet"%>

<%@page import="javax.servlet.http.HttpServletRequest"%>

<%@page import="javax.servlet.http.HttpServletResponse"%>

<%@page import="org.jboss.logging.Logger"%>
<%@page import="java.io.InputStream"%>

<%@page import="java.sql.ResultSet"%>



        <%
          
            
            
            try
{
Class.forName("com.mysql.jdbc.Driver");


Connection con=null;
try
{
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/image", "tasha", "tashaPassword");



                             try {

 
              
                             
                                
                                
Statement s = con.createStatement();
ResultSet r = s.executeQuery("select ID, LNAME_DB from image.Trashawn");



while (r.next()){


out.println(r.getString("ID"));
out.println(r.getString("LNAME_DB"));




}
                            
                            
        
        
    }


        catch (Exception e)
                {
                    out.println("Internal Code Message");
                }



 


}

            catch (Exception e)
            {
                out.println("Connection String Problem");
            }


}


catch(Exception e)
{
out.println("Error While Loading Driver");
}
            
            
            
            %>


    </body>
</html>
