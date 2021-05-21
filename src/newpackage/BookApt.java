/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shaiv
 */

public class BookApt extends HttpServlet {

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
            out.println("<title>Servlet BookApt</title>");            
            out.println("</head>");
            out.println("<body>");

            int did=Integer.parseInt(request.getParameter("did"));
            int fees=Integer.parseInt(request.getParameter("fees"));
            int pid=Integer.parseInt(request.getParameter("pid"));
            String apdate=request.getParameter("apdate");
            try{
            	Class.forName("oracle.jdbc.driver.OracleDriver");
            	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                Statement st=con.createStatement();
   
                int rs=st.executeUpdate("update uhms.scheduler set count_p=(count_p+1) where doc_id="+did+";");
                if(rs<=0){
                out.print("Cannot book appointment ....Try again latter!!");
                }
                con.close();
        }catch(ClassNotFoundException | SQLException ex){}
        try{
        	Class.forName("oracle.jdbc.driver.OracleDriver");
        	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
          
                Statement st=con.createStatement();
   
                int rs=st.executeUpdate("insert into uhms.appointment (pid,doc_id,fees,apt_date) values ("+pid+","+did+","+fees+",'"+apdate+"')");
                if(rs>0){
                    
                response.sendRedirect("bookApt.jsp");
                }
                else{
                out.print("Cannot book appointment ....Try again latter!!");
                }
                con.close();
        }catch(ClassNotFoundException | SQLException ex){}
            
                
            
                
            
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
