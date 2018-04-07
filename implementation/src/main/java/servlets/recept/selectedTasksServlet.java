/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.recept;

import com.mycompany.implementation.domain.Basetask;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "selectedTasksServlet", urlPatterns = {"/selectedTasksServlet"})
public class selectedTasksServlet extends HttpServlet {

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
            out.println("<title>Servlet selectedStaffServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet selectedStaffServlet at " + request.getContextPath() + "</h1>");
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
        
        Enumeration<String> a = request.getParameterNames(); 
        //creates an array of strings containing all the attribute names sent in the request 
        List<Basetask> d = new ArrayList<Basetask>();
        List<Double> discounts = new ArrayList<>();
        
        System.out.println(a);
        while (a.hasMoreElements()){
                     
            String[] John = request.getParameter(a.nextElement()).split("`");
            Basetask c = new Basetask();
            
            
            c.setBaseTaskID(Integer.parseInt(John[0]));
            c.setTaskName(John[1]);
            c.setDescription(John[2]);
            c.setDepartment(John[3]);
            c.setPrice(Double.parseDouble(John[4]));
            discounts.add(Double.parseDouble(John[5]));
            
            d.add(c);
        }
        //System.out.println(d.get(0).getBaseTaskID());
        request.setAttribute("SelectedTasks", d);
        request.setAttribute("calculatedDiscounts",discounts);
        
        request.getRequestDispatcher("receptionist_screen.jsp").forward(request,response);
        
        
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
