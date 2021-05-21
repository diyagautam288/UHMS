/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import newpackage.order_Details;
/**
 *
 * @author user
 */
public class order_Details extends HttpServlet {

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
            
            HttpSession session = request.getSession();
            String ID = (String) session.getAttribute("ID");
            String shop_no = "";
            String address = "";
            String OID = session.getAttribute("OID").toString();
            session.setAttribute("ID", ID);
            String type = session.getAttribute("type").toString();
            if (type.equals("WITHOUT PRESCRIPTION")) {
                shop_no = session.getAttribute("shop_no").toString();
                address = session.getAttribute("address").toString();
            } else {
                shop_no = request.getParameter("shop_no").toString();
                address = request.getParameter("address").toString();

            }

            // database connection settings
           
            Connection con = null;
            String message = null;
            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
    			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","xe","xe");

                
                if (type.equals("WITHOUT PRESCRIPTION")) {
                    String sql = "UPDATE WITHOUT_PRESC SET QTY=? WHERE MED_ID=? AND ORDER_ID=" + OID;
                    String sql2 = "SELECT MED_ID FROM WITHOUT_PRESC WHERE ORDER_ID=" + OID;
                    PreparedStatement statement2 = con.prepareStatement(sql2);
                    ResultSet r = statement2.executeQuery();
                    while (r.next()) {
                        String mid = r.getString(1);
                        String qty = request.getParameter(mid);
                        PreparedStatement statement = con.prepareStatement(sql);
                        statement.setString(2, mid);
                        statement.setString(1, qty);
                        int row = statement.executeUpdate();

                    }
                }
                String sql3 = "INSERT INTO MED_ORDER VALUES (?,?,?,?,?,?,?)";
                PreparedStatement statement3 = con.prepareStatement(sql3);
                statement3.setString(1, OID);
                statement3.setString(2, shop_no);
                statement3.setString(3, type);
                statement3.setString(4, ID);
                statement3.setString(5, address);
                statement3.setString(6, "UNSEEN");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDateTime now = LocalDateTime.now();
                statement3.setString(7, dtf.format(now));
                int row = statement3.executeUpdate();
                if (row > 0) {
                    out.println("<body>");
                    out.println("<script language=\"javascript\">");
                    out.println("alert(\"Medicine ordered successfully\");");
                    out.println("window.location.replace(\"welcome.jsp\")");
                    out.println("</script>");

                }
                else
                    out.print("1");
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
                //  request.setAttribute("message", message);
                session.setAttribute("ID", ID);
                //  request.setAttribute("shop_no", shop_no);
                // forwards to the message page
                //getServletContext().getRequestDispatcher("/123.jsp").forward(request, response);

            }

            
            //out.println("<h1>Servlet order_Details at " + request.getContextPath() + "</h1>");
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
