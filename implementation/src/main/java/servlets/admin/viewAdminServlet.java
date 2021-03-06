/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.admin;

import com.mycompany.implementation.domain.Staff;
import com.mycompany.implementation.query.getStaffQuery;
import com.mycompany.implementation.query.sendEmails;
import java.io.File;
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
@WebServlet(name = "viewAdminServlet", urlPatterns = {"/viewAdminServlet"})
public class viewAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet viewAdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewAdminServlet at " + request.getContextPath() + "</h1>");
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
        //get all the backups
        File folder = new File("C:\\Users\\raymu\\Documents\\team project\\implementation\\sqlBackups");
        request.setAttribute("Files",folder.listFiles());
        sendEmails b = new sendEmails();
        if(request.getParameter("Err")!=null){
            request.setAttribute("Err",request.getAttribute("err"));
        }
        try {
            getStaffQuery a = new getStaffQuery();
            ResultSet staff = a.getAllStaff();
            List<Staff> AllStaff = new ArrayList();
            List<String> Departments = new ArrayList();
            
            
            while (staff.next()) {
                Staff z = new Staff();
                z.setEmployeeType(staff.getString("employeeType"));
                z.setFirstName(staff.getString("firstName"));
                z.setSurName(staff.getString("surName"));
                z.setStaffID(staff.getInt("staffID"));
                
                if(staff.getString("technicianroom")==null){
                    Departments.add("N/a");
                }
                else{
                    Departments.add(staff.getString("technicianroom"));
                }

                AllStaff.add(z);
            }
            request.setAttribute("Staff", AllStaff);
            request.setAttribute("Department",Departments);
            
            request.getRequestDispatcher("adminForm.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(viewAdminServlet.class.getName()).log(Level.SEVERE, null, ex);
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
