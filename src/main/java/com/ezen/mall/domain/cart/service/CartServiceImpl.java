package com.ezen.mall.domain.cart.service;

import com.ezen.mall.domain.cart.dao.CartDao;
import com.ezen.mall.domain.cart.dao.JdbcCartDao;
import com.ezen.mall.domain.mall.dto.Product;
import java.sql.SQLException;

public class CartServiceImpl implements  CartService{
    private CartDao dao = new JdbcCartDao();
    @Override
    public Product getProduct(int productId) {
        Product product = null;
        try {
            product = dao.findProductById(productId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return product;
    }

}
