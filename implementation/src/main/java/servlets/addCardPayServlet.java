/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.mycompany.implementation.query.addPaymentQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import static java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME;
import java.util.ArrayList;
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
@WebServlet(name = "addCardPayServlet", urlPatterns = {"/addCardPayServlet"})
public class addCardPayServlet extends HttpServlet {

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
            out.println("<title>Servlet addCardPayServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCardPayServlet at " + request.getContextPath() + "</h1>");
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
        addPaymentQuery a = new addPaymentQuery();
        List<Integer> jobs = new ArrayList();
        for(int num = 0; num !=Integer.parseInt(request.getParameter("numberofjobs")); num++){
           jobs.add(Integer.parseInt(request.getParameter(String.valueOf(num))));
           a.doAddPayment(Integer.parseInt(request.getParameter(String.valueOf(num))), LocalDate.parse(request.getParameter("cardPayDate")));
           a.addCardPayment(Integer.parseInt(request.getParameter(String.valueOf(num))), request.getParameter("digits"), request.getParameter("expdate"), request.getParameter("type"));
        }
        request.setAttribute("Date", ZonedDateTime.now().format(RFC_1123_DATE_TIME));
        request.setAttribute("Jobs", jobs);
        request.getRequestDispatcher("viewInvoiceServlet").forward(request, response);
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
