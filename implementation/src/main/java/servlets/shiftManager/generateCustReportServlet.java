/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shiftManager;

import com.mycompany.implementation.query.getCustReportQuery;
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
@WebServlet(name = "generateCustReportServlet", urlPatterns = {"/generateCustReportServlet"})
public class generateCustReportServlet extends HttpServlet {

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
            out.println("<title>Servlet generateCustReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet generateCustReportServlet at " + request.getContextPath() + "</h1>");
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
        getCustReportQuery a = new getCustReportQuery();
        List<String> value = new ArrayList();
        List<String> amount = new ArrayList();
        List<String> time = new ArrayList();
        ResultSet b;
        try {
            if (request.getParameter("group1").equals("Day")) {

                b = a.doGetCustDayReportQuery(request.getParameter("from"), request.getParameter("to"), request.getParameter("Cust"));
                while (b.next()) {
                    value.add(b.getString("AValue"));
                    amount.add(b.getString("number"));
                    time.add(b.getString("time"));
                }

            }
            if (request.getParameter("group1").equals("Month")) {
                b = a.doGetCustMonthReportQuery(request.getParameter("from"), request.getParameter("to"), request.getParameter("Cust"));
                while (b.next()) {
                    value.add(b.getString("AValue"));
                    amount.add(b.getString("number"));
                    time.add(b.getString("time"));
                }
            }
            if (request.getParameter("group1").equals("Year")) {
                b = a.doGetCustYearReportQuery(request.getParameter("from"), request.getParameter("to"), request.getParameter("Cust"));
                while (b.next()) {
                    value.add(b.getString("AValue"));
                    amount.add(b.getString("number"));
                    time.add(b.getString("time"));
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(generateCustReportServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("name",request.getParameter("name"));
        request.setAttribute("value", value);
        request.setAttribute("amount", amount);
        request.setAttribute("time", time);
        request.setAttribute("from",request.getParameter("from"));
        request.setAttribute("to",request.getParameter("to"));
        request.getRequestDispatcher("custReport.jsp").forward(request, response);
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
