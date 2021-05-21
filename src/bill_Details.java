
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

@WebServlet(urlPatterns = {"/bill_Details"})
public class bill_Details extends HttpServlet {

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
        
//Date date1=new SimpleDateFormat("yyyy-mm-dd").parse(date);
        HttpSession session=request.getSession();
        String ID = (String) session.getAttribute("ID");
        String shop_no =""; 
        String address ="";
        String OID=session.getAttribute("OID").toString();
        session.setAttribute("ID",ID);
        String type=session.getAttribute("type").toString();
        String bid=session.getAttribute("bid").toString();
        if(type.equals("WITHOUT PRESCRIPTION")){
            shop_no = session.getAttribute("shop_no").toString();
            address = session.getAttribute("address").toString();
        }
        
          
        
        // database connection settings
        
        Connection con=null;
        String message = null; 
        try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
            
            int amt=0;
            if(type.equals("WITHOUT PRESCRIPTION"))
            {    
                String sql = "UPDATE DETAIL SET QTY=? WHERE MED_ID=? AND SHOP_NO="+shop_no+" AND BILL_NO="+bid;
            String sql2 = "SELECT MED_ID FROM DETAIL WHERE BILL_NO="+bid;
            PreparedStatement statement2 = con.prepareStatement(sql2);
            ResultSet r=statement2.executeQuery();
            while(r.next()){
                String mid=r.getString(1);
                String qty=request.getParameter(mid);
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setString(2, mid);
                statement.setString(1,qty);
                int row = statement.executeUpdate();
                String s="UPDATE DETAIL SET PRICE=PRICE*QTY WHERE BILL_NO="+bid+" AND MED_ID='"+mid+"' AND SHOP_NO="+shop_no;
            
                PreparedStatement stat = con.prepareStatement(s);
                stat.executeUpdate();
            
            }
        }
            String sql2 = "SELECT PRICE FROM DETAIL WHERE BILL_NO="+bid;
            PreparedStatement statement2 = con.prepareStatement(sql2);
            ResultSet r=statement2.executeQuery();
            while(r.next()){
                amt=amt+Integer.parseInt(r.getString(1));
            }
            String sql3 = "INSERT INTO MED_BILL VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement statement3 = con.prepareStatement(sql3);
            statement3.setString(1, bid);
            statement3.setString(2, shop_no);
            statement3.setString(3, OID);
            statement3.setString(7, "UNPAID");
            statement3.setString(5, address);
            statement3.setInt(6, amt);
            statement3.setString(8,session.getAttribute("pname").toString());
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime now = LocalDateTime.now();
            statement3.setString(4, dtf.format(now));
            int row = statement3.executeUpdate();
            
            Statement stat4 = con.createStatement();
            String q = "UPDATE MED_ORDER SET STATUS='UNPAID' WHERE ORDER_ID=" + OID;
            int o=stat4.executeUpdate(q);
            if(o>0){
                out.println("<body>");
                out.println("<script language=\"javascript\">");
                out.println("alert(\"Bill generated successfully\");");
                out.println("window.location.replace(\"pharMain.jsp\")");
                out.println("</script>");
            
            }
        }
        catch (Exception ex) {
            out.print(ex);
        }
 
        finally {
            if (con != null) {
                try {
                    con.close();
                }
                catch (SQLException ex) {
                    out.print(ex);
                }
            }
          //  request.setAttribute("message", message);
            session.setAttribute("ID", ID);
            session.setAttribute("shop_no", shop_no);
            // forwards to the message page
            //getServletContext().getRequestDispatcher("/123.jsp").forward(request, response);
        
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
