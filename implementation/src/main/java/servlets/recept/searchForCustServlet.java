/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.recept;

import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.query.searchForCustQuery;
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

/**
 *
 * @author raymun
 */
@WebServlet(name = "searchForCustServlet", urlPatterns = {"/searchForCustServlet"})
public class searchForCustServlet extends HttpServlet {

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
            out.println("<title>Servlet searchForCustServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchForCustServlet at " + request.getContextPath() + "</h1>");
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
        String Query = new String();
        searchForCustQuery query = new searchForCustQuery();

        if (!request.getParameter("name").isEmpty()) {
            Query = Query + " customer.name='" + request.getParameter("name") + "' AND";
        }
        if (!request.getParameter("surname").isEmpty()) {
            Query = Query + " customer.surname='" + request.getParameter("surname") + "' AND";
        }
        if (!request.getParameter("phone").isEmpty()) {
            Query = Query + " customer.phoneNo='" + request.getParameter("phoneNo") + "' AND";
        }
        if (!request.getParameter("email").isEmpty()) {
            Query = Query + " customer.email='" + request.getParameter("email") + "' AND";
        }
        if (!request.getParameter("address").isEmpty()) {
            Query = Query + " customer.address='" + request.getParameter("address") + "' AND";
        }
        if (!request.getParameter("postcode").isEmpty()) {
            Query = Query + " customer.postcode='" + request.getParameter("postcode") + "' AND";
        }
        if (!request.getParameter("holder").isEmpty()) {
            Query = Query + " customer.holder='" + request.getParameter("holder") + "' AND";
        }
        if (!request.getParameter("customerID").isEmpty()) {
            Query = Query + " customer.customerID='" + request.getParameter("customerID") + "' AND";
        }

        if (Query.length() != 0) {

            try {
                Query = Query.substring(0, Query.length() - 3);
                ResultSet a = query.doSearchForCustQuery(Query);
                if (!a.next()) {
                    request.setAttribute("Err", "No Customer Found");
                    request.getRequestDispatcher("viewCustomerServlet").forward(request, response);
                } else {
                    a.beforeFirst();
                    List<Customer> allCustomers = new ArrayList();
                    List<String> DiscountType = new ArrayList();
                    List<String> Discount = new ArrayList();
                    while (a.next()) {
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
                        if (a.getString("discountType") != null) {

                            if (a.getString("discountType").equals("Fixed")) {
                                DiscountType.add("Fixed");
                                Discount.add(a.getString("percentDiscount"));
                            } else if (a.getString("discountType").equals("Flexible")) {
                                DiscountType.add("Flexible");
                                Discount.add(a.getString("discount"));
                            } else if (a.getString("discountType").equals("Variable")) {
                                Discount.add(null);
                                DiscountType.add("Variable Discount");
                            }

                        } else if (a.getString("discountType") == null) {
                            Discount.add("0");
                            DiscountType.add("None");
                        }
                    }
                request.setAttribute("allCustomers", allCustomers);
                request.setAttribute("discountType", DiscountType);
                request.setAttribute("discount", Discount);
                request.getRequestDispatcher("viewCustomers.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                Logger.getLogger(searchForCustServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else {
            request.setAttribute("Err", "Fill in a field");
        request.getRequestDispatcher("viewCustomerServlet").forward(request, response);

    }

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
