/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.controller;

import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentg.dao.BillDao;
import nguyentg.dto.ProductInCart;
import nguyentg.dto.User;
import org.apache.log4j.Logger;

/**
 *
 * @author Nguyen
 */
public class InsertCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static Logger log = Logger.getLogger(InsertCartController.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Vector<ProductInCart> cart= (Vector<ProductInCart>) request.getSession().getAttribute("cart");
        User user= (User) request.getSession().getAttribute("user");
        int status= Integer.parseInt(request.getParameter("status"));
        try {
            BillDao dao= new BillDao();
            int total=0;
            for(ProductInCart productInCart: cart){
                dao.updateProduct(productInCart.getId(), productInCart.getQuantity());
                total+=(productInCart.getPrice()* productInCart.getQuantity());
            }
            String id= String.valueOf((dao.getLastBillID()+1));
            dao.addBill(id,user.getId(), total, status);
            for(ProductInCart productInCart: cart) {
                String detailID=String.valueOf(( dao.getLastBillDetailID()+1));
                dao.addBillDetail(detailID,id,productInCart);
            }
            request.getSession().removeAttribute("cart");
        } catch (Exception e) {
            log.error(e.toString());
        }finally{
            request.getRequestDispatcher("SearchBillController").forward(request, response);
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
