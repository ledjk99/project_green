package com.ezen.mall.web.product.dto;

import java.util.Date;

public class OrderInfo {
    private int orderId;
    private int price;
    private String comment;
    private Date date;
    private String receiver;
    private String address;
    private String phoneNum;

    public OrderInfo() {}

    public OrderInfo(int orderId, int price, String comment, Date date, String receiver, String address, String phoneNum) {
        this.orderId = orderId;
        this.price = price;
        this.comment = comment;
        this.date = date;
        this.receiver = receiver;
        this.address = address;
        this.phoneNum = phoneNum;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "orderId=" + orderId +
                ", price=" + price +
                ", comment='" + comment + '\'' +
                ", date=" + date +
                ", receiver='" + receiver + '\'' +
                ", address='" + address + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                '}';
    }
}
