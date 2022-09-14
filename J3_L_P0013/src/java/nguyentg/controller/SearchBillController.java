/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentg.dao.BillDao;
import nguyentg.dto.Bill;
import nguyentg.dto.User;
import org.apache.log4j.Logger;

/**
 *
 * @author Nguyen
 */
public class SearchBillController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static Logger log = Logger.getLogger(SearchBillController.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = String.valueOf(request.getSession().getAttribute("nameBill"));
        String minDate = String.valueOf(request.getSession().getAttribute("minDate"));
        String maxDate = String.valueOf(request.getSession().getAttribute("maxDate"));
        User user = (User) request.getSession().getAttribute("user");
        try {
            if (name.equals("null")) {
                name = "";
            }
            if (minDate.equals("null")) {
                minDate = "2000-01-01";
            } else {
                minDate = changeFormatDate(minDate);
            }
            if (maxDate.equals("null")) {
                maxDate = LocalDate.now().toString();
            } else {
                maxDate = changeFormatDate(maxDate);
            }
            BillDao dao = new BillDao();
            Vector<Bill> bills = dao.searchBill(name, minDate, maxDate, user.getId());
            for (Bill bill : bills) {
                bill.setProductList(dao.searchProductInBill(bill.getId()));
            }
            request.setAttribute("bills", bills);
        } catch (Exception e) {
            log.error(e.toString());
        } finally {
            request.getRequestDispatcher("historyShopping.jsp").forward(request, response);
        }
    }

    private String changeFormatDate(String date) {
        return LocalDate.of(Integer.parseInt(date.substring(6)), Integer.parseInt(date.substring(0, 2)), Integer.parseInt(date.substring(3, 5))).toString();
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
        processRequest(request, response);
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
