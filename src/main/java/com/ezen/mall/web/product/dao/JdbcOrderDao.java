package com.ezen.mall.web.product.dao;

import java.util.*;

import com.ezen.mall.domain.common.database.ConnectionFactory;
import com.ezen.mall.web.product.dto.Order;
import com.ezen.mall.web.product.dto.Pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

public class JdbcOrderDao implements OrderDao {


    private ConnectionFactory connectionFactory;

    public JdbcOrderDao() {
        connectionFactory = ConnectionFactory.getInstance();
    }

    // 주문 테이블에 주문정보 입력
    public void create(Order order) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO ORDERS (order_id, price, order_comment, regdate, receiver, address, phone)").append(" VALUES (ORDER_ID_SEQ.NEXTVAL, ?, ?, TO_DATE(sysdate, 'YYYY-MM-DD HH24:mi:SS') as regdate, ?, ?, ?)");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, order.getPrice());
            pstmt.setString(2, order.getOrder_comment());
            pstmt.setString(3, order.getReceiver());
            pstmt.setString(4, order.getAddress());
            pstmt.setString(5, order.getPhone());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    // 주문번호를 전달 받아 상세 정보를 반환
    public Order findByOrderId(int order_id) throws SQLException {
        Order order = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT order_id, price, order_comment, TO_CHAR(regdate,'yyyy-MM-DD HH24:MI:SS') regdate, receiver, address, phone")
                .append(" FROM orders")
                .append(" WHERE order_id = ?");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, order_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                order = new Order();
                order.setOrder_id(rs.getInt("order_id"));
                order.setPrice(rs.getInt("price"));
                order.setOrder_comment(rs.getString("order_comment"));
                order.setRegdate(rs.getString("regdate"));
                order.setReceiver(rs.getString("receivere"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));

            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return order;
    }

    // 결제 테이블에 결제정보 입력
    public void createPayment(Pay pay) throws Exception {
        StringBuilder sql = new StringBuilder();
        sql.append(" INSERT INTO PAYMENTS (payment_id, regdate, member_id, order_id)")
                .append(" VALUES (PAYMENT_ID_SEQ.NEXTVAL, TO_DATE(sysdate, 'YYYY-MM-DD HH24:mi:SS') as regdate, ?, ?)");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, pay.getMember_id());
            pstmt.setInt(2, pay.getOrder_id());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }


    // 결제번호를 전달 받아 상세 정보를 반환
    @Override
    public Pay findByPaymentId(int payment_id) throws SQLException {
        Pay pay = null;
        StringBuilder sql = new StringBuilder();
        sql.append(" SELECT payment_id, regdate, member_id, order_id")
                .append(" FROM payments")
                .append(" WHERE payment_id = ?");
        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, payment_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                pay = new Pay();
                pay.setPayment_id(rs.getInt("pament_id"));
                pay.setRegdate(rs.getString("regdate"));
                pay.setMember_id(rs.getString("member_id"));
                pay.setOrder_id(rs.getInt("order_id"));

            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return pay;
    }


