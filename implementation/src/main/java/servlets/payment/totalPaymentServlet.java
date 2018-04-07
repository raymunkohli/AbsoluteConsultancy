/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.payment;

import com.mycompany.implementation.domain.Job;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
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
@WebServlet(name = "totalPaymentServlet", urlPatterns = {"/totalPaymentServlet"})
public class totalPaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet totalPaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet totalPaymentServlet at " + request.getContextPath() + "</h1>");
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
        Enumeration<String> a = request.getParameterNames();
        List<Job> jobID = new ArrayList();
        Double price = 0.0;  
        boolean jobsSelected = false;
        while(a.hasMoreElements()){
            String c = a.nextElement();
            System.out.println(c);
            String temp = request.getParameter(c);
            String[] fullJob = temp.split("`");
            Job singlejob = new Job();
            singlejob.setJobID(Integer.parseInt(fullJob[0]));
            singlejob.setValue(Double.parseDouble(fullJob[1]));
            singlejob.setOrderDate(Date.valueOf((fullJob[2])));
            singlejob.setDeadline(Date.valueOf((fullJob[3])));
            price = price + singlejob.getValue();
            jobID.add(singlejob);
            jobsSelected = true;
        }
       request.setAttribute("jobsselected",jobsSelected);
       request.setAttribute("selectedJobs",jobID);
       request.setAttribute("Jobs",jobID);
       request.setAttribute("price",price);
       request.getRequestDispatcher("payment.jsp").forward(request,response);
        
        
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
