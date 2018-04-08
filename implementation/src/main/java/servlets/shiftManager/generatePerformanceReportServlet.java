/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shiftManager;

import com.mycompany.implementation.query.getPerformanceReportQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
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
@WebServlet(name = "generatePerformanceReportServlet", urlPatterns = {"/generatePerformanceReportServlet"})
public class generatePerformanceReportServlet extends HttpServlet {

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
            out.println("<title>Servlet generatePerformanceReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet generatePerformanceReportServlet at " + request.getContextPath() + "</h1>");
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
        //check that parameters are met
        String Err = "nothing";
        if (request.getParameter("dayShiftEarly") == null && request.getParameter("nightShift") == null && request.getParameter("dayShiftLate") == null) {
            if (Err.equals("nothing")) {
                Err = "Select a Shift";
            }
        }
        if (!Err.equals("nothing")) {
            request.setAttribute("perErr", Err);
            request.getRequestDispatcher("shiftManager.jsp").forward(request, response);
        } else {
            getPerformanceReportQuery a = new getPerformanceReportQuery();
            if (request.getParameter("dayShiftEarly") != null) {
                try {
                    List<String> dayShiftEarlyDate = new ArrayList();
                    List<Integer> dayShiftEarlyDevelopment = new ArrayList();
                    List<Integer> dayShiftEarlyPackaging = new ArrayList();
                    List<Integer> dayShiftEarlyFinishing = new ArrayList();
                    List<Integer> dayShiftEarlyCopy = new ArrayList();
                    ResultSet Result = a.dayShiftEarly(LocalDate.parse(request.getParameter("fromDate")), LocalDate.parse(request.getParameter("toDate")));
                    while (Result.next()) {
                        dayShiftEarlyDate.add(Result.getString("Date"));
                        dayShiftEarlyDevelopment.add(Result.getInt("Development"));
                        dayShiftEarlyPackaging.add(Result.getInt("Packaging"));
                        dayShiftEarlyFinishing.add(Result.getInt("Finishing"));
                        dayShiftEarlyCopy.add(Result.getInt("Copy Room"));
                    }
                    request.setAttribute("dayShiftEarlyDate", dayShiftEarlyDate);
                    request.setAttribute("dayShiftEarlyDevelopment", dayShiftEarlyDevelopment);
                    request.setAttribute("dayShiftEarlyPackaging", dayShiftEarlyPackaging);
                    request.setAttribute("dayShiftEarlyFinishing", dayShiftEarlyFinishing);
                    request.setAttribute("dayShiftEarlyCopy", dayShiftEarlyCopy);

                } catch (SQLException ex) {
                    Logger.getLogger(generatePerformanceReportServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (request.getParameter("dayShiftLate") != null) {
                try {
                    List<String> dayShiftLateDate = new ArrayList();
                    List<Integer> dayShiftLateDevelopment = new ArrayList();
                    List<Integer> dayShiftLatePackaging = new ArrayList();
                    List<Integer> dayShiftLateFinishing = new ArrayList();
                    List<Integer> dayShiftLateCopy = new ArrayList();
                    ResultSet Result = a.dayShiftLate(LocalDate.parse(request.getParameter("fromDate")), LocalDate.parse(request.getParameter("toDate")));
                    while (Result.next()) {
                        dayShiftLateDate.add(Result.getString("Date"));
                        dayShiftLateDevelopment.add(Result.getInt("Development"));
                        dayShiftLatePackaging.add(Result.getInt("Packaging"));
                        dayShiftLateFinishing.add(Result.getInt("Finishing"));
                        dayShiftLateCopy.add(Result.getInt("Copy Room"));
                    }
                    request.setAttribute("dayShiftLateDate", dayShiftLateDate);
                    request.setAttribute("dayShiftLateDevelopment", dayShiftLateDevelopment);
                    request.setAttribute("dayShiftLatePackaging", dayShiftLatePackaging);
                    request.setAttribute("dayShiftLateFinishing", dayShiftLateFinishing);
                    request.setAttribute("dayShiftLateCopy", dayShiftLateCopy);

                } catch (SQLException ex) {
                    Logger.getLogger(generatePerformanceReportServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (request.getParameter("nightShift") != null) {
                try {
                    List<String> nightShiftDate = new ArrayList();
                    List<Integer> nightShiftDevelopment = new ArrayList();
                    List<Integer> nightShiftPackaging = new ArrayList();
                    List<Integer> nightShiftFinishing = new ArrayList();
                    List<Integer> nightShiftCopy = new ArrayList();
                    ResultSet Result = a.nightShift(LocalDate.parse(request.getParameter("fromDate")), LocalDate.parse(request.getParameter("toDate")));
                    while (Result.next()) {
                        nightShiftDate.add(Result.getString("Date"));
                        nightShiftDevelopment.add(Result.getInt("Development"));
                        nightShiftPackaging.add(Result.getInt("Packaging"));
                        nightShiftFinishing.add(Result.getInt("Finishing"));
                        nightShiftCopy.add(Result.getInt("Copy Room"));
                    }
                    request.setAttribute("nightShiftDate", nightShiftDate);
                    request.setAttribute("nightShiftDevelopment", nightShiftDevelopment);
                    request.setAttribute("nightShiftPackaging", nightShiftPackaging);
                    request.setAttribute("nightShiftFinishing", nightShiftFinishing);
                    request.setAttribute("nightShiftCopy", nightShiftCopy);
                } catch (SQLException ex) {
                    Logger.getLogger(generatePerformanceReportServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            request.getRequestDispatcher("summaryReport").forward(request, response);

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
