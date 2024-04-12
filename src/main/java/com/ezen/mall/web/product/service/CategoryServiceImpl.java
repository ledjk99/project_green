package com.ezen.mall.web.product.service;

import com.ezen.mall.web.product.dao.JdbcProductDao;
import com.ezen.mall.web.product.dao.ProductDao;
import com.ezen.mall.web.product.dto.Category;
import com.ezen.mall.web.product.dto.File;
import com.ezen.mall.web.product.dto.OrderInfo;
import com.ezen.mall.web.product.dto.Product;

import java.sql.SQLException;
import java.util.List;

public class CategoryServiceImpl implements CategoryService{

    ProductDao productDao = new JdbcProductDao();

    @Override
    public List<Product> listAll() {
        try {
            return productDao.listAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Category> categoryList() {
        try {
            return productDao.findByCategoryAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> productList(int categoryId) {
        try {
            return productDao.findbyProductAll(categoryId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product getReadCategory(int categoryId) {
        Product product = null;
        try {
            product = productDao.readCategory(categoryId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public Product getReadProduct(int categoryId, int productId) {
        Product product = null;

        try {
            product = productDao.readProduct(categoryId,productId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public List<File> getfile() {
        try {
            return productDao.getFile();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void createOrderInfo(OrderInfo orderInfo) {
        try {
            productDao.createOrderInfo(orderInfo);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
