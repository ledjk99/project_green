<%@ page import="com.ezen.mall.web.product.dto.Product" %>
<%@ page import="com.ezen.mall.domain.cart.service.ShoppingCart" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryService" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryServiceImpl" %>
<%@ page import="com.ezen.mall.web.product.dto.File" %>
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
             CategoryService categoryService = new CategoryServiceImpl();
             List<File> file = categoryService.getfile();
             request.setAttribute("file",file);
             ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
             List<Product> productList = cart.listAll();
             request.setAttribute("list", productList);
         %>
        <!DOCTYPE html>
        <html lang="ko">
        <head>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
            <meta name="description" content=""/>
            <meta name="author" content=""/>
            <title>Green Health</title>
            <link href="/css/styles.css" rel="stylesheet"/>
            <link href="/css/cart.css" rel="stylesheet"/>
            <script src="../js2/1.js" defer></script>
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
                                    <td>
                                    <c:forEach var="file" items="${file}" varStatus="loop">
                                        <c:if test="${file.productId == product.productId}">
                                            <img src="/img/${file.name}" style="width: 60%"/>
                                        </c:if>
                                    </c:forEach>
                                    </td>
                                    <td>
                                        <p>${product.name}</p>
                                        <span class="price" id="price_${loop.index}">${product.price}원</span>
                                    </td>
                                    <td class="cart__list__option">
                                        <input type="number" style="text-align: right; width: 43px; margin-bottom: 5px;"
                                               min="1"
                                               max="99" step="1" value="${product.stock}" id="quantity_${loop.index}"
                                               onchange="updatePrice(${loop.index})">

                                    </td>
                                    <td>
                                        <span class="price"
                                              id="total_${loop.index}">${product.price * product.stock}원</span><br>
                                        <form action="../product/pay.jsp" method="post">
                                            <input type="hidden" name="productId" value="${product.productId}">
                                            <input type="hidden" name="productPrice" value="${product.price}">
                                            <input type="hidden" name="productName" value="${product.name}">
                                            <button class="cart__list__orderbtn" type="submit">주문하기</button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="/cart/removeCart.jsp" method="post">
                                            <input type="hidden" name="pid" value="${product.productId}">
                                            <button class="defaultcmd" style="border-radius: 3px; size:10px;" type="submit">
                                                삭제
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <tr>
                                    <form id="babo" action="/product/pay.jsp">
                                        <input type="hidden" name="productId" value="${product.productId}">
                                        <input type="hidden" name="productPrice" value="${product.price}">
                                        <input type="hidden" name="productName" value="${product.name}">
                                    </form>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><strong class="bb_price" id="total_price"> 총 금액: <em><span><c:out
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
                        <button class="cart__bigorderbtn left" id="orderBtn">주문하기</button>
                    </div>
                </section>
            </div>
        </section>
        <!-- section end -->
        <jsp:include page="/module/footer.jsp"/>
        <script>
        function removeallCart() {
        let confirmation = confirm("정말로 모든 상품을 삭제하시겠습니까?");
        if (confirmation) {
        window.location.href = "/cart/removeallCart.jsp";
        }
        }

        const orderBtn = document.querySelector("#orderBtn");
        orderBtn.addEventListener("click", event => {
            document.querySelector("#babo").submit();
        });
        </script>
        </body>
        </html>
    </c:otherwise>
</c:choose>





