/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shiftManager;

import com.mycompany.implementation.query.getAlertQuery;
import com.mycompany.implementation.query.getLateJobs;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlets.admin.viewOfficeManagerServlet;

/**
 *
 * @author raymun
 */
@WebServlet(name = "viewShiftManagerServlet", urlPatterns = {"/viewShiftManagerServlet"})
public class viewShiftManagerServlet extends HttpServlet {

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
            out.println("<title>Servlet viewShiftManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewShiftManagerServlet at " + request.getContextPath() + "</h1>");
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
        //jobs where deadline is not met
        getAlertQuery a = new getAlertQuery();
        List<String> lateTasks = new ArrayList();
        String deadlineExceed = "false";
        getLateJobs b = new getLateJobs();
        ResultSet lateJobs = b.getLateJobs();
        String affectedCust = new String();
        String instructions = new String();
        LocalDateTime order;
        LocalDateTime lateDeadline;
        String lateTask = new String();
        String isLate = "false";
        Long difference = 0L;
        
        
        try {
            if (lateJobs.next() && lateJobs.getDate("orderDate")!= null) {
                affectedCust = lateJobs.getString("name") + " " + lateJobs.getString("surname");
                order = LocalDateTime.of(LocalDate.parse(lateJobs.getDate("orderDate").toString()), LocalTime.parse(lateJobs.getTime("orderDate").toString()));
                lateDeadline = LocalDateTime.of(LocalDate.parse(lateJobs.getDate("deadline").toString()), LocalTime.parse(lateJobs.getTime("deadline").toString()));
                order = order.plusMinutes(lateJobs.getLong("Time"));
                difference = (Duration.between(lateDeadline, order).toMinutes());
                System.out.println(order);
                lateTasks = a.getTasksFromJob(lateJobs.getInt("JobID"));
                isLate = "true";
                for (String taskz : lateTasks) {
                    lateTask = lateTask + " \\n " + taskz;
                }
                request.setAttribute("phone",lateJobs.getString("phoneNo"));
                request.setAttribute("email",lateJobs.getString("email"));
                request.setAttribute("order", order);
                request.setAttribute("lateDate", lateDeadline);
                request.setAttribute("lateID", lateJobs.getInt("JobID"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(viewShiftManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.setAttribute("affectedCust", affectedCust);
        request.setAttribute("difference", difference);
        request.setAttribute("lateTask", lateTask);
        request.setAttribute("isLate", isLate);
        
        //new job checker
        String newJobAlert = "false";
        String cust = new String();
        String deadline = new String();
        List<String> tasks = new ArrayList();
        String theTask = new String();
        String jobID = new String();
        String spec = new String();
        try {

            ResultSet info = a.getNewJobQuery();
            if (info.next()) {
                newJobAlert = "true";
                cust = info.getString("name") + " " + info.getString("surname");
                deadline = info.getString("deadline");
                tasks = a.getTasksFromJob(info.getInt("JobID"));
                jobID = info.getString("JobID");
                spec = info.getString("specInstructions");
            }
        } catch (SQLException ex) {
            Logger.getLogger(viewOfficeManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (String taskz : tasks) {
            theTask = theTask + " \\n " + taskz;
        }
        request.setAttribute("spec", spec);
        request.setAttribute("jobid", jobID);
        request.setAttribute("tasks", theTask);
        request.setAttribute("deadline", deadline);
        request.setAttribute("cust", cust);
        request.setAttribute("newJobAlert", newJobAlert);
        request.getRequestDispatcher("shiftManager.jsp").forward(request, response);
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
