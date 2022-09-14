/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.dto;

import java.util.Vector;

/**
 *
 * @author Nguyen
 */
public class Bill {
    private String id;
    private int total;
    private String paymentMethod;
    private String createDate;
    private Vector<ProductInCart> productList;

    public Bill() {
    }

    public Bill(String id, int total, boolean paymentMethod, String createDate, Vector<ProductInCart> productList) {
        this.id = id;
        this.total = total;
        if(paymentMethod){
            this.paymentMethod="Paypal";
        }else{
            this.paymentMethod="Cash";
        }
        this.createDate = createDate;
        this.productList = productList;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(boolean paymentMethod) {
        if(paymentMethod){
            this.paymentMethod="Paypal";
        }else{
            this.paymentMethod="Cash";
        }
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Vector<ProductInCart> getProductList() {
        return productList;
    }

    public void setProductList(Vector<ProductInCart> productList) {
        this.productList = productList;
    }
    
    
}
