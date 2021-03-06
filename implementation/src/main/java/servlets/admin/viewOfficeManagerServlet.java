/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.admin;

import com.mycompany.implementation.query.checkForLatePaymentQuery;
import com.mycompany.implementation.query.getAlertQuery;
import com.mycompany.implementation.query.getLateJobs;
import com.mycompany.implementation.query.sendEmails;
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
import servlets.shiftManager.viewShiftManagerServlet;

/**
 *
 * @author raymun
 */
@WebServlet(name = "viewOfficeManagerServlet", urlPatterns = {"/viewOfficeManagerServlet"})
public class viewOfficeManagerServlet extends HttpServlet {

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
            out.println("<title>Servlet viewOfficeManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewOfficeManagerServlet at " + request.getContextPath() + "</h1>");
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
        sendEmails g = new sendEmails();
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
        boolean foundfirst = false;
        boolean foundsecond = false;
        boolean foundthird = false;
        boolean foundforth = false;
        try {
            if (lateJobs.next() && lateJobs.getDate("orderDate") != null) {
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
                request.setAttribute("phone", lateJobs.getString("phoneNo"));
                request.setAttribute("email", lateJobs.getString("email"));
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

        //code to manage late payments
        checkForLatePaymentQuery c = new checkForLatePaymentQuery();
        ResultSet firstPaymentAlert = c.getAlerts();
        ResultSet firstReminderAlert = c.getReminderAlerts();
        ResultSet secondReminderAlert = c.getSuspendedAlerts();
        ResultSet defaultAlert = c.getDefaultAlerts();
        
        //check to reset discounts
        if (LocalDate.now().getDayOfMonth()==1){
            c.resetDiscount();
        }
        
        try {

            while (firstPaymentAlert.next() && foundfirst == false) {
                if (LocalDate.now().isAfter(LocalDate.parse(firstPaymentAlert.getString("alertDate")))) {
                    request.setAttribute("firstLateAlertName", firstPaymentAlert.getString("name") + " " + firstPaymentAlert.getString("surname"));
                    request.setAttribute("firstLateAlertID", firstPaymentAlert.getString("customerID"));
                    request.setAttribute("firstLateAlertJobID", firstPaymentAlert.getString("JobID"));
                    foundfirst = true;
                }
            }

            while (firstReminderAlert.next() && foundsecond == false) {
                if (LocalDate.now().isAfter(LocalDate.parse(firstReminderAlert.getString("firstreminder")))) {
                    request.setAttribute("firstReminderAlertName", firstReminderAlert.getString("name") + " " + firstReminderAlert.getString("surname"));
                    request.setAttribute("firstReminderAlertID", firstReminderAlert.getString("customerID"));
                    request.setAttribute("firstReminderAlertJobID", firstReminderAlert.getString("JobID"));
                    g.sendFirstLetterReminder(firstReminderAlert.getString("email"),firstReminderAlert.getString("name") + " " + firstReminderAlert.getString("surname"));
                    foundsecond = true;
                }
            }
            c.suspendAccounts();

            while (secondReminderAlert.next() && foundthird == false) {
                request.setAttribute("secondReminderAlertName", secondReminderAlert.getString("name") + " " + secondReminderAlert.getString("surname"));
                request.setAttribute("secondReminderAlertID", secondReminderAlert.getString("customerID"));
                foundthird = true;
                g.sendSecondLetterReminder(secondReminderAlert.getString("email"),secondReminderAlert.getString("name") + " " + secondReminderAlert.getString("surname"));
            }
            c.defaultAccounts();
            
            while (defaultAlert.next() && foundforth == false) {
                request.setAttribute("defaultAlertName", defaultAlert.getString("name") + " " + defaultAlert.getString("surname"));
                request.setAttribute("defaultAlertID", defaultAlert.getString("customerID"));
                foundforth = true;
            }

        } catch (SQLException ex) {
            Logger.getLogger(viewOfficeManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("forth",foundforth);
        request.setAttribute("first", foundfirst);
        request.setAttribute("second", foundsecond);
        request.setAttribute("third", foundthird);

        request.getRequestDispatcher("officeManager.jsp").forward(request, response);
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
