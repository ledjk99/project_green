package com.ezen.mall.web.product.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.product.dto.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class JdbcProductDao implements ProductDao {
    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();

    @Override
    public List<Product> listAll() throws SQLException {
        List<Product> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT PRODUCT_ID,PRICE,NAME,INFORMATION,STOCK,REGDATE,SELL_QUANTITY,CATEGORY_ID")
                .append(" FROM PRODUCTS");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setCategoryId(rs.getInt("CATEGORY_ID"));
                product.setProductId(rs.getInt("PRODUCT_ID"));
                product.setName(rs.getString("NAME"));
                product.setPrice(rs.getInt("PRICE"));
                product.setInformation(rs.getString("INFORMATION"));
                product.setStock(rs.getInt("STOCK"));
                product.setRegdate(rs.getDate("REGDATE"));
                product.setQuantity(rs.getInt("SELL_QUANTITY"));

                list.add(product);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public List<Category> findByCategoryAll() throws SQLException {
        List<Category> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT CATEGORY_ID,CATEGORY_NAME")
                .append(" FROM CATEGORYS");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("CATEGORY_ID"));
                category.setCategoryName(rs.getString("CATEGORY_NAME"));
                list.add(category);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public List<Product> findbyProductAll(int categoryId) throws SQLException {
        List<Product> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT PRODUCT_ID,PRICE,NAME,INFORMATION,STOCK,REGDATE,SELL_QUANTITY,CATEGORY_ID ")
                .append("       FROM PRODUCTS")
                .append("       WHERE CATEGORY_ID = ?");


        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, categoryId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();

                product.setCategoryId(rs.getInt("CATEGORY_ID"));
                product.setProductId(rs.getInt("PRODUCT_ID"));
                product.setName(rs.getString("NAME"));
                product.setPrice(rs.getInt("PRICE"));
                product.setInformation(rs.getString("INFORMATION"));
                product.setStock(rs.getInt("STOCK"));
                product.setRegdate(rs.getDate("REGDATE"));
                product.setQuantity(rs.getInt("SELL_QUANTITY"));

                list.add(product);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public Product readCategory(int categoryId) throws SQLException {
        Product product = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT CATEGORY_ID,PRODUCT_ID,NAME,PRICE,INFORMATION,STOCK,REGDATE,SELL_QUANTITY")
                .append(" FROM PRODUCTS")
                .append(" WHERE CATEGORY_ID=?");

        Connection con = connectionFactory.getConnection();

        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1,categoryId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                product = new Product();

                product.setCategoryId(rs.getInt("CATEGORY_ID"));
                product.setProductId(rs.getInt("PRODUCT_ID"));
                product.setName(rs.getString("NAME"));
                product.setPrice(rs.getInt("PRICE"));
                product.setInformation(rs.getString("INFORMATION"));
                product.setStock(rs.getInt("STOCK"));
                product.setRegdate(rs.getDate("REGDATE"));
                product.setQuantity(rs.getInt("SELL_QUANTITY"));


            }

        }finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return product;
    }

    @Override
    public Product readProduct(int categoryId, int productId) throws SQLException {
        Product product = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT CATEGORY_ID,PRODUCT_ID,NAME,PRICE,INFORMATION,STOCK,REGDATE,SELL_QUANTITY")
                .append(" FROM PRODUCTS")
                .append(" WHERE CATEGORY_ID=? AND PRODUCT_ID=?");

        Connection con = connectionFactory.getConnection();

        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1,categoryId);
            pstmt.setInt(2,productId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                product = new Product();

                product.setCategoryId(rs.getInt("CATEGORY_ID"));
                product.setProductId(rs.getInt("PRODUCT_ID"));
                product.setName(rs.getString("NAME"));
                product.setPrice(rs.getInt("PRICE"));
                product.setInformation(rs.getString("INFORMATION"));
                product.setStock(rs.getInt("STOCK"));
                product.setRegdate(rs.getDate("REGDATE"));
                product.setQuantity(rs.getInt("SELL_QUANTITY"));


            }

        }finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return product;
    }

    @Override
    public List<File> getFile() throws SQLException {
        List<File> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT FILE_ID, NAME, REGDATE, ARTICLE_ID, PRODUCT_ID")
                .append(" FROM FILES");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                File file = new File();
                file.setFileId(rs.getInt("FILE_ID"));
                file.setName(rs.getString("NAME"));
                file.setArticleId(rs.getInt("ARTICLE_ID"));
                file.setProductId(rs.getInt("PRODUCT_ID"));
                list.add(file);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    @Override
    public void createOrderInfo(OrderInfo orderInfo) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO ORDERS (ORDER_ID, PRICE, ORDER_COMMENT, REGDATE, RECEIVER, ADDRESS, PHONE)")
                .append(" VALUES (ORDER_ID_SEQ.NEXTVAL, ?, ?, TO_DATE(SYSDATE, 'YYYY-MM-DD'), ?, ?, ?)");

        Connection con = connectionFactory.getConnection();

        PreparedStatement pstmt = null;

        try {
            pstmt = con.prepareStatement(sql.toString());

            pstmt.setInt(1,orderInfo.getPrice());
            pstmt.setString(2,orderInfo.getComment());
            pstmt.setString(3,orderInfo.getReceiver());
            pstmt.setString(4,orderInfo.getAddress());
            pstmt.setString(5,orderInfo.getPhoneNum());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