// 결제정보+주문정보 합친 주문리스트 불러오기 [해시맵원본]

    public List<HashMap<String, Object>> findByOrderlist() throws SQLException {
        List<HashMap<String, Object>> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT o.order_id order_id, o.price order_price , o.order_comment order_comment, TO_CHAR(o.regdate,'yyyy-MM-DD HH24:MI:SS') order_regdate, o.receiver order_receiver, o.address order_address, o.phone order_phone, p.payment_id payment_id, TO_CHAR(p.regdate,'yyyy-MM-DD HH24:MI:SS') payment_regdate, p.member_id member_id")
                .append(" FROM orders o ")
                .append(" JOIN payments p ON o.order_id = p.order_id");

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HashMap<String, Object> row = new HashMap<>();
                row.put("order_id", rs.getInt("order_id"));
                row.put("order_price", rs.getInt("order_price"));
                row.put("order_comment", rs.getString("order_comment"));
                row.put("order_regdate", rs.getString("order_regdate"));
                row.put("order_receiver", rs.getString("order_receiver"));
                row.put("order_address", rs.getString("order_address"));
                row.put("order_phone", rs.getString("order_phone"));
                row.put("payment_id", rs.getInt("payment_id"));
                row.put("payment_regdate", rs.getString("payment_regdate"));
                row.put("member_id", rs.getString("member_id"));
                list.add(row);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }


    // 결제 + 주문 2개 테이블 합쳐서 총 결제정보(수취인정보) 불러오기
    public List<HashMap<String, Object>> findByShippinglist() throws SQLException {

        List<HashMap<String, Object>> shippingList = new ArrayList<>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT y.payment_id payment_id,")
                .append(" TO_CHAR(y.regdate, 'yyyy-MM-DD HH24:MI:SS') payment_regdate,")
                .append("    o.order_id order_id,")
                .append("    o.price order_price,")
                .append("    o.receiver order_receiver,")
                .append("    o.address order_address,")
                .append("    o.phone order_phone,")
                .append("     o.order_comment order_comment,")
                .append(" FROM payments y")
                .append(" JOIN orders o ON y.order_id = o.order_id");


        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HashMap<String, Object> ShippingList = new HashMap<>();
                ShippingList.put("payment_id", rs.getInt("payment_id"));
                ShippingList.put("payment_regdate", rs.getString("payment_regdate"));
                ShippingList.put("order_id", rs.getInt("order_id"));
                ShippingList.put("order_price", rs.getInt("order_price"));
                ShippingList.put("order_receiver", rs.getString("order_receiver"));
                ShippingList.put("order_address", rs.getString("order_address"));
                ShippingList.put("order_phone", rs.getString("order_phone"));
                ShippingList.put("order_comment", rs.getString("order_comment"));
                shippingList.add(ShippingList);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return shippingList;
    }


    @Override
    // order_id로 결제정보(수취인정보) 불러오기
    public List<HashMap<String, Object>> findByShippinglist(int order_id) throws SQLException {

        List<HashMap<String, Object>> shippingList = new ArrayList<>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT y.payment_id payment_id,")
                .append(" TO_CHAR(y.regdate, 'yyyy-MM-DD HH24:MI:SS') payment_regdate,")
                .append("    o.order_id order_id,")
                .append("    o.price order_price,")
                .append("    o.receiver order_receiver,")
                .append("    o.address order_address,")
                .append("    o.phone order_phone,")
                .append("    o.order_comment order_comment")
                .append(" FROM payments y")
                .append(" JOIN orders o ON y.order_id = o.order_id")
                .append(" WHERE o.order_id = ?"); // 추가: 주문 ID로 필터링

        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, order_id); // 주문 ID 설정
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HashMap<String, Object> shippingInfo = new HashMap<>();
                shippingInfo.put("payment_id", rs.getInt("payment_id"));
                shippingInfo.put("payment_regdate", rs.getString("payment_regdate"));
                shippingInfo.put("order_id", rs.getInt("order_id"));
                DecimalFormat formatter = new DecimalFormat("#,###");
                shippingInfo.put("order_price", rs.getInt("order_price"));
                shippingInfo.put("order_receiver", rs.getString("order_receiver"));
                shippingInfo.put("order_address", rs.getString("order_address"));
                shippingInfo.put("order_phone", rs.getString("order_phone"));
                shippingInfo.put("order_comment", rs.getString("order_comment"));
                shippingList.add(shippingInfo);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return shippingList;
    }


    // orders(결제금액) + paments(결제날짜,결제금액) +
    // orderitems(상품이미지,상품번호,상품명,수량,상품가) + files의 (파일번호,파일이름) 합친것

    // 주문정보, 주문정보리스트, 상품, 파일 4개 테이블 합쳐서 총 주문상품 리스트 불러오기
    public List<HashMap<String, Object>> findByOrderProductList() throws SQLException {

        List<HashMap<String, Object>> orderProductList = new ArrayList<>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT o.price order_price,")
                .append("    l.orderitem_id orderitem_id,")
                .append("    l.order_quantity order_quantity,")
                .append("    p.product_id product_id,")
                .append("    p.price product_price, ")
                .append("    p.name product_name,")
                .append("    f.file_id file_id,")
                .append("    f.name file_name")
                .append(" FROM orders o")
                .append("       JOIN orderitems l ON o.order_id = l.order_id")
                .append("       JOIN products p ON l.product_id = p.product_id")
                .append("       JOIN files f ON p.product_id = f.product_id");


        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HashMap<String, Object> orderProductInfo = new HashMap<>();
                orderProductInfo.put("order_price", rs.getInt("order_price"));
                orderProductInfo.put("orderitem_id", rs.getInt("orderitem_id"));
                orderProductInfo.put("order_quantity", rs.getInt("order_quantity"));
                orderProductInfo.put("product_id", rs.getInt("product_id"));
                orderProductInfo.put("product_price", rs.getInt("product_price"));
                orderProductInfo.put("product_name", rs.getString("product_name"));
                orderProductInfo.put("file_id", rs.getInt("file_id"));
                orderProductInfo.put("file_name", rs.getString("file_name"));
                orderProductList.add(orderProductInfo);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return orderProductList;
    }


    @Override
    // order_id로 주문상품 리스트 불러오기
    public List<HashMap<String, Object>> findByOrderProductList(int order_id) throws SQLException {

        List<HashMap<String, Object>> orderProductList = new ArrayList<>();

        StringBuilder sql = new StringBuilder();

        sql.append(" SELECT o.price AS order_price,")
                .append("    l.orderitem_id AS orderitem_id,")
                .append("    l.order_quantity AS order_quantity,")
                .append("    p.product_id AS product_id,")
                .append("    p.price AS product_price,")
                .append("    p.name AS product_name,")
                .append("    f.file_id AS file_id,")
                .append("    f.name AS file_name")
                .append(" FROM orders o")
                .append("       JOIN orderitems l ON o.order_id = l.order_id")
                .append("       JOIN products p ON l.product_id = p.product_id")
                .append("       JOIN files f ON p.product_id = f.product_id")
                .append(" WHERE o.order_id = ?"); // 주문 ID로 필터링


        Connection con = connectionFactory.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, order_id); // 주문 ID 설정
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HashMap<String, Object> orderProductInfo = new HashMap<>();
                orderProductInfo.put("order_price", rs.getInt("order_price"));
                orderProductInfo.put("orderitem_id", rs.getInt("orderitem_id"));
                orderProductInfo.put("order_quantity", rs.getInt("order_quantity"));
                orderProductInfo.put("product_id", rs.getInt("product_id"));
                orderProductInfo.put("product_price", rs.getInt("product_price"));
                orderProductInfo.put("product_name", rs.getString("product_name"));
                orderProductInfo.put("file_id", rs.getInt("file_id"));
                orderProductInfo.put("file_name", rs.getString("file_name"));
                orderProductList.add(orderProductInfo);
            }
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return orderProductList;
    }


    //주문 상품 리스트를 가져온 후 총주문금액 계산하여 Orders 테이블의 order_price(총금액) 필드에 업데이트
    @Override
    public void updateOrderPrice(int order_id) throws Exception {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 주문 상품 리스트 가져오기
            List<HashMap<String, Object>> orderProductList = findByOrderProductList(order_id);

            // 총 주문금액 계산
            int totalOrderPrice = 0;
            for (HashMap<String, Object> orderProductInfo : orderProductList) {
                int orderQuantity = (int) orderProductInfo.get("order_quantity");
                int productPrice = (int) orderProductInfo.get("product_price");
                totalOrderPrice += orderQuantity * productPrice;
            }

            // orders 테이블의 price 필드 업데이트
            con = connectionFactory.getConnection();
            String sql = "UPDATE orders SET price = ? WHERE order_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, totalOrderPrice);
            pstmt.setInt(2, order_id);
            pstmt.executeUpdate();

            // 트랜잭션 커밋
            con.commit();
        } catch (Exception e) {
            // 오류 발생 시 롤백
            if (con != null) {
                con.rollback();
            }
            throw new Exception("총금액 입력 중 오류 발생: " + e.getMessage());

        } finally {
            // 리소스 해제
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    //  업데이트된 총금액을 데이터베이스에서 가져오기
    @Override
    public int getTotalOrderPrice(int order_id) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int totalOrderPrice = 0;

        try {
            con = connectionFactory.getConnection();
            String sql = "SELECT price FROM orders WHERE order_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, order_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                totalOrderPrice = rs.getInt("price");
            }
        } finally {
            // 리소스 해제
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return totalOrderPrice;
    }


}



