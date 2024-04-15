package com.ezen.mall.web.product.dto;

public class Pay {
    int payment_id;
    String regdate;
    String member_id;
    int order_id;

    public Pay() {}

    public Pay(int payment_id, String regdate, String member_id, int order_id) {
        this.payment_id = payment_id;
        this.regdate = regdate;
        this.member_id = member_id;
        this.order_id = order_id;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    @Override
    public String toString() {
        return "Pay{" +
                "payment_id=" + payment_id +
                ", regdate='" + regdate + '\'' +
                ", member_id='" + member_id + '\'' +
                ", order_id=" + order_id +
                '}';
    }
}
