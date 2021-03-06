/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.latepayments;

import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.query.displayReminderQuery;
import com.mycompany.implementation.query.updateBulk;
import com.mycompany.implementation.query.viewCustomerQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import static java.time.format.DateTimeFormatter.ofLocalizedDate;
import static java.time.format.FormatStyle.FULL;
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
@WebServlet(name = "bulkSecondServlet", urlPatterns = {"/bulkSecondServlet"})
public class bulkSecondServlet extends HttpServlet {

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
            out.println("<title>Servlet bulkSecondServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet bulkSecondServlet at " + request.getContextPath() + "</h1>");
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
                viewCustomerQuery a = new viewCustomerQuery();
        displayReminderQuery b = new displayReminderQuery();
        List<String> jobValue = new ArrayList();
        List<String> job = new ArrayList();
        List<String> orderDates = new ArrayList();
        updateBulk f = new updateBulk();
        List<Customer> suspend = a.selectBulkSuspendedCust();
        for (Customer c : suspend) {
            List<Job> d = b.getJobSecond(c.getCustomerID().toString());
            double value = 0;
            String jobs = new String();
            for (Job e : d) {
                value = value + e.getValue();
                jobs = e.getJobID().toString() + "," + jobs;
            }
            job.add(jobs.substring(0, jobs.length() - 1));
            orderDates.add(LocalDate.parse((d.get(0).getOrderDate().toString())).format(ofLocalizedDate(FULL)));
            jobValue.add(String.format("%.2f",value));
        }
        
        f.updateDefault();
        
        request.setAttribute("job", job);
        request.setAttribute("jobValue", jobValue);
        request.setAttribute("orderDates", orderDates);
        request.setAttribute("suspended", suspend);
        request.getRequestDispatcher("bulksecond.jsp").forward(request, response);
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
