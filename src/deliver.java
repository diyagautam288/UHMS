
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

@WebServlet(urlPatterns = {"/deliver"})
public class deliver extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>University Healthcare</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session = request.getSession();
            String ID = session.getAttribute("ID").toString();
            session.setAttribute("ID",ID);
            String shop_no = session.getAttribute("shop_no").toString();
            session.setAttribute("shop_no",shop_no);
            session.setAttribute("user","PHARMACIST");
            String bid = session.getAttribute("bid").toString();
            
            Connection con = null;
            
            try{
            	Class.forName("oracle.jdbc.driver.OracleDriver");
    			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","XE","xe");
                String s1 = "SELECT * FROM DETAIL WHERE BILL_NO="+bid;
                String s4 = "SELECT ORDER_ID FROM MED_BILL WHERE BILL_NO=" + bid;
                String mid="";
                int q1=0,q2=0;
                PreparedStatement statement = con.prepareStatement(s1);
                ResultSet r = statement.executeQuery(s1);
                while(r.next()){
                    mid=r.getString(3);
                    q1=r.getInt(4);
                    String s2 = "SELECT QUANTITY FROM INVENTORY WHERE MED_ID='"+mid+"'";
                   PreparedStatement statement2 = con.prepareStatement(s2);
                    ResultSet r2 = statement2.executeQuery(s2);
                    r2.next();
                    q2=r2.getInt(1);
                    
                    if(q2<q1){
                        out.println("<script language=\"javascript\">");
                        out.println("alert(\"Delivery can't be done as there is not enough stock.\");");
                        out.println("window.location.replace(\"paid.jsp\")");
                        out.println("</script>");
                    }
                }
                while(r.previous()){
                    String s3 = "UPDATE INVENTORY SET QUANTITY=QUANTITY-"+r.getInt(4)+" WHERE MED_ID='"+r.getString(3)+"' AND SHOP_NO="+shop_no;
                    PreparedStatement statement3 = con.prepareStatement(s3);
                    statement3.executeUpdate(s3);
                }
                s1="SELECT ORDER_ID FROM MED_BILL WHERE BILL_NO="+bid;
                statement= con.prepareStatement(s1);
                r=statement.executeQuery(s1);
                r.next();
                String oid = r.getString(1);
                
                s1="UPDATE  MED_ORDER SET STATUS='DELIVERED' WHERE ORDER_ID="+oid+" AND SHOP_NO="+shop_no;
                statement= con.prepareStatement(s1);
                statement.executeUpdate(s1);
                s1="UPDATE  MED_BILL SET STATUS='DELIVERED' WHERE BILL_NO="+bid+" AND SHOP_NO="+shop_no;
                statement= con.prepareStatement(s1);
                statement.executeUpdate(s1);
                out.println("<script language=\"javascript\">");
                out.println("alert(\"Delivery status changed successfully.\");");
                        out.println("window.location.replace(\"paid.jsp\")");
                        out.println("</script>");
                    
            }
            catch(Exception e){
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
