package com.ezen.mall.domain.cart.service;

import com.ezen.mall.domain.mall.dto.Product;

/**
 * 카트 관련 비즈니스 메서드 선언
 */
public interface CartService {

    // 상품 상세
    public Product  getProduct(int productId);


}
