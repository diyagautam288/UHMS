/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.*;
import java.io.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/send_report"})
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class send_report extends HttpServlet {

    protected void processRequest (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //int RID=Integer.parseInt(request.getParameter("RID"));
        int PID=Integer.parseInt(request.getParameter("PID"));
        String date=request.getParameter("date");
        int DOC_ID=Integer.parseInt(request.getParameter("DOC_ID"));
        HttpSession session=request.getSession();
        String ID = (String) session.getAttribute("ID");
        int RID = (int) session.getAttribute("RID");
        
        
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("REPORT");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        // database connection settings
        
        Connection con=null;
        String message = null; 
        try {
            // connects to the database
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
            // constructs SQL statement
            String sql = "INSERT INTO TEST_REPORT (REPORT_ID,REPORT,PID,DOC_ID,DOT) values (?, ?, ?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setInt(1, RID);
            
            statement.setInt(3, PID);
            statement.setInt(4, DOC_ID);
            statement.setString(5, date);
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Report sent to patient successfully.";
            }

        }
        catch (Exception ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        }
 
        finally {
            if (con != null) {
                // closes the database connection
                try {
                    con.close();
                }
                catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("Message", message);
            request.setAttribute("ID", ID);
        //    request.setAttribute("shop_no", "123");
            // forwards to the message page
            getServletContext().getRequestDispatcher("/report_success.jsp").forward(request, response);
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
