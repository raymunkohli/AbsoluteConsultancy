/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.recept;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Variablediscount;
import com.mycompany.implementation.query.getVariableDiscount;
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
@WebServlet(name = "addTaskServlet", urlPatterns = {"/addTaskServlet"})
public class addTaskServlet extends HttpServlet {

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
            out.println("<title>Servlet addTaskServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addTaskServlet at " + request.getContextPath() + "</h1>");
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
        if (request.getSession().getAttribute("DiscountType") != null) {
            
            if ((request.getSession().getAttribute("DiscountType").equals("Variable Discount"))) {
                viewTasksQuery a = new viewTasksQuery();
                List<Basetask> theTasks = a.doViewTasks();
                request.setAttribute("Tasks", theTasks);

                List<Variablediscount> theDiscounts;
                getVariableDiscount b = new getVariableDiscount();
                theDiscounts = b.doGetVariableDiscount(Integer.parseInt((String) request.getSession().getAttribute("CustomerID")));
                request.setAttribute("VariableDiscounts", theDiscounts);
                
            } else {
                viewTasksQuery a = new viewTasksQuery();
                List<Basetask> theTasks = a.doViewTasks();
                request.setAttribute("Tasks", theTasks);
            }
        }
        request.getRequestDispatcher("viewAllTasks.jsp").forward(request, response);
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
