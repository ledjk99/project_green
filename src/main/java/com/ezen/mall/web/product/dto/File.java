package com.ezen.mall.web.product.dto;

import java.util.Date;

public class File {
    private int fileId;
    private String name;
    private Date date;
    private int articleId;
    private int productId;

    public File() {}

    public File(int fileId, String name, Date date, int articleId, int productId) {
        this.fileId = fileId;
        this.name = name;
        this.date = date;
        this.articleId = articleId;
        this.productId = productId;
    }

    public int getFileId() {
        return fileId;
    }

    public void setFileId(int fileId) {
        this.fileId = fileId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getArticleId() {
        return articleId;
    }

    public void setArticleId(int articleId) {
        this.articleId = articleId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "File{" +
                "fileId=" + fileId +
                ", name='" + name + '\'' +
                ", date=" + date +
                ", articleId=" + articleId +
                ", productId=" + productId +
                '}';
    }
}
