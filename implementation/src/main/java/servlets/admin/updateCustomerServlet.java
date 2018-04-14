/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.admin;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.query.setDiscountQuery;
import com.mycompany.implementation.query.updateCustomerQuery;
import com.mycompany.implementation.query.valuedCustomerQuery;
import com.mycompany.implementation.query.viewTasksQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author raymun
 */
@WebServlet(name = "updateCustomerServlet", urlPatterns = {"/updateCustomerServlet"})
public class updateCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet updateCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateCustomerServlet at " + request.getContextPath() + "</h1>");
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
        updateCustomerQuery a = new updateCustomerQuery();
        valuedCustomerQuery b = new valuedCustomerQuery();
        setDiscountQuery c = new setDiscountQuery();
        viewTasksQuery d = new viewTasksQuery();
        List<Basetask> tasks = d.doViewTasks();
        
        request.setAttribute("tasks", tasks);
        String custid = request.getParameter("id");
        a.doUpdateCustomerQuery(custid, request.getParameter("firstname"), request.getParameter("surname"), request.getParameter("phone"), request.getParameter("email"), request.getParameter("address"), request.getParameter("postcode"), request.getParameter("holder"));

        if (request.getParameter("valued") == null && request.getParameter("beforeValued").equals("true")) { //remove valued customer
            //remove valued
            b.removeValued(custid);
            response.sendRedirect("completeCustomerServlet");
        } else if (request.getParameter("valued") != null && request.getParameter("beforeValued").equals("false")) { //add valued customer
            //set valued
            b.setValued(custid);
            if (request.getParameter("discount").equals("None")) { //no discount package
                response.sendRedirect("completeCustomerServlet");
            } else { //discount package
                int discountID;
                String discount = request.getParameter("discount");
                if (request.getParameter("discount").startsWith("new")) {
                    discount = discount.substring(3);
                    discountID = c.createNewDiscount(discount, custid);
                } else {
                    discountID = c.createNewDiscount(discount, custid);
                }

                request.setAttribute("discountID", discountID);
                request.setAttribute("discount", discount);
                request.getRequestDispatcher("changeDiscount.jsp").forward(request, response);
            }

        } else if (request.getParameter("discount").equals("None")) {
            c.removeDiscount(custid);
            System.out.println(1234);
            response.sendRedirect("completeCustomerServlet");
        } else if (!request.getParameter("prevDiscount").equals(request.getParameter("discount")) && request.getParameter("valued") != null) { //change discount package
            int discountID;
            String discount = request.getParameter("discount");
            if (request.getParameter("discount").startsWith("new")) {
                discount = discount.substring(3);
                discountID = c.createNewDiscount(discount, custid);
            } else {
                discountID = c.createNewDiscount(discount, custid);
            }

            request.setAttribute("discountID", discountID);
            request.setAttribute("discount", discount);
            request.getRequestDispatcher("changeDiscount.jsp").forward(request, response);
        } else {
            System.out.println(123);
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
