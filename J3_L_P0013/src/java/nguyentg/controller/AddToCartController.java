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
import nguyentg.dto.ProductInCart;
import org.apache.log4j.Logger;

/**
 *
 * @author Nguyen
 */
public class AddToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static Logger log = Logger.getLogger(AddToCartController.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        String name= request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int price = Integer.parseInt(request.getParameter("price"));
        Vector<ProductInCart> cart = (Vector<ProductInCart>) request.getSession().getAttribute("cart");
        int maxQuantity= Integer.parseInt(request.getParameter("maxQuantity"));
        try {
            if (cart == null) {
                cart = new Vector<>();
            }
            ProductInCart pic = null;
            for (ProductInCart productInCart : cart) {
                if (productInCart.getId().equals(id)) {
                    pic = productInCart;
                    break;
                }
            }
            if (pic == null) {
                cart.add(new ProductInCart(id, name,quantity,price,maxQuantity));
            } else {
                pic.setQuantity(pic.getQuantity() + quantity);
            }
            request.getSession().setAttribute("cart", cart);
        } catch (Exception e) {
            log.error(e.toString());
        } finally {
            request.getRequestDispatcher("SearchController").forward(request, response);
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
