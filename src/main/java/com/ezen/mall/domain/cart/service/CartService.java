package com.ezen.mall.domain.cart.service;

import com.ezen.mall.web.product.dto.Product;
/**
 * 카트 관련 비즈니스 메서드 선언
 */
public interface CartService {
    public Product  getProduct(int productId);


}
