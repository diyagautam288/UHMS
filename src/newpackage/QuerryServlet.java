package newpackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import newpackage.User;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 *
 * @author Shaiv
 */
import javax.servlet.http.HttpSession;
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class QuerryServlet extends HttpServlet {
     
    // database connection settings
    
    
    @Override 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("logUser");
        int pid = user.getPid();
        String querry = request.getParameter("querry");
         
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
			int row=0;
            // constructs SQL statement
            String sql = "INSERT INTO question (pid, querry, image) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, pid);
            statement.setString(2, querry);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(3, inputStream);
                row = statement.executeUpdate();
            }
            if(filePart==null){
                String sql1 = "INSERT INTO question (pid, querry) values (?, ?)"; 
                PreparedStatement statement1 = conn.prepareStatement(sql1);
             
                statement1.setInt(1, pid);
                statement1.setString(2, querry);
                row = statement1.executeUpdate();
            }
 
            // sends the statement to the database server
            
            if (row > 0) {
                message = "submitted successfully";
            }
        } catch (SQLException | ClassNotFoundException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);
        }
    }
}
