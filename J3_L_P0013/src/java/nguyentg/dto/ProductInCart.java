/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentg.dto;

import java.io.Serializable;

/**
 *
 * @author Nguyen
 */
public class ProductInCart implements Serializable{
    private String id;
    private String name;
    private int quantity;
    private int price;
    private int maxQuantity;
            
    public ProductInCart() {
    }

    public ProductInCart(String id, String name, int quantity, int price, int maxQuantity) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.maxQuantity = maxQuantity;
    }




    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getMaxQuantity() {
        return maxQuantity;
    }

    public void setMaxQuantity(int maxQuantity) {
        this.maxQuantity = maxQuantity;
    }
    
}
