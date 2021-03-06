/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.admin;

import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.query.viewCustomerQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlets.recept.viewCustomerServlet;

/**
 *
 * @author raymun
 */
@WebServlet(name = "completeCustomerServlet", urlPatterns = {"/completeCustomerServlet"})
public class completeCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet completeCustomerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet completeCustomerServlet at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        viewCustomerQuery custQuery = new viewCustomerQuery(); //create the query
        ResultSet a = custQuery.selectAllCustomers();
        
        List<Customer> allCustomers = new ArrayList<Customer>();
        List<String> DiscountType = new ArrayList<String>();
        List<String> Discount = new ArrayList<String>();
        List<String> valued = new ArrayList<String>();
        try {
            while(a.next()){
                Customer singleCust = new Customer();
                singleCust.setName(a.getString("name"));
                singleCust.setCustomerID(a.getInt("customerID"));
                singleCust.setSurname(a.getString("surname"));
                singleCust.setEmail(a.getString("email"));
                singleCust.setPhoneNo(a.getString("phoneNo"));
                singleCust.setPostcode(a.getString("postcode"));
                singleCust.setAddress(a.getString("address"));
                singleCust.setHolder(a.getString("holder"));
                allCustomers.add(singleCust);
                if(a.getString("valuedcustomer.CustomercustomerID")!=null){
                    valued.add("Valued");
                }
                else{
                    valued.add("Not Valued");
                }
                if (a.getString("discountType")!= null){
                    
                    if(a.getString("discountType").equals("Fixed")){
                        DiscountType.add("Fixed");
                        Discount.add(a.getString("percentDiscount"));
                    }
                    
                    else if(a.getString("discountType").equals("Flexible")){
                        DiscountType.add("Flexible");
                        Discount.add(a.getString("discount"));
                    }
                    else if(a.getString("discountType").equals("Variable")){
                        Discount.add(null);
                        DiscountType.add("Variable Discount");
                    }
                    
                }
                
                else if(a.getString("discountType")== null){
                    Discount.add("0");
                    DiscountType.add("None");
                }
                //System.out.println(a.getString("discountType"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(viewCustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        request.setAttribute("suspended",custQuery.selectSuspendedCust() );
        request.setAttribute("default", custQuery.selectDefaultCust());
        request.setAttribute("valued",valued);
        request.setAttribute("allCustomers",allCustomers);
        request.setAttribute("discountType",DiscountType);
        request.setAttribute("discount",Discount);
        request.getRequestDispatcher("completeCustomerPage.jsp").forward(request,response);
                
        
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
