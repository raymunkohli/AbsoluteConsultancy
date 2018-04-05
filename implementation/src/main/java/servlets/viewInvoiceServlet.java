/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.query.getDataForInvoiceQuery;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "viewInvoiceServlet", urlPatterns = {"/viewInvoiceServlet"})
public class viewInvoiceServlet extends HttpServlet {

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
            out.println("<title>Servlet viewInvoiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewInvoiceServlet at " + request.getContextPath() + "</h1>");
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
        System.out.println(((ArrayList<Integer>) request.getAttribute("Jobs")));
        getDataForInvoiceQuery Data = new getDataForInvoiceQuery();
        List<Job> allTheJobs = new ArrayList();
        List<Double> price = new ArrayList();
        List<String> taskID = new ArrayList();
        for (int a : (ArrayList<Integer>) request.getAttribute("Jobs")) {
            allTheJobs.add(Data.getJobInfo(a));
            double tempPrice = 0;
            String temptaskID = new String();
            
            List<Basetask> tasks = Data.getTaskInformation(a);
 
            for (Basetask b : tasks) {
                System.out.println(1231);
                tempPrice = tempPrice +b.getPrice();
                temptaskID = temptaskID + String.valueOf(b.getBaseTaskID())+",";
            }
            temptaskID = temptaskID.substring(0, temptaskID.length()-1);
            price.add(tempPrice);
            taskID.add(temptaskID);
        }
        request.setAttribute("task",taskID);
        request.setAttribute("price", price);
        request.setAttribute("Cust", Data.getCustomerFromJob(allTheJobs.get(0).getJobID()));
        request.setAttribute("Jobs", allTheJobs);
        request.getRequestDispatcher("invoice.jsp").forward(request, response);
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
