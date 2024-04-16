<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.web.product.dao.OrderDao" %>
<%@ page import="com.ezen.mall.web.product.dao.JdbcOrderDao" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // 주문 ID 파라미터 가져오기
    String order_id_param = request.getParameter("orderId");
    // 주문 ID 확인
    int order_id = (order_id_param != null && !order_id_param.isEmpty()) ? Integer.parseInt(order_id_param) : -1;

    // 주문 ID가 유효한 경우
    if (order_id != -1) {
        OrderDao orderDao = new JdbcOrderDao();
        List<HashMap<String, Object>> shippingList = orderDao.findByShippinglist(order_id);// 수취인 정보 가져오기
        List<HashMap<String, Object>> orderProductList = orderDao.findByOrderProductList(order_id); // 주문 상품 목록 가져오기

        // 총금액 DB업데이트하기
        orderDao.updateOrderPrice(order_id);
        // 총 주문금액 가져오기
        int totalOrderPrice = orderDao.getTotalOrderPrice(order_id);

        request.setAttribute("Shippinglist", shippingList); // 결제 목록(수취인정보) 설정
        request.setAttribute("OrderProductList", orderProductList); // 주문 상품 목록 속성으로 설정
        request.setAttribute("TotalOrderPrice", totalOrderPrice); // 총결제금액
    } else {  // 주문 ID가 없을 경우
%>
<script>
    // 알림 표시 후 페이지 이동
    alert("요청하신 주문서를 찾을 수 없습니다. 다시 확인하여 주십시요.");
    window.location.href = '/product/pay.jsp';
</script>
<%
    }
%>


<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/notice.css" rel="stylesheet"/>
    <link href="/css/qnalist.css" rel="stylesheet"/>
    <link href="/css/reviewlist.css" rel="stylesheet"/>
    <link href="/css/cart.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet"
          href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <style>
        #address {
            width: 50%;

        }

        #memo {
            width: 50%;

        }

        #paybutton {
            width: 100%;
        }

        #card {
            width: 200px;
        }

        .receiver-input {
            width: 30%;
        }

        .receiver-info .receiver-select {
            width: 50%;
        }

        .orderPoductTable {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .orderPoductTable th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        /*#f2f2f2*/
        .orderPoductTable th {
            background-color: #ffffff;
        / /
        }

        .orderPoductTable tr:nth-child(even) {
            background-color: #ffffff;
        }

        .price_info {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
        }

        .product-image-cell {
            max-width: 100px; /* 이미지 셀의 최대 너비 설정 */
            max-height: 150px; /* 이미지 셀의 최대 높이 설정 */
            overflow: hidden; /* 넘치는 부분을 잘라내기 위해 overflow 속성 설정 */
        }

        .product-image {
            max-width: 100%; /* 이미지의 최대 너비를 부모 요소에 맞추기 */
            height: auto; /* 가로 비율을 유지하면서 이미지의 높이 자동 조정 */
        }


    </style>


</head>


<body>
<!-- nav start -->
<jsp:include page="/module/nav.jsp"/>
<!-- nav end -->
<!-- header start -->
<jsp:include page="/module/header.jsp"/>
<!-- header end -->
<!-- section start -->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">

        <h2>주문정보</h2>

        <%-- 배송지 정보 출력 부분 --%>
        <%
            for (HashMap<String, Object> shippingInfo : (List<HashMap<String, Object>>) request.getAttribute("Shippinglist")) {
        %>

        <div class="detail_section">
            <div class="info_area">
                <div class="info_head">
                    <h3 class="h3">배송지정보</h3>
                </div>
                <div class="info_cont">
                    <ul class="info_list person_info delivery receiver-info">
                        <li><strong>결제완료</strong>
                            <div><%= shippingInfo.get("payment_regdate") %>
                            </div>
                        </li>
                        <li><strong>수령인</strong>
                            <div><%= shippingInfo.get("order_receiver") %>
                            </div>
                        </li>
                        <li><strong>연락처</strong>
                            <div><%= shippingInfo.get("order_phone") %>
                            </div>
                        </li>
                        <li><strong>배송지</strong>
                            <div><%= shippingInfo.get("order_address") %>
                            </div>
                        </li>
                        <li><strong>배송 메시지</strong>
                            <div><%= shippingInfo.get("order_comment") %>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <% } // for shippingInfo %>


        <%-- 주문 상품 목록 출력 부분 --%>
        <div class="detail_section">
            <div class="info_area">
                <div class="info_head">
                    <h3 class="h3">주문상품목록</h3>
                </div>
                <div class="info_cont">
                    <table class="orderPoductTable">
                        <thead>
                        <tr>
                            <th scope="col">이미지</th>
                            <th scope="col">상품번호</th>
                            <th scope="col">상품명</th>
                            <th scope="col">주문수량</th>
                            <th scope="col">상품가</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- 주문 상품 정보 출력 --%>

                        <%
                            for (HashMap<String, Object> orderProductInfo : (List<HashMap<String, Object>>) request.getAttribute("OrderProductList")) {
                        %>

                        <tr>
                            <td class="product-image-cell">
                                <img src="/img/<%= orderProductInfo.get("file_name") %>" class="product-image">
                            </td>
                            <td><%= orderProductInfo.get("product_id") %>
                            </td>
                            <td><%= orderProductInfo.get("product_name") %>
                            </td>
                            <td><%= orderProductInfo.get("order_quantity") %>
                            </td>
                            <td class="product_price"><%= orderProductInfo.get("product_price") %>
                            </td>

                        </tr>
                        <% } // for orderProductInfo %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


        <div class="detail_section">
            <div class="info_area">
                <div class="info_head">

                    <%
                        // 총 결제금액 가져오기
                        int totalOrderPrice = (int) request.getAttribute("TotalOrderPrice");
                    %>
                    <h3 class="h3">총 결제금액</h3>
                    <strong id="totalOrderPrice" class="detail_order_price" style="color: black;"><span><%= totalOrderPrice %></span>원</strong>
                </div>


                <div class="info_cont">


                    <ul class="info_list person_info delivery receiver-info">
                        <li>
                            <div class="total">
                                <strong>상품총액</strong>
                                <%-- 콤마 추가를 위한 JavaScript 코드 --%>
                                <em class="amount"><span id="productPrice"><%= totalOrderPrice %></span>원</em>
                            </div>

                        </li>
                        <li>
                            <div class="total">
                                <strong>배송비</strong>
                                <em class="amount">+<span>0</span>원</em>
                            </div>
                        </li>
                        <li>
                            <div class="total">
                                <strong>쿠폰할인</strong>
                                <em class="amount"><span>0</span>원</em>
                            </div>
                            <ul class="inner_list">

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <%-- 하단 안내 --%>
        <div class="detail_section type_payment_info">
            <div class="info_area">
                <div class="info_head">
                    <h3 class="h3">배송 안내</h3>
                </div>
                <div class="info_cont">
                    <ul class="info_list">

                        <li class="type_main_payment">
                            <ul class="dot_list type_round">
                                <li>고객님, 구매 감사드립니다.</li>
                                <li>영업일 기준 3일내 배송이 시작됩니다.</li>
                                <li>문의는 Q&A 게시판을 이용해주십시요.</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="bottom_button_area">
            <button type="button" class="btn btn-outline-dark" id="paybutton"
                    onclick="location.href='/'">홈으로 이동
            </button>
        </div>
        <br>
        <br><Br>

    </div>
</section>
<!-- section end -->


<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
<%--금액 1000단위 콤마찍는 js삽입--%>
<script type="text/javascript" src="/js/price-comma.js"></script>

</body>
</html>