/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.domain.Variablediscount;
import com.mycompany.implementation.query.getDataForInvoiceQuery;
import com.mycompany.implementation.query.getVariableDiscount;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import static java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME;
import java.util.ArrayList;
import java.util.Enumeration;
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
@WebServlet(name = "viewInvoiceServlet", urlPatterns = {"/viewInvoiceServlet"})
public class viewInvoiceServlet extends HttpServlet {

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
            out.println("<title>Servlet viewInvoiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewInvoiceServlet at " + request.getContextPath() + "</h1>");
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
        List<Job> allTheJobs = new ArrayList();
        List<Integer> jobs = new ArrayList();
        for(int num = 0; num !=Integer.parseInt(request.getParameter("numberofjobs")); num++){
           jobs.add(Integer.parseInt(request.getParameter(String.valueOf(num))));
        }
        
        getDataForInvoiceQuery Data = new getDataForInvoiceQuery();
        List<Double> prices = new ArrayList();
        List<String> taskID = new ArrayList();
        for (int a : (ArrayList<Integer>) jobs) {
            allTheJobs.add(Data.getJobInfo(a));
            double tempPrice = 0;
            String temptaskID = new String();
            
            List<Basetask> tasks = Data.getTaskInformation(a);
 
            for (Basetask b : tasks) {
                System.out.println(1231);
                tempPrice = tempPrice +b.getPrice();
                temptaskID = temptaskID + String.valueOf(b.getBaseTaskID())+",";
            }
            temptaskID = temptaskID.substring(0, temptaskID.length()-1);
            prices.add(tempPrice);
            taskID.add(temptaskID);
        }
        //get the discounts
        Customer cust =Data.getCustomerFromJob(allTheJobs.get(0).getJobID());
        ResultSet DiscountInfo = Data.getDiscountGivenCust(cust.getCustomerID());
        String Discount = new String();
        double DiscountAmount;
        List<Variablediscount> varDiscount;
        try {
            if (DiscountInfo.next() == false){
                Discount = "none";
            }
            else switch (DiscountInfo.getString("discountType")) {
                case "Fixed":
                    Discount = "Fixed";
                    request.setAttribute("DiscountAmount",DiscountInfo.getDouble("percentDiscount"));
                    break;
                case "Flexible":
                    Discount ="Flexible";
                    request.setAttribute("DiscountAmount",DiscountInfo.getDouble("discount"));
                    break;
                case "Variable":
                    Discount = "Variable";
                    getVariableDiscount a = new getVariableDiscount();
                    request.setAttribute("DiscountAmount", a.doGetVariableDiscount(cust.getCustomerID()));
                default:
                    break;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(viewInvoiceServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("Date", ZonedDateTime.now().format(RFC_1123_DATE_TIME));
        request.setAttribute("discount", Discount);
        request.setAttribute("task",taskID);
        request.setAttribute("price", prices);
        request.setAttribute("Cust", cust);
        request.setAttribute("Jobs", allTheJobs);
        request.getRequestDispatcher("invoice.jsp").forward(request, response);
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
