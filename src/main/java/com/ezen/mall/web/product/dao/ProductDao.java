package com.ezen.mall.web.product.dao;

import com.ezen.mall.web.product.dto.Category;
import com.ezen.mall.web.product.dto.File;
import com.ezen.mall.web.product.dto.OrderInfo;
import com.ezen.mall.web.product.dto.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductDao {

    public List<Product> listAll() throws SQLException;
    public List<Category> findByCategoryAll() throws SQLException;

    public List<Product> findbyProductAll(int categoryId) throws SQLException;

    public Product readProduct(int categoryId,int productId) throws SQLException;

    public Product readCategory(int categoryId) throws SQLException;

    public List<File> getFile() throws SQLException;

    public void createOrderInfo(OrderInfo orderInfo) throws Exception;
}
