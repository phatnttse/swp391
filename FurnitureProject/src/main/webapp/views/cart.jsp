<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/breadCrumb.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <title>Giỏ Hàng</title>
    </head>
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>
        <div>
            <c:set var="cart" value="${sessionScope.CART}"/>
            <c:if test="${cart != null}">
                <center>
                    <table border="1" id="cartTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>thumbnail</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Plus</th>
                                <th>Minus</th>
                                <th>Thành tiền</th>
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
                                        <img src="${product.thumbnail}" width="100px" height="60px" alt="alt"/>
                                    </td>
                                    <td id="quantity_${product.productId}">
                                        ${product.quantity}
                                    </td>
                                    <td id="price_${product.productId}">
                                        ${product.price/10000}
                                    </td>                              
                                    <td>
                                        <button type="button" title="" onclick="addProductQuantity('${product.userId}', ${product.productId})">+</button>
                                    </td>
                                    <td>
                                        <button type="button" title="" onclick="reduceProductQuantity('${product.userId}', ${product.productId})">-</button>
                                    </td>
                                    <td id="thanh-tien_${product.productId}">
                                        ${product.price/10000 * product.quantity}
                                    </td>
                                    <td>
                                        <button type="button" onclick="">Xoá</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td id="total">
                                    ${total}
                                </td>
                            </tr>                           
                        </tbody>
                    </table>
                </center>
                <div>
                <a href="orders">Thanh Toán</a>
                   

                </div>
            </c:if>
            <c:if test="${empty cart}">
                <div>
                    <center>
                        <h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3>
                    </center>
                </div>
            </c:if>
        </div>
        <%@include file="../UIcomponents/footer.jsp" %>

        <script>
            $(document).ready(function () {
                updateTotalPrice();
            });
            function updateTotalPrice() {
                $.ajax({
                    url: "/FurnitureProject/updateTotalPrice",
                    type: "post",
                    success: function (response) {
                        // Cập nhật tổng tiền trên giao diện người dùng
                        $("#total").text(response);
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu cần
                        alert("Đã xảy ra lỗi khi cập nhật tổng tiền.");
                    }
                });
            }

            function addProductQuantity(userId, productId) {
                $.ajax({
                    url: "/FurnitureProject/productQuantity",
                    type: "post",
                    data: {
                        userId: userId,
                        productId: productId
                    },
                    success: function (response) {
                        if (response === "success") {
                            var quantityElement = $("#quantity_" + productId);
                            var priceElement = $("#price_" + productId);
                            var thanhtien = $("#thanh-tien_" + productId);
                            var currentQuantity = parseInt(quantityElement.text());
                            var currentPrice = parseFloat(priceElement.text());
                            quantityElement.text(currentQuantity + 1);
                            thanhtien.text(currentPrice * (currentQuantity + 1));
                            updateTotalPrice();
                        } else {
                            alert("Không thể thêm sản phẩm vào giỏ hàng.");
                        }
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu cần
                        alert("Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng.");
                    }
                });
            }

            function reduceProductQuantity(userId, productId) {
                $.ajax({
                    url: "/FurnitureProject/productQuantity",
                    type: "get",
                    data: {
                        userId: userId,
                        productId: productId
                    },
                    success: function (response) {
                        if (response === "success") {
                            var quantityElement = $("#quantity_" + productId);
                            var priceElement = $("#price_" + productId);
                            var thanhtien = $("#thanh-tien_" + productId);
                            var currentQuantity = parseInt(quantityElement.text());
                            var currentPrice = parseFloat(priceElement.text());
                            if (currentQuantity > 0) {
                                quantityElement.text(currentQuantity - 1);
                                thanhtien.text(currentPrice * (currentQuantity - 1));
                                updateTotalPrice();
                                if (currentQuantity - 1 === 0) {
                                    $("#productRow_" + productId).remove(); // Xoá hàng nếu số lượng = 0
                                }
                            }
                        } else {
                            alert("Không thể giảm số lượng sản phẩm.");
                        }
                    },
                    error: function (xhr) {
                        // Xử lý lỗi nếu cần
                        alert("Đã xảy ra lỗi khi giảm số lượng sản phẩm.");
                    }
                });
            }

        </script>
    </body>
</html>
