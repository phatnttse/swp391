<%-- 
    Document   : cart
    Created on : Jan 2, 2024, 4:33:36 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/breadCrumb.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <title>Cart Page</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>
        <div>
            <c:set var="cart" value="${sessionScope.CART}"/>
            <c:if test="${cart != null}">   
                <table border="1" id="cartTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>thumbnail</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${cart}">
                            <c:set var="total" value="${total + product.price/10000 * product.quantity}" />
                            <tr id="productRow_${product.productId}">
                                <td>
                                    ${product.productId}
                                </td>
                                <td>
                                    ${product.title}
                                </td>
                                <td>
                                    <img src=" ${product.thumbnail}" width="100px" height="60px" alt="alt"/>
                                </td>
                                <td>
                                    ${product.quantity}
                                </td>
                                <td>
                                    ${product.price/10000}đ
                                </td>
                                <td>
                                    <button onclick="removeProductFromCart('${product.userId}', ${product.productId})">Xoá</button>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="6">
                                ${total}đ
                            </td>
                        </tr>

                    </tbody>
                </table>


            </c:if>
            <c:if test="${cart == null}">
                <div>
                    <center>
                        <h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3>
                    </center>

                </div>
            </c:if>



        </div>

        <script>
            $(document).ready(function () {
                checkCart();
            });
            function removeProductFromCart(userId, productId) {
                $.ajax({
                    url: "/FurnitureProject/removeProductFromCart",
                    type: "post",
                    data: {
                        userId: userId,
                        productId: productId
                    },
                    success: function (response) {
                        $("#productRow_" + productId).remove();
                        checkCart();
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu cần
                    }
                });
            }
            function checkCart() {
                // Kiểm tra số lượng sản phẩm trong giỏ hàng
                if ($("#cartTable tbody tr").length === 0) {
                    // Nếu giỏ hàng trống, ẩn bảng
                    $("#cartTable").hide();
                } else {
                    // Nếu có sản phẩm trong giỏ hàng, hiển thị bảng
                    $("#cartTable").show();
                }
            }

        </script>

    </body>
</html>
