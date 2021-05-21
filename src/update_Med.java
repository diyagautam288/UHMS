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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/update_Med"})
public class update_Med extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mid=request.getParameter("mid");
        int qty=Integer.parseInt(request.getParameter("qty"));
        String date=request.getParameter("date");
        int price=Integer.parseInt(request.getParameter("price"));
        String shop_no=request.getParameter("shop_no");
        //Date date1=new SimpleDateFormat("yyyy-mm-dd").parse(date);
        HttpSession session=request.getSession();
        String ID = (String) session.getAttribute("ID");
        
        // database connection settings
        
        Connection con=null;
        String message = null; 
        try {
            // connects to the database
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
            mid=mid.trim();
            // constructs SQL statement
            String sql = "UPDATE INVENTORY SET EXPIRY_DATE='"+date+"',UNIT_PRICE="+price+", QUANTITY="+qty+" WHERE MED_ID='"+mid+"'";
         //  String sql = "UPDATE INVENTORY SET EXPIRY_DATE=?,UNIT_PRICE=?, QUANTITY=? WHERE MED_ID=?";
        
          PreparedStatement statement = con.prepareStatement(sql);
         // statement.setString(1, date);
         //   statement.setInt(2,price);
         //   statement.setInt(3, qty);
         //   statement.setString(4, mid);
            
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Medicine detail updated successfully";
            }
            else{
                message="No changes were made";
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
            request.setAttribute("shop_no", shop_no);
            // forwards to the message page
            getServletContext().getRequestDispatcher("/update_success.jsp").forward(request, response);
        
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
