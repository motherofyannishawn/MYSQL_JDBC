<%-- 
    Document   : RetrieveMultipleImages
    Created on : Feb 24, 2015, 8:24:44 AM
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

                
        <%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
        
        
<%@page import="java.sql.Types.* "%>


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

                
                        <%
            
            //Retrieve a Single Image
            try
            {
                    Class.forName("com.mysql.jdbc.Driver");
                    {
  //added allow multiple queries to connection string.
                        try
                        {
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/image?allowMultiQueries=true", "tasha", "tashaPassword");

                                
                                                             try {
//leave SQL string as is
 
            String sql = "select ProfileImage from image.Trashawn where id is null and profileimage is not null;" 
                    + "select ProfileImage from image.Trashawn where id=45";
            
            
           

            PreparedStatement statement = c.prepareStatement(sql);

 
            ResultSet result = statement.executeQuery();
            
            
           
           // boolean resultSet = statement.execute();
           // boolean moreResults = statement.getMoreResults();
           // System.out.println("moreResults=" + moreResults + " " + resultSet);
            
                        
            //work on this block of code. Indexing problems.   
                            int i = 1;
    while(result.next()) {
        Blob len1 = result.getBlob("profileimage");
        //Blob len2 = result2.getBlob("profileimage");
        
                int len = (int)len1.length();
        
        byte[] b = new byte[len];
        
        InputStream readImg = result.getBinaryStream(1);

                
        int index = readImg.read(b, 0, len);

                
        System.out.println("index" +index);

                
                
        statement.close();
        response.reset();
        response.setContentType("image/jpg");
   
        response.getOutputStream().write(b,0,len);

        response.getOutputStream().flush();
    }
}
                                
                                
                                     
                             catch(Exception ex) {
    out.println(ex);
} finally {

    c.close();
}
                        }
                        catch (Exception e)
                        {
                            out.println("Connection String Error");
                        }
                    }
                    }
                    catch (Exception e)
                            {
                            out.println("Driver Error");
                            }
                            
            %>
            
    </body>
</html>
