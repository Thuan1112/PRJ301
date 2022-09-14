/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentg.dao.ProductDao;
import nguyentg.dto.Product;
import nguyentg.dto.User;
import org.apache.log4j.Logger;

/**
 *
 * @author Nguyen
 */
public class UpdateProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static Logger log = Logger.getLogger(UpdateProductController.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id= request.getParameter("updateID");
        String name= request.getParameter("updateName");
        String imageLink= request.getParameter("updateImageLink");
        int price= Integer.parseInt(request.getParameter("updatePrice"));
        int quantity= Integer.parseInt(request.getParameter("updateQuantity"));
        String description= request.getParameter("updateDescription");
        String categoryID= request.getParameter("updateCategory");
        User user= (User) request.getSession().getAttribute("user");
        try {
            Product product= new Product(id, name, imageLink, description, price, quantity, categoryID);
            ProductDao dao=new ProductDao();
            if(!dao.updateProduct(product)){
                throw new  Exception();
            }
            String logID= String.valueOf((dao.getLastLogID()+1));
            dao.insertLog(logID,user.getId() , product.getId(), "Update");
        } catch (Exception e) {
            log.error(e.toString());
        }finally{
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
