    function removeallCart() {
    // Confirm with the user before removing all products
    let confirmation = confirm("정말로 모든 상품을 삭제하시겠습니까?");
    if (confirmation) {
    // Redirect to a servlet or JSP page to handle removing all products
    window.location.href = "/cart/removeallCart.jsp";
}
}
