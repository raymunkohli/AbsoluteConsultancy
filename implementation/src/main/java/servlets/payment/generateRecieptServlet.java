/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets.payment;

import com.mycompany.implementation.domain.Basetask;
import com.mycompany.implementation.domain.Customer;
import com.mycompany.implementation.domain.Job;
import com.mycompany.implementation.domain.Variablediscount;
import com.mycompany.implementation.query.getDataForInvoiceQuery;
import com.mycompany.implementation.query.getVariableDiscount;
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
@WebServlet(name = "generateRecieptServlet", urlPatterns = {"/generateRecieptServlet"})
public class generateRecieptServlet extends HttpServlet {

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
            out.println("<title>Servlet generateRecieptServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet generateRecieptServlet at " + request.getContextPath() + "</h1>");
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
        try {
            int numberofjobs = Integer.parseInt(request.getParameter("numberofjobs"));
            List<Job> jobs = new ArrayList();
            List<Double> prices = new ArrayList();
            List<String> taskID = new ArrayList();
            
            
            getDataForInvoiceQuery a = new getDataForInvoiceQuery();
            Customer c = a.getCustomerFromJob(Integer.parseInt(request.getParameter("0")));
            
            
            for(int i = 0; i!= numberofjobs; i++){
                jobs.add(a.getJobInfo(Integer.parseInt(request.getParameter(Integer.toString(i)))));
                List<Basetask> tasks = a.getTaskInformation(jobs.get(i).getJobID());
                double tempPrice =0;
                String temptaskID = new String();
                for (Basetask b : tasks) {
                    tempPrice = tempPrice +b.getPrice();
                    temptaskID = temptaskID + String.valueOf(b.getBaseTaskID())+",";
                }
                temptaskID = temptaskID.substring(0, temptaskID.length()-1);
                prices.add(tempPrice);
                taskID.add(temptaskID);
                
            }
            
            
            ResultSet DiscountInfo = a.getDiscountGivenCust(c.getCustomerID());
            String Discount = new String();
            double DiscountAmount;
            
            List<Variablediscount> varDiscount;
            
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
                    getVariableDiscount ab = new getVariableDiscount();
                    request.setAttribute("DiscountAmount", ab.doGetVariableDiscount(c.getCustomerID()));
                default:
                    break;  
            }   
            
        request.setAttribute("discount", Discount);
        request.setAttribute("task",taskID);
        request.setAttribute("price", prices);
        request.setAttribute("Cust", c);
        request.setAttribute("Jobs", jobs);
        request.getRequestDispatcher("reciept.jsp").forward(request, response);
        
        
        } catch (SQLException ex) {
            Logger.getLogger(generateRecieptServlet.class.getName()).log(Level.SEVERE, null, ex);
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
