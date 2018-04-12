/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.shiftManager;

import com.mycompany.implementation.query.getAlertQuery;
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
                //new job checker
        
        String newJobAlert = "false";
        String cust = new String();
        String deadline = new String();
        List<String> tasks = new ArrayList();
        String theTask = new String();
        String jobID = new String();
        try {
            getAlertQuery a= new getAlertQuery();
            ResultSet info = a.getNewJobQuery();
            if (info.next()){
                newJobAlert = "true";
                cust = info.getString("name") + " " +info.getString("surname");
                deadline = info.getString("deadline");
                tasks = a.getTasksFromJob(info.getInt("JobID"));
                jobID = info.getString("JobID");
            }
        } catch (SQLException ex) {
            Logger.getLogger(viewOfficeManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        for(String a: tasks){
            theTask = theTask+" \\n "+a;
        }
        request.setAttribute("jobid",jobID);
        request.setAttribute("tasks",theTask);
        request.setAttribute("deadline",deadline);
        request.setAttribute("cust",cust);
        request.setAttribute("newJobAlert",newJobAlert);
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
