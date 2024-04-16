package com.ezen.mall.domain.cart.service;

import com.ezen.mall.web.product.dto.Product;

import java.util.ArrayList;
import java.util.List;

/**
 * AccountService 와 유사한 기능
 */
public class ShoppingCart {
    private List<Product> products;

    public ShoppingCart() {
        products = new ArrayList<>();
    }
    // 카트에 상품 담기
    public void addProduct(Product product) {
        products.add(product);
    }
    // 카트에 모든 목록 반환
    public List<Product> listAll(){
        return products;
    }
    // 아이템 삭제
    public Product removeProduct(int productId) {
        for (int i = 0; i<products.size(); i++) {
            if(products.get(i).getProductId() == productId){
                return products.remove(i);
            }
        }
        return null;
    }
    // 모든 아이템 삭제
    public void removeAll() {
        products.clear();
    }
    //총 상품개수
    public int updateTotalProductCount(){
        int totalcount = 0;
        for (Product product : products) {
            totalcount += product.getStock() + product.getProductId();
        }
        return totalcount;
    }
    public int calculateTotalPrice() {
        int totalPrice = 0;
        for (Product product : products) {
            totalPrice += product.getPrice() * product.getStock();
        }
        return totalPrice;
    }
}
