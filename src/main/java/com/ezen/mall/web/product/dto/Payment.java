package com.ezen.mall.web.product.dto;

import java.util.Date;

public class Payment {
    private int paymentId;
    private Date regdate;
    private String memberId;
    private int orderId;

    public Payment() {}

    public Payment(int paymentId, Date regdate, String memberId, int orderId) {
        this.paymentId = paymentId;
        this.regdate = regdate;
        this.memberId = memberId;
        this.orderId = orderId;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "paymentId=" + paymentId +
                ", regdate=" + regdate +
                ", memberId='" + memberId + '\'' +
                ", orderId=" + orderId +
                '}';
    }
}
