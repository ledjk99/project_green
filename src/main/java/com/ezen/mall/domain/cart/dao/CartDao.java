package com.ezen.mall.domain.cart.dao;


import com.ezen.mall.domain.mall.dto.Product;

import java.sql.SQLException;

public interface CartDao {

    public Product findProductById(int productId) throws SQLException;
}
