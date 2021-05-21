/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/order_status"})
public class order_status extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String status = request.getParameter("status");
            HttpSession session = request.getSession();
            String ID = (String) session.getAttribute("ID");
            String shop_no = session.getAttribute("shop_no").toString();
            String oid = session.getAttribute("oid").toString();
            session.setAttribute("ID", ID);
            session.setAttribute("shop_no", shop_no);

            // database connection settings
            
            Connection con = null;
            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
    			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                String sql = "UPDATE MED_ORDER SET STATUS='" + status + "' WHERE ORDER_ID=" + oid;
                PreparedStatement statement = con.prepareStatement(sql);
                int row = statement.executeUpdate();
                if (row > 0) {
                    out.println("<script language=\"javascript\">");
                    out.println("alert(\"ORDER STATUS CHANGED\");");
                    out.println("window.location.replace(\"pharMain.jsp\")");
                    out.println("</script>");
                }
                else {
                    out.println("<script language=\"javascript\">");
                    out.println("alert(\"ORDER STATUS CAN'T BE CHANGED\");");
                    out.println("window.location.replace(\"pharMain.jsp\")");
                    out.println("</script>");
                }
            } catch (Exception ex) {
                out.print(ex);
            } finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException ex) {
                        out.print(ex);
                    }
                }

            }

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
