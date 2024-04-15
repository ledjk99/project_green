<%@ page import="com.ezen.mall.domain.mall.dto.Product" %>
<%@ page import="com.ezen.mall.domain.cart.service.ShoppingCart" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${empty sessionScope.cart}">
        <script>
            alert('장바구니에 저장된 상품이 없습니다.');
            history.back();
        </script>
    </c:when>

    <c:otherwise>

         <%
             ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
             List<Product> productList = cart.listAll();
             request.setAttribute("list", productList);
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
            <link href="/css/cart.css" rel="stylesheet"/>
            <script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
        </head>
        <body>
        <jsp:include page="/module/nav.jsp"/>
        <jsp:include page="/module/header.jsp"/>
        <!-- section start -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <section class="cart">
                    <div class="cart__information">
                        <ul>
                            <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                            <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                            <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
                        </ul>
                    </div>
                    <table class="cart__list">
                        <form>
                            <thead>
                            <tr>
                                <td></td>
                                <td colspan="2">상품정보</td>
                                <td>수량</td>
                                <td>합계</td>
                                <td>비고</td>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${list}" var="product" varStatus="loop">
                                <tr class="cart__list__detail">
                                    <td></td>
                                    <td><img src="/img/${product.image}" alt="${product.name}"></td>
                                    <td>
                                        <a href="#">상품 상세보기</a><span class="cart__list__smartstore"></span>
                                        <p>${product.name}</p>
                                        <span class="price" id="price_${loop.index}">${product.price}원</span>
                                    </td>
                                    <td class="cart__list__option">
                                        <input type="number" style="text-align: right; width: 43px; margin-bottom: 5px;"
                                               min="1"
                                               max="99" step="1" value="${product.stock}" id="quantity_${loop.index}"
                                               onchange="updatePrice(${loop.index})">
                                        <button class="default" style="border-radius: 3px; size:10px;"> 변경</button>
                                    </td>
                                    <td>
                                        <span class="price"
                                              id="total_${loop.index}">${product.price * product.stock}원</span><br>
                                        <button class="cart__list__orderbtn"><a href="../product/pay.jsp">주문하기</a>
                                        </button>
                                    </td>
                                    <td>
                                        <button class="defaultcmd" style="border-radius: 3px; size:10px;"
                                                onclick="location.href='/cart/removeCart.jsp?pid=${product.productId}'">삭제
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><strong class="bb_price"> 총 상품갯수: <em><span><c:out
                                        value="${list.size()}"/></span></em>개</strong></td>
                                <td><strong class="bb_price"> 전체합계: <em><span><c:out
                                        value="${cart.calculateTotalPrice()}"/></span></em>원</strong></td>
                                <td>
                                    <button class="cart__list__optionbtn" onclick="removeallCart()">장바구니비우기</button>
                                </td>
                            </tr>
                            </tfoot>
                        </form>
                    </table>
                    <div class="cart__mainbtns">
                        <button class="cart__bigorderbtn left"><a href="../index.jsp">쇼핑 계속하기</a></button>
                        <button class="cart__bigorderbtn right"><a href="../product/pay.jsp">주문하기</a></button>
                    </div>
                </section>
            </div>
        </section>
        <!-- section end -->
        <jsp:include page="/module/footer.jsp"/>


        </body>
        </html>

    </c:otherwise>

</c:choose>





