
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(urlPatterns = {"/bill"})
public class bill extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String ID = session.getAttribute("ID").toString();
            session.setAttribute("ID",ID);
            String shop_no = session.getAttribute("shop_no").toString();
            session.setAttribute("shop_no",shop_no);
            String oid = session.getAttribute("oid").toString();
            String type = session.getAttribute("type").toString();
            String pname = session.getAttribute("pname").toString();
            String address = session.getAttribute("address").toString();
            
                
            String amt = request.getParameter("amt");
            Connection con = null;
            int bno =0;

            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
    			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                
                String s1 = "SELECT MAX(BILL_NO) FROM MED_BILL WHERE SHOP_NO=" + shop_no;
                PreparedStatement statement = con.prepareStatement(s1);
                ResultSet r = statement.executeQuery(s1);
                r.next();
                bno =r.getInt(1);
                if(bno>=10001)
                        bno=bno+1;
                else
                    bno=10001;
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDateTime now = LocalDateTime.now();
                String date = dtf.format(now);
                s1 = "INSERT INTO MED_BILL VALUES(" + bno + "," + shop_no + "," + oid + ",'" + date + "','" + address + "'," + amt + ",'UNPAID','" + pname + "')";
                statement = con.prepareStatement(s1);
                int row = statement.executeUpdate();
                con.close();
                if (row < 1) {
                    out.print("Not updated");
                }
            } catch (Exception e) {
                out.print(e);
            }

            try {
            	Class.forName("oracle.jdbc.driver.OracleDriver");
    			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                Statement stat = con.createStatement();
                ResultSet rs = stat.executeQuery("select without_presc.MED_ID, without_presc.QTY, med_order.ADDRESS from without_presc,med_order where med_order.ORDER_ID=" + oid + " and without_presc.ORDER_ID=" + oid);
                int price = 0, unitp;
                while (rs.next()) {
                    String mid = rs.getString(1);
                    int qty = rs.getInt(2);
                    Statement stat2 = con.createStatement();
                    ResultSet rs2 = stat2.executeQuery("SELECT MED_NAME,UNIT_PRICE FROM INVENTORY WHERE MED_ID='" + mid + "'");
                    rs2.next();
                    unitp = rs2.getInt(2);
                    price = qty * unitp;
                    Statement stat3 = con.createStatement();
                    int rs3 = stat3.executeUpdate("INSERT INTO DETAIL VALUES (" + bno + "," + shop_no + ",'" + mid + "'," + qty + "," + price + ")");
                    if (rs3 < 1) {
                        out.print("Not updated");
                    }
                }

                Statement stat4 = con.createStatement();
                String q = "UPDATE MED_ORDER SET STATUS='UNPAID' WHERE ORDER_ID=" + oid;
                int o=stat4.executeUpdate(q);
                if(o>0){
                    out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>University Healthcare</title>");            
            out.println("</head>");
        
                    out.println("<script language=\"javascript\">");
                out.println("alert(\"Bill generated successfully\");");
                out.println("window.location.replace(\"pharMain.jsp\")");
                out.println("</script>");
            
                }

            }
            catch (Exception e) {
                out.print(e);
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
