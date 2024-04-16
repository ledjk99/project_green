package com.ezen.mall.web.product.dto;

public class Order {
    int order_id;
    int price;
    String order_comment;
    String regdate;
    String receiver;
    String address;
    String phone;

    public Order() {
    }

    public Order(String receiver, String phone, String address, String order_comment, int price){
        this.receiver = receiver;
        this.phone = phone;
        this.address = address;
        this.order_comment = order_comment;
        this.price = price;
    }

    public Order(int order_id, int price, String order_comment, String regdate, String receiver, String address, String phone) {
        this.order_id = order_id;
        this.price = price;
        this.order_comment = order_comment;
        this.regdate = regdate;
        this.receiver = receiver;
        this.address = address;
        this.phone = phone;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getOrder_comment() {
        return order_comment;
    }

    public void setOrder_comment(String order_comment) {
        this.order_comment = order_comment;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id='" + order_id + '\'' +
                ", price='" + price + '\'' +
                ", order_comment='" + order_comment + '\'' +
                ", regdate='" + regdate + '\'' +
                ", receiver='" + receiver + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
