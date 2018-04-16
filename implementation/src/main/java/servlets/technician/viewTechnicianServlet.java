/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.technician;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.domain.Task;
import com.mycompany.implementation.query.viewTechQuery;
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
 * @author Lukas
 */
@WebServlet(name = "viewTechnicianServlet", urlPatterns = {"/viewTechnicianServlet"})
public class viewTechnicianServlet extends HttpServlet {

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
            out.println("<title>Servlet viewTechnicianServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewTechnicianServlet at " + request.getContextPath() + "</h1>");
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

        //initalise Query
        viewTechQuery a = new viewTechQuery();
        String StaffRoom = new String();
        //Return room which member of staff can access
        if (request.getSession().getAttribute("userType").toString().equals("Technician")) {
            StaffRoom = a.doViewTechQuery(Integer.parseInt(request.getSession().getAttribute("staffID").toString()));
        }
        else{
            // If shift/office manager select all the rooms 
            StaffRoom = "Copy' OR basetask.department='Development' OR basetask.department='Finishing' OR basetask.department='Packaging";
        }
        //run the query to get the data for all the rooms
        ResultSet Results = a.getJobs(StaffRoom);
        List<Job> Jobs = new ArrayList();
        List<Customer> Customers = new ArrayList();
        List<Task> Tasks = new ArrayList();
        List<Basetask> Basetasks = new ArrayList();

        try {
            while (Results.next()) {
                Job j = new Job();
                j.setJobID(Results.getInt("jobID"));
                j.setDeadline(Results.getTimestamp("deadline"));

                Customer c = new Customer();
                c.setHolder(Results.getString("holder"));
                c.setName(Results.getString("name"));
                c.setSurname(Results.getString("surname"));

                Basetask b = new Basetask();
                b.setDescription(Results.getString("description"));
                b.setDepartment(Results.getString("department"));

                Task t = new Task();
                t.setTaskID(Results.getInt("taskID"));

                Jobs.add(j);
                Customers.add(c);
                Basetasks.add(b);
                Tasks.add(t);
            }
            request.setAttribute("Jobs", Jobs);
            request.setAttribute("Customers", Customers);
            request.setAttribute("Basetasks", Basetasks);
            request.setAttribute("Tasks", Tasks);
        } catch (SQLException ex) {
            Logger.getLogger(viewTechnicianServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("technician_screen.jsp").forward(request, response);
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
