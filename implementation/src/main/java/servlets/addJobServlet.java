/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.query.addJobQuery;
import com.mycompany.implementation.query.addTaskQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author raymu
 */
@WebServlet(name = "addJobServlet", urlPatterns = {"/addJobServlet"})
public class addJobServlet extends HttpServlet {

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
            out.println("<title>Servlet addJobServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addJobServlet at " + request.getContextPath() + "</h1>");
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
        System.out.print(request.getParameter("deadlineDate"));
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
        //check all fields are set
        if (request.getParameter("Type").equals("stipulated") && (request.getParameter("StipulatedAmount").equals("") || (request.getParameter("StipulatedTime").equals("")))) {
            request.setAttribute("Err", "Stipulated Surcharge/Time missing");
            request.getRequestDispatcher("receptionist_screen.jsp").forward(request, response);
        } 
        //check that cust is selected
        else if(request.getSession().getAttribute("CustomerID")==null){
            request.setAttribute("Err", "Select a customer first");
            request.getRequestDispatcher("receptionist_screen.jsp").forward(request, response);
        }
        
        
        
        else { //tests are passed so job can be created
            double Price = Double.parseDouble(request.getParameter("Price"));
            
            //get timestamps
            LocalDateTime Current = LocalDateTime.now();
            LocalDateTime Deadline = Current;
            //setup deadline +price if stipulated
            switch (request.getParameter("Type")) {
                case "stipulated":
                    LocalTime StipTime = LocalTime.parse(request.getParameter("StipulatedTime"));
                    Deadline = Current.plusHours(StipTime.getHour());
                    Deadline.plusMinutes(StipTime.getMinute());
                    Price = Double.parseDouble(request.getParameter("StipulatedAmount")) + Price;
                    break; 
                case "urgent":
                    Deadline = Current.plusHours(6);
                    break;
                case "regular":
                    Deadline = Current.plusDays(1);
                    break;
            }
            Job job = new Job();
            //job.setDeadline(new Date(Deadline.getYear(),Deadline.getMonthValue(),Deadline.getDayOfMonth(),Deadline.getHour(),Deadline.getMinute(),Deadline.getSecond()));
            job.setSpecInstructions(request.getParameter("SpecInstruct"));
            job.setValue(Price);
            addJobQuery j = new addJobQuery();
            int jobid = j.doAddJobQuery(Integer.parseInt((String) request.getSession().getAttribute("CustomerID")), Current, Deadline, job.getSpecInstructions(), Price);
            
            
            //insert each task
            String TaskString = request.getParameter("TotalTasks");
            String[] TaskList = TaskString.split("`");
            
            addTaskQuery t = new addTaskQuery();
            for (String a : TaskList) {
                t.doAddTaskQuery(jobid, Integer.parseInt(a));
            }

            request.getRequestDispatcher("receptionist_screen.jsp").forward(request, response);
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
