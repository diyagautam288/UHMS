
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

/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/delete_medicine"})
public class delete_medicine extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String mid=request.getParameter("mid");
        HttpSession session=request.getSession();
        String ID = (String) session.getAttribute("ID");
        String shop_no = (String) session.getAttribute("shop_no");
        // database connection settings
        
        Connection con=null;
        String message = null; 
        try {
            // connects to the database
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
            mid=mid.trim();
            // constructs SQL statement
            String sql = "DELETE FROM INVENTORY WHERE MED_ID='"+mid+"'";
         
          PreparedStatement statement = con.prepareStatement(sql);
            
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Medicine detail deleted successfully";
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
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet delete_medicine</title>");            
            out.println("</head>");
            out.println("<body>");
           // out.println("<h1>Servlet delete_medicine at " + request.getContextPath() + "</h1>");
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
