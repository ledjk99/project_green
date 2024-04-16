package com.ezen.mall.domain.cart.dao;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.product.dto.Product;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcCartDao implements  CartDao{
    private ConnectionFactory connectionFactory = ConnectionFactory.getInstance();
    @Override
    public Product findProductById(int productId) throws SQLException {
        Product product = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT CATEGORY_ID, PRODUCT_ID, NAME, PRICE, INFORMATION, STOCK, TO_CHAR(REGDATE, 'YYYY-MM-DD') regdate, SELL_QUANTITY")
           .append(" FROM PRODUCTS")
           .append(" WHERE PRODUCT_ID = ?");
        Connection con = connectionFactory.getConnection();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1,productId);
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
}
