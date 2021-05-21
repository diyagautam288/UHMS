/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class order_List extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>University Healthcare</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String mid=request.getParameter("mid");
        HttpSession session=request.getSession();
        String ID = (String) session.getAttribute("ID");
        String OID =(String) session.getAttribute("OID");
        String address =(String) session.getAttribute("address");
        String shop_no =(String) session.getAttribute("shop_no");
     
        
        // database connection settings
        
        Connection con=null;
        String message = null; 
        try {
            // connects to the database
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","xe","xe");

            // constructs SQL statement
            String sql = "INSERT INTO WITHOUT_PRESC (ORDER_ID,MED_ID) values ("+OID+",'"+mid+"')";
            PreparedStatement statement = con.prepareStatement(sql);
            
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
               
            }

        }
        catch (Exception ex) {
            out.print(ex);
        }
 
        finally {
            if (con != null) {
                // closes the database connection
                try {
                    con.close();
                }
                catch (SQLException ex) {
                    out.print(ex);
                }
            }
            session.setAttribute("OID", OID);
            session.setAttribute("ID", ID);
         //   request.setAttribute("shop_no", shop_no);
          //  request.setAttribute("message", message);
            // forwards to the message page
            getServletContext().getRequestDispatcher("/med_list.jsp?shop_no="+shop_no+"&address="+address).forward(request, response);
        
        }
            
           // out.println("<h1>Servlet order_List at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
