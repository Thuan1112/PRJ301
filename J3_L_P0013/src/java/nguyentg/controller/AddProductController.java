/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.controller;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nguyentg.dao.ProductDao;
import nguyentg.dto.Product;
import org.apache.log4j.Logger;

/**
 *
 * @author Nguyen
 */
public class AddProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static Logger log = Logger.getLogger(AddProductController.class.getName());
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id= null;
        String name= request.getParameter("newName");
        String imageLink= request.getParameter("newImageLink");
        int price= Integer.parseInt(request.getParameter("newPrice"));
        int quantity= Integer.parseInt(request.getParameter("newQuantity"));
        String description= request.getParameter("newDescription");
        String categoryID= request.getParameter("newCategory");
        try {
            ProductDao dao=new ProductDao();
            id= String.valueOf(dao.getLastProductID()+1);
            Product product= new Product(id, name, imageLink, description, price, quantity, categoryID);
            product.setCreateDate(LocalDate.now().toString());
            if(!dao.addProduct(product)){
                throw new  Exception();
            }
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
