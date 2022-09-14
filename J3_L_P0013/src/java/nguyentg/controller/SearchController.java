/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.controller;

import java.io.IOException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentg.dao.CategoryDao;
import nguyentg.dao.ProductDao;
import nguyentg.dto.Category;
import nguyentg.dto.Product;
import nguyentg.dto.User;
/**
 *
 * @author Nguyen
 */
public class SearchController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static org.apache.log4j.Logger log = org.apache.log4j.Logger.getLogger(SearchController.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = String.valueOf(request.getSession().getAttribute("txtSearch"));
        String categoryID = String.valueOf(request.getSession().getAttribute("categoryID"));
        User user = (User) request.getSession().getAttribute("user");
        int priceMin = 0;
        int priceMax = 999999;
        int page = 1;
        try {
            priceMin = Integer.parseInt(String.valueOf(request.getSession().getAttribute("priceMin")));
            priceMax = Integer.parseInt(String.valueOf(request.getSession().getAttribute("priceMax")));
            page = Integer.parseInt(String.valueOf(request.getSession().getAttribute("page")));
        } catch (Exception e) {
            priceMin = 0;
            page = 1;
            ProductDao productDao = new ProductDao();
            try {
                priceMax = productDao.getPriceMax();
            } catch (Exception ex) {
                Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        try {
            if (name.equals("null")) {
                name = "";
            }
            if (categoryID.equals("null")) {
                categoryID = "all";
            }
            ProductDao productDao = new ProductDao();
            Vector<Product> products = productDao.searchProduct(name, categoryID, priceMin, priceMax, page);
            int quantityPage = productDao.countPage(name, categoryID, priceMin, priceMax);
            if (page > quantityPage) {
                page = 1;
            }
            if (!products.isEmpty()) {
                request.setAttribute("products", products);
                request.getSession().setAttribute("page", page);
                request.getSession().setAttribute("quantityPage", quantityPage);
                request.getSession().setAttribute("priceMin", priceMin);
                request.getSession().setAttribute("priceMax", priceMax);
            }
            CategoryDao categoryDao = new CategoryDao();
            Vector<Category> categorys = categoryDao.loadCategory();
            if (!categorys.isEmpty()) {
                request.setAttribute("categorys", categorys);
            }
            request.getSession().setAttribute("priceMaxCurrent", productDao.getPriceMax());
        } catch (Exception e) {
            log.error(e.toString());
        } finally {
            if (user != null) {
                if (user.getIsAdmin()) {
                    request.getRequestDispatcher("productManagement.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("CheckQuantityProductController").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("shop.jsp").forward(request, response);
            }
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
