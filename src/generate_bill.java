
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
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
import javax.servlet.http.Part;

@WebServlet(urlPatterns = {"/generate_bill"})
public class generate_bill extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String mid=request.getParameter("mid");
        HttpSession session=request.getSession();
        String ID = (String) session.getAttribute("ID");
        String OID =(String) session.getAttribute("OID");
        String address =(String) session.getAttribute("address");
        String shop_no =(String) session.getAttribute("shop_no");
        String bid=session.getAttribute("bid").toString();
        
        // database connection settings
       
        Connection con=null;
        String message = null; 
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
            String sql = "INSERT INTO DETAIL values("+bid+","+shop_no+",'"+mid+"',1,1)";
            PreparedStatement statement = con.prepareStatement(sql);
            int row = statement.executeUpdate();
            

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
            session.setAttribute("ID", ID);
            session.setAttribute("shop_no", shop_no);
            session.setAttribute("address", address);
            // forwards to the message page
            getServletContext().getRequestDispatcher("/bill_withP.jsp?oid="+OID).forward(request, response);
        
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
