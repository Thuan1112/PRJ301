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
public class Product implements Serializable{
    private String id;
    private String name;
    private String imageLink;
    private String description;
    private String createDate;
    private int price;
    private int quantity;
    private String categoryID;

    public Product() {
    }

    public Product(String id, String name, String imageLink, String description, String createDate, int price, int quantity, String categoryID) {
        this.id = id;
        this.name = name;
        this.imageLink = imageLink;
        this.description = description;
        this.createDate = createDate;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
    }

    public Product(String id, String name, String imageLink, String description, int price, int quantity, String categoryID) {
        this.id = id;
        this.name = name;
        this.imageLink = imageLink;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = categoryID;
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

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }
    
    
}
