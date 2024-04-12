<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryService" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryServiceImpl" %>
<%@ page import="com.ezen.mall.web.product.dto.Product" %>
<%@ page import="com.ezen.mall.web.product.dto.Category" %>

<%
    CategoryService categoryService = new CategoryServiceImpl();
    List<Category> categoryList = categoryService.categoryList();
    request.setAttribute("categorylist",categoryList);
%>

<!-- nav start -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <!-- 로고 -->
        <a class="navbar-brand" href="/"><i class="fa-solid fa-seedling" style="color: #0a7b59;"></i>Green Health</a>
        <!-- 메뉴 start -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- 카테고리 start -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/about.jsp">About</a></li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/">All Products</a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <c:forEach var="category" items="${categorylist}">
                            <li><a class="dropdown-item" href="/product/readcategory.jsp?categoryId=${category.categoryId}">${category.categoryName}</a></li>

                        </c:forEach>

                    </ul>
                </li>
                <!-- 상품 목록 end-->

                <!-- 게시판 목록 start-->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="boardList" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">Board</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/board/notice.jsp">공지사항</a></li>
                        <li><a class="dropdown-item" href="/board/qnalist.jsp">Q&A</a></li>
                        <li><a class="dropdown-item" href="/board/reviewlist.jsp">상품 후기</a></li>
                        <li><a class="dropdown-item" href="/product/addproduct.jsp">상품 등록</a></li>

                    </ul>
                </li>
                <!-- 게시판 목록 end-->

            </ul>
            <!-- 카테고리 end -->


            <!-- 게시판 start -->
            <form class="d-flex">
                <!-- 로그인 start -->
                <c:choose>
                    <c:when test="${empty loginMember}">

                        <button class="btn btn-outline-dark" type="button" onclick="location.href='/member/login.jsp'">
                            <i class="fa-solid fa-right-to-bracket"></i>
                            Login
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-outline-dark" type="button" onclick="">
                            <i class="fa-solid fa-right-to-bracket"></i>
                                ${loginMember.name}님 로그인중
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </c:otherwise>
                </c:choose>
                <!-- 로그인 end -->
                <!-- 카트 start -->
                <button class="btn btn-outline-dark" type="button" onclick="location.href='/product/cart.jsp'">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
                <!-- 카트 end -->

                <!-- 회원가입 start -->
                <%--                        <script src="tap.js" defer/>--%>
                <c:choose>
                    <c:when test="${empty loginMember}">
                        <button id="signup-button" class="btn btn-outline-dark" type="button"
                                onclick="location.href='/member/login.jsp'">
                            <i class="fa-solid fa-user-plus"></i>
                            Sign up
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>

                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-outline-dark" type="button"
                                onclick="location.href='/member/logout-action.jsp'">
                            <i class="fa-solid fa-user-plus"></i>
                            로그아웃
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </c:otherwise>
                </c:choose>
                <!-- 회원가입 end -->
            </form>
            <!-- 게시판 end -->
        </div>
        <!-- 메뉴 end -->
    </div>
</nav>
<!-- nav end -->

