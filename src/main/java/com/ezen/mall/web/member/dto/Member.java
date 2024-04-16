package com.ezen.mall.web.member.dto;

/**
 * 회원 관련 정보 저장
 */
public class Member {
    private String id;
    private String passwd;
    private String name;
    private String email;
    private String regdate;
    private String phone;

    public Member(){}

    public Member(String id, String passwd, String name, String email) {
        this(id, passwd, name, email, null, null);
    }

    public Member(String id, String passwd, String name, String email, String regdate, String phone) {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
        this.email = email;
        this.regdate = regdate;
        this.phone = phone;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Member{" +
                "id='" + id + '\'' +
                ", passwd='" + passwd + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", regdate='" + regdate + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
