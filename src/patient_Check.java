/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/patient_Check"})
public class patient_Check extends HttpServlet {

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

        int ID = Integer.parseInt(request.getParameter("username"));
        String password = request.getParameter("pass");
        HttpSession session = request.getSession();

        // database connection settings
        
        Connection con = null;
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>University Healthcare</title>");
            out.println("</head>");
            out.println("<body>");
            

            try {
                // connects to the database
            	Class.forName("oracle.jdbc.driver.OracleDriver");
    			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                // constructs SQL statement
                String sql = "select reg_user.PASSWORD from reg_user,patient where"
                        + " reg_user.EMAIL=patient.EMAIL and patient.PID=?";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setInt(1, ID);
                // sends the statement to the database server
                ResultSet rs = statement.executeQuery();
                if (!rs.next()) {
                    out.println("<script language=\"javascript\">");
                    out.println("alert(\"Incorrect username\");");
                    out.println("window.location.replace(\"patient_login.jsp\")");
                    out.println("</script>");
                }
                else{
                    String pwd=rs.getString(1);
                    if(pwd.equals(password)){
                        session.setAttribute("ID",ID);
                        request.setAttribute("ID",ID);
                        getServletContext().getRequestDispatcher("/patient_Main.jsp").forward(request, response);
        
                    }
                    else{
                        out.println("<script language=\"javascript\">");
                    out.println("alert(\"Incorrect password\");");
                    out.println("window.location.replace(\"patient_login.jsp\")");
                    out.println("</script>");
                
                    }
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                if (con != null) {
                    // closes the database connection
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                
            }
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
