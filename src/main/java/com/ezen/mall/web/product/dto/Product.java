package com.ezen.mall.web.product.dto;

import java.util.Date;

public class Product {

    private int productId;
    private int price;
    private String name;
    private String information;
    private int stock;
    private Date regdate;
    private int quantity;
    private int categoryId;

    public Product() {}

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date legdate) {
        this.regdate = legdate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", price=" + price +
                ", name='" + name + '\'' +
                ", information='" + information + '\'' +
                ", stock=" + stock +
                ", legdate=" + regdate +
                ", quantity=" + quantity +
                ", categoryId=" + categoryId +
                '}';
    }
}
