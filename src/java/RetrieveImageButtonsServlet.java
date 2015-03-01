/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.ResultSet;    
import java.sql.Types.*;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import javax.servlet.ServletException;
import org.jboss.logging.Logger;




 
@WebServlet("/RetrieveImageButtonsServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB


public class RetrieveImageButtonsServlet extends HttpServlet {
     

    private String dbURL = "jdbc:mysql://localhost:3306/image";
    private String dbUser = "tasha";
    private String dbPass = "tashaPassword";
    
        protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
       
      
        InputStream inputStream = null; // input stream of the upload file
        
        
        try
            {
                    Class.forName("com.mysql.jdbc.Driver");
                    {
  
                        try
                        {
                            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/image", "tasha", "tashaPassword");

                                
                                                             try {

 
            String sql = "select ProfileImage from image.Trashawn where ID=45";
            PreparedStatement statement = c.prepareStatement(sql);

 
            ResultSet result = statement.executeQuery();
            
            
                            int i = 1;
    while(result.next()) {
        Blob len1 = result.getBlob("ProfileImage");
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
    System.out.println(ex);
} finally {
                                                             
    c.close();
    getServletContext().getRequestDispatcher("/MessageButtons.jsp").forward(request, response);
           }
                        }
                        catch (Exception e)
                        {
                            System.out.println("Connection String Error");
                        }
                    }
                    }
                    catch (Exception e)
                            {
                            System.out.println("Driver Error");
                            }
                            
           
        
        
        
    }

}
/**
 *
 * @author Tasha
 */

