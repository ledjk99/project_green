package com.ezen.mall.web.cart.dto;

public class Cart {
    private int productId;
    private String image;
    private String name;
    private int price;

    public Cart() {
    }

    public Cart(int productId, String image, String name, int price) {
        this.productId = productId;
        this.image = image;
        this.name = name;
        this.price = price;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "productId=" + productId +
                ", image='" + image + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
