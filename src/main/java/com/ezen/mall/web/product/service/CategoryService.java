package com.ezen.mall.web.product.service;

import com.ezen.mall.web.product.dto.Category;
import com.ezen.mall.web.product.dto.File;
import com.ezen.mall.web.product.dto.Product;

import java.util.List;

public interface CategoryService {

    /**
     * 전체 리스트 출력
     */
    public List<Product> listAll();

    /**
     * 게시판 목록
     */
    public List<Category> categoryList();

    /**
     * 선택 카테고리 상품 목록
     */
    public List<Product> productList(int categoryId);

    /**
     * 제품 상세보기
     */
    public Product getReadProduct(int categoryId, int productId);

    /**
     * 카테고리 상세보기
     */
    public Product getReadCategory(int categoryId);

    public List<File> getfile();



}
