package com.ezen.mall.domain.mall.dto;

public class Product {
    private int productId;
    private int price;
    private String name;
    private String information;
    private int stock;
    private String regdate;
    private int sellQuantity;
    private int categoryId;
    private String image;

    public Product() {
    }

    public Product(int productId, int price, String name, String information, int stock, String regdate, int sellQuantity, int categoryId, String image) {
        this.productId = productId;
        this.price = price;
        this.name = name;
        this.information = information;
        this.stock = stock;
        this.regdate = regdate;
        this.sellQuantity = sellQuantity;
        this.categoryId = categoryId;
        this.image = image;
    }

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

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getSellQuantity() {
        return sellQuantity;
    }

    public void setSellQuantity(int sellQuantity) {
        this.sellQuantity = sellQuantity;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", price=" + price +
                ", name='" + name + '\'' +
                ", information='" + information + '\'' +
                ", stock=" + stock +
                ", regdate='" + regdate + '\'' +
                ", sellQuantity=" + sellQuantity +
                ", categoryId=" + categoryId +
                ", image='" + image + '\'' +
                '}';
    }

}


