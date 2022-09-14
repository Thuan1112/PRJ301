/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.controller;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentg.dto.User;
import org.apache.catalina.Context;
import org.apache.catalina.core.ApplicationContext;
import org.apache.log4j.Logger;

/**
 *
 * @author Nguyen
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String LOGIN_BY_GOOGLE = "LoginGoogleServlet";
    private static final String LOGOUT = "LogOutController";
    private static final String LOGIN = "LoginController";
    private static final String SEARCH = "SearchController";
    private static final String SEARCH_BY_PRICE = "SearchByPriceController";
    private static final String SEARCH_BY_CATEGORY = "SearchByCategoryController";
    private static final String SEARCH_BY_NAME = "SearchByNameController";
    private static final String CHANGE_PAGE = "ChangePageController";
    private static final String NETXT_PAGE = "NextPageController";
    private static final String PREVIOUS_PAGE = "PreviousPageController";
    private static final String DELETE_PRODUCT = "DeleteProductController";
    private static final String LOAD_UPDATE_PRODUCT = "LoadUpdateProductController";
    private static final String UPDATE_PRODUCT = "UpdateProductController";
    private static final String ADD_PRODUCT = "AddProductController";
    private static final String LOAD_DETAIL_PRODUCT = "LoadDetailProductController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String DELETE_PRODUCT_IN_CART = "DeleteProductInCartController";
    private static final String UPDATE_QUANTITY_PRODUCT_IN_CART = "UpdateQuantityProductInCartController";
    private static final String CART = "cart.jsp";
    private static final String INDEX = "index.jsp";
    private static final String CHECK_CART= "CheckCartController";
    private static final String INSERT_CART= "InsertCartController";
    private static final String SEARCH_BILL="SearchBillController";
    private static final String SEARCH_BILL_BY_NAME= "SearchBillByNameController";
    private static final String SEARCH_BILL_BY_DATE= "SearchBillByDateController";
    
    static Logger log = Logger.getLogger(MainController.class.getName());
            
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        User user = (User) request.getSession().getAttribute("user");
        String action = request.getParameter("action");
        String url = LOGOUT;
        try {
            if (action != null) {
                if (action.equals("loginByGoogle")) {
                    url = LOGIN_BY_GOOGLE;
                }
                if (action.equals("Login")) {
                    url = LOGIN;
                }
                if (action.equals("index")) {
                    url = INDEX;
                }
                if (action.equals("searchProduct")) {
                    url = SEARCH;
                }
                if (action.equals("Filter")) {
                    url = SEARCH_BY_PRICE;
                }
                if (action.equals("searchByCategory")) {
                    url = SEARCH_BY_CATEGORY;
                }
                if (action.equals("Search")) {
                    url = SEARCH_BY_NAME;
                }
                if (action.equals("changePage")) {
                    url = CHANGE_PAGE;
                }
                if (action.equals("nextPage")) {
                    url = NETXT_PAGE;
                }
                if (action.equals("previousPage")) {
                    url = PREVIOUS_PAGE;
                }
                if (action.equals("loadDetailProduct")) {
                    url = LOAD_DETAIL_PRODUCT;
                }
                if (user != null) {

                    if (user.getIsAdmin()) {
                        if (action.equals("Delete")) {
                            url = DELETE_PRODUCT;
                        }
                        if (action.equals("loadUpdateProduct")) {
                            url = LOAD_UPDATE_PRODUCT;
                        }
                        if (action.equals("Update")) {
                            url = UPDATE_PRODUCT;
                        }
                        if (action.equals("Add")) {
                            url = ADD_PRODUCT;
                        }
                    } else {
                        if (action.equals("Add to Cart")) {
                            url = ADD_TO_CART;
                        }
                        if (action.equals("Delete product")) {
                            url = DELETE_PRODUCT_IN_CART;
                        }
                        if (action.equals("updateProductInCart")) {
                            url = UPDATE_QUANTITY_PRODUCT_IN_CART;
                        }
                        if (action.equals("cart")) {
                            url = CART;
                        }
                        if(action.equals("checkCart")){
                            url= CHECK_CART;
                        }
                        if(action.equals("Cash Payment")){
                            url= INSERT_CART;
                        }
                        if(action.equals("searchHistory")){
                            url= SEARCH_BILL;
                        }
                        if(action.equals("Search bill")){
                            url=SEARCH_BILL_BY_NAME;
                        }
                        if(action.equals("Search date")){
                            url= SEARCH_BILL_BY_DATE;
                        }
                    }
                }
            }
        } catch (Exception e) {
            log(e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        if (null == request.getCharacterEncoding()) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
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
        if (null == request.getCharacterEncoding()) {
            request.setCharacterEncoding("UTF-8");
        }
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
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
