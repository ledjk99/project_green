package com.ezen.mall.web.product.dao;
import com.ezen.mall.web.product.dto.Order;
import com.ezen.mall.web.product.dto.Pay;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface OrderDao {

    // 주문 생성
    public void create(Order order) throws Exception;

    // 주문번호를 전달 받아 상세 정보를 반환
    public Order findByOrderId(int order_id) throws SQLException;

    // 결제 등록
    public void createPayment(Pay pay) throws Exception;

    // 결제번호를 전달 받아 결제 정보를 반환
    public Pay findByPaymentId(int payment_id) throws SQLException;


    // 결제번호 + 주문번호 테이블 조인 (해쉬맵원본)
    public List<HashMap<String, Object>> findByOrderlist() throws SQLException;

    // 결제 + 주문 테이블 합쳐서 총 결제정보 불러오기
    public List<HashMap<String, Object>> findByShippinglist() throws SQLException;

    // order_id로 결제정보(수취인정보) 불러오기
    public List<HashMap<String, Object>> findByShippinglist(int order_id) throws SQLException;

    // 주문정보, 주문정보리스트, 상품, 파일 테이블 합쳐서 총 주문상품 리스트 불러오기
    public List<HashMap<String, Object>> findByOrderProductList() throws SQLException;

    // order_id로 주문상품 리스트 불러오기
    public List<HashMap<String, Object>> findByOrderProductList(int order_id) throws SQLException;

    //주문 상품 리스트를 가져온 후 총주문금액 계산하여 Orders 테이블의 order_price(총금액) 필드에 업데이트
    public void updateOrderPrice(int order_id) throws SQLException;

    //  업데이트된 총금액을 데이터베이스에서 가져오기
    public int getTotalOrderPrice(int order_id) throws SQLException;
}
