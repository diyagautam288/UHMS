
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/bill_pay"})
public class bill_pay extends HttpServlet {

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
            String ID = session.getAttribute("ID").toString();
            ID = ID.trim();
            session.setAttribute("ID", ID);
            String bid = session.getAttribute("bid").toString();
            bid = bid.trim();
            Connection con = null;
            try {
                String q1 = "SELECT ORDER_ID FROM MED_BILL WHERE BILL_NO=" + bid;
                Class.forName("oracle.jdbc.driver.OracleDriver");
    			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");

                PreparedStatement statement = con.prepareStatement(q1);
                ResultSet r = statement.executeQuery(q1);
                r.next();
                String oid = r.getString(1);
                q1 = "UPDATE MED_ORDER SET STATUS='PAID' WHERE ORDER_ID=" + oid;
                statement = con.prepareStatement(q1);
                statement.executeUpdate(q1);
                q1 = "UPDATE MED_BILL SET STATUS='PAID' WHERE BILL_NO=" + bid;
                statement = con.prepareStatement(q1);
                statement.executeUpdate(q1);
                out.println("<script language=\"javascript\">");
                out.println("alert(\"Payment successfull\");");
                out.println("window.location.replace(\"patient_Main.jsp\")");
                out.println("</script>");

            } catch (Exception e) {
                out.print(e);
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
