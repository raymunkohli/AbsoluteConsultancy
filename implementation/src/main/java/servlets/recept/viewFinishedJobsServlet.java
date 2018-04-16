/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.recept;

import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.query.getFinishedJobs;
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
@WebServlet(name = "viewFinishedJobsServlet", urlPatterns = {"/viewFinishedJobsServlet"})
public class viewFinishedJobsServlet extends HttpServlet {

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
            out.println("<title>Servlet viewFinishedJobsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewFinishedJobsServlet at " + request.getContextPath() + "</h1>");
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
        try {
            getFinishedJobs a = new getFinishedJobs();
            ResultSet b = a.doGetFinishedJobs();
            List<String> name = new ArrayList();
            List<String> holder = new ArrayList();
            List<String> department = new ArrayList();
            List<String> desc = new ArrayList();
            List<String> Shelf = new ArrayList();
            List<String> jobs = new ArrayList();
            while (b.next()) {
                name.add(b.getString("name") + " " + b.getString("surname"));
                holder.add(b.getString("holder"));
                desc.add(b.getString("description"));
                if (b.getInt("finished") == 1) {
                    department.add("Finished");
                } else {
                    department.add(b.getString("department"));
                }
                Shelf.add(b.getString("shelf"));
                jobs.add(b.getString("JobID"));
            }
            request.setAttribute("Job", jobs);
            request.setAttribute("name", name);
            request.setAttribute("holder", holder);
            request.setAttribute("department", department);
            request.setAttribute("desc", desc);
            request.setAttribute("Shelf", Shelf);
            request.getRequestDispatcher("viewFinishedJobs.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(viewFinishedJobsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
