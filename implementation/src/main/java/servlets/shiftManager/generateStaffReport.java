/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shiftManager;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.domain.Staff;
import com.mycompany.implementation.domain.Task;
import com.mycompany.implementation.query.getStaffReportQuery;
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

/**
 *
 * @author raymun
 */
@WebServlet(name = "generateStaffReport", urlPatterns = {"/generateStaffReport"})
public class generateStaffReport extends HttpServlet {

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
            out.println("<title>Servlet generateStaffReport</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet generateStaffReport at " + request.getContextPath() + "</h1>");
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
        getStaffReportQuery a = new getStaffReportQuery();
        ArrayList<Integer> staff = new ArrayList();
        LocalDateTime to = LocalDateTime.of(LocalDate.parse(request.getParameter("staffTo")), LocalTime.parse("00:00:00"));
        LocalDateTime from = LocalDateTime.of(LocalDate.parse(request.getParameter("fromStaff")), LocalTime.parse("00:00:00"));
        String[] Staff = request.getParameter("allStaff").split("`");
        for (String S : Staff) {
            staff.add(Integer.parseInt(S));
        }
        ResultSet Results = a.doGetStaffReportQuery(staff, to, from);
        List<Staff> returnedStaff = new ArrayList();
        List<Basetask> returnedBase = new ArrayList();
        List<Task> returnedTask = new ArrayList();
        List<LocalTime> times = new ArrayList();
        List<Integer> takenTime = new ArrayList();
        List<Integer> timePerPerson = new ArrayList();
        Long time = 0L;
        boolean dupe = false;
        try {
            while (Results.next()) {
                //get Staff Info
                Staff newS = new Staff();

                //evaluate if the next user is the same as the current (for use in the totalTime)
                //evaluate if current user is the same as the previous user
                if (!Results.isFirst()) {
                    if (Results.getInt("staffID") == returnedStaff.get(returnedStaff.size() - 1).getStaffID()) {
                        newS.setFirstName(" ");
                        newS.setSurName(" ");
                        newS.setStaffID(Results.getInt("staffID"));
                    } else {
                        newS.setFirstName(Results.getString("firstName"));
                        newS.setSurName(Results.getString("surName"));
                        newS.setStaffID(Results.getInt("staffID"));
                    }

                } else {
                    newS.setFirstName(Results.getString("firstName"));
                    newS.setSurName(Results.getString("surName"));
                    newS.setStaffID(Results.getInt("staffID"));
                }
                returnedStaff.add(newS);
                if (!Results.isLast()) {
                    Results.next();
                    dupe = (!Results.isFirst() && Results.getInt("staffID") == returnedStaff.get(returnedStaff.size() - 1).getStaffID());
                    Results.previous();
                } else {
                    dupe = false;
                }
                //get Task Info
                Task newTask = new Task();
                newTask.setStartDate(Results.getDate("startDate"));
                times.add((Results.getTime("startDate").toLocalTime()));
                LocalTime tempTime = Results.getTime("endDate").toLocalTime();
                Long d = Duration.between(Results.getTime("startDate").toLocalTime(), tempTime).toMinutes();
                takenTime.add(d.intValue());
                newTask.setJobJobID(new Job(Results.getInt("JobJobID")));
                returnedTask.add(newTask);

                if (dupe == true) {
                    time = time + takenTime.get(takenTime.size() - 1);
                    timePerPerson.add(-1);
                } else {
                    time = time + takenTime.get(takenTime.size() - 1);
                    timePerPerson.add(time.intValue());
                    time = 0L;
                }
                dupe = false;
                //get Base Task Info
                Basetask newBase = new Basetask();
                newBase.setDepartment(Results.getString("department"));
                newBase.setBaseTaskID(Results.getInt("baseTaskID"));
                returnedBase.add(newBase);
            }
            request.setAttribute("timePerPerson", timePerPerson);
            request.setAttribute("startTime", times);
            request.setAttribute("takenTime", takenTime);
            request.setAttribute("to", request.getParameter("staffTo"));
            request.setAttribute("from", request.getParameter("fromStaff"));
            request.setAttribute("Staff", returnedStaff);
            request.setAttribute("Task", returnedTask);
            request.setAttribute("Base", returnedBase);
            request.getRequestDispatcher("staffReport.jsp").forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(generateStaffReport.class.getName()).log(Level.SEVERE, null, ex);
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
