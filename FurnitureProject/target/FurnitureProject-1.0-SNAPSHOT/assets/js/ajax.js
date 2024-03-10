/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function loadProductsByCategory(categoryId) {
    $.ajax({
        type: "POST",
        url: "/FurnitureProject/category",
        data: {categoryId: categoryId},
        success: function (data) {
            // Hiển thị dữ liệu HTML trực tiếp lên trang JSP
            $("#product-list").html(data);
        },
        error: function (error) {
            console.log(error);
        }
    });
}
function addProductToCart(productId, title, thumbnail, price, inputQuantity) {
    if (document.getElementById("quantity-detail") !== null && document.getElementById("quantity-detail") !== undefined) {
        inputQuantity = document.getElementById("quantity-detail").value;
    }
    $.ajax({
        url: "/FurnitureProject/addProductsToCart",
        type: "post",
        data: {
            productId: productId,
            title: title,
            thumbnail: thumbnail,
            price: price,
            quantity: inputQuantity
        },
        success: function (response) {
            // Kiểm tra phản hồi từ server
            if (response.includes("Để thực hiện, bạn cần phải đăng nhập!")) {
                // Nếu phản hồi chứa thông báo đăng nhập, chuyển hướng đến trang đăng nhập
                window.location.href = "/FurnitureProject/loginPage";
                alert("Để thực hiện, bạn cần phải đăng nhập!");
            } else {
                // Nếu không, hiển thị giỏ hàng
                const content = document.getElementById("popup-cart-desktop");
                content.innerHTML = response;
                hideProductModal();
                showCartModal();
                inputQuantity = document.getElementById("quantity-detail").value = 1;
            }
        },
        error: function (xhr) {
            // Xử lý lỗi nếu cần
        }
    });
}

function showCartModal() {
    const popupcart = document.querySelector('.popup-cart');
    const backdrop = document.querySelector('.backdrop__body-backdrop___1rvky');

    // Hiển thị giỏ hàng
    popupcart.classList.add('active');
    backdrop.classList.add('active');
    // Khởi tạo bộ lắng nghe sự kiện cho nút đóng giỏ hàng
    initializeCloseEvent();
}

function initializeCloseEvent() {
    const iconClose = document.querySelector('.js-popup-close');
    if (iconClose) {
        iconClose.addEventListener('click', hideCartModal);
    }
}

function hideCartModal() {
    const popupcart = document.querySelector('.popup-cart');
    const backdrop = document.querySelector('.backdrop__body-backdrop___1rvky');
    popupcart.classList.remove('active');
    backdrop.classList.remove('active');
}

function viewFastProduct(productId) {
    $.ajax({
        url: "/FurnitureProject/ViewPopupProductController",
        type: "POST",
        data: {
            productId: productId
        },
        success: function (response) {
            // Hiển thị nội dung sản phẩm
            const content = document.getElementById("quick-view-product");
            content.innerHTML = response;
            showProductModal();
        },
        error: function (xhr) {
            // Xử lý lỗi nếu cần
        }
    });
}

function showProductModal() {
    const quickViewProduct = document.getElementById('quick-view-product');
    const backdrop = document.querySelector('.quickview-product');
    // Hiển thị modal sản phẩm
    quickViewProduct.classList.add('active');
    backdrop.style.display = 'block';
    // Khởi tạo bộ lắng nghe sự kiện cho nút đóng modal sản phẩm
    initializeCloseEventProduct();
}

function initializeCloseEventProduct() {
    const iconClose = document.querySelector('.js-popup-close-product');
    if (iconClose) {
        iconClose.addEventListener('click', hideProductModal);
    }
}

function hideProductModal() {
    const quickViewProduct = document.getElementById('quick-view-product');
    const backdrop = document.querySelector('.quickview-product');
    quickViewProduct.classList.remove('active');
    backdrop.style.display = 'none';
}

document.addEventListener("DOMContentLoaded", function () {
    // Lấy danh sách tất cả các tab
    var tabs = document.querySelectorAll('.tab-link');

    // Lặp qua từng tab và thêm sự kiện click cho mỗi tab
    tabs.forEach(function (tab) {
        tab.addEventListener('click', function () {
            // Xóa lớp "current" khỏi tất cả các tab
            tabs.forEach(function (tabItem) {
                tabItem.classList.remove('current');
            });

            // Thêm lớp "current" cho tab được nhấp vào
            tab.classList.add('current');
        });
    });
});

function addProductQuantity(userId, productId) {
    $.ajax({
        url: "/FurnitureProject/productQuantity",
        type: "post",
        data: {
            userId: userId,
            productId: productId
        },
        success: function (response) {
            // Parse JSON response từ servlet
            var products = JSON.parse(response);
            var totalPrice = 0;
            var newHTML = '';
            // Kiểm tra nếu không còn sản phẩm trong giỏ hàng
            if (products.length === 0) {
                hideCartModal();
            } else {
                // Tạo HTML mới cho giỏ hàng
                newHTML +=
                        '<div class="cartPopupContainer">' +
                        '<form action="cart" method="post" class="cart ajaxcart cartpopup">' +
                        '<div class="cart-header-info"><div>Thông tin sản phẩm</div><div>Đơn giá</div><div>Số lượng</div><div>Thành tiền</div></div>' +
                        '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">'
                        ;
                // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                products.forEach(function (product) {
                    if (product.quantity > 0) {
                        newHTML += '<div class="ajaxcart__row">';
                        newHTML += '<div class="ajaxcart__product cart_product">';
                        newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                        newHTML += '<img width="80" height="80" src="' + product.thumbnail + '" alt="' + product.title + '">';
                        newHTML += '</a>';
                        newHTML += '<div class="grid__item cart_info">';
                        newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                        newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                        newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price">' + formatCurrency(product.price) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half cart_select">';
                        newHTML += '<div class="ajaxcart__qty input-group-btn">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" onclick="reduceProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">-</button>';
                        newHTML += '<input id="quantity_' + product.productId + '" type="text" name="" value="' + product.quantity + '" class="ajaxcart__qty-num number-sidebar" maxlength="3" value="1" min="0" pattern="[0-9]*">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" onclick="addProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">+</button>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + formatCurrency(product.price * product.quantity) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                    }
                });
                products.forEach(function (product) {
                    totalPrice += product.price * product.quantity;
                });
                newHTML += '</div>' +
                        '<div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">' +
                        '<div class="row">' +
                        '<div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">' +
                        '<div class="ajaxcart__subtotal">' +
                        '<div class="cart__subtotal">' +
                        '<div class="cart__col-6">Tổng tiền:</div>' +
                        '<div class="text-right cart__totle"><span class="total-price">' + formatCurrency(totalPrice) + '</span></div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="cart__btn-proceed-checkout-dt">' +
                        '<button onclick="" type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</form>' +
                        '</div>';
            }

            // Thay đổi nội dung của phần tử giỏ hàng
            $("#cart-popup-container").html(newHTML);
        },
        error: function (xhr) {
            console.error("Lỗi khi phân tích cú pháp JSON: ", error);
        }
    });
}

// Hàm để định dạng số tiền
function formatCurrency(amount) {
    return amount.toLocaleString('vi-VN') + '₫';
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
            // Parse JSON response từ servlet
            var products = JSON.parse(response);
            var totalPrice = 0;
            var newHTML = '';
            // Kiểm tra nếu không còn sản phẩm trong giỏ hàng
            if (products.length === 0) {
                hideCartModal();
            } else {
                // Tạo HTML mới cho giỏ hàng
                newHTML +=
                        '<div class="cartPopupContainer">' +
                        '<form action="cart" method="post" class="cart ajaxcart cartpopup">' +
                        '<div class="cart-header-info"><div>Thông tin sản phẩm</div><div>Đơn giá</div><div>Số lượng</div><div>Thành tiền</div></div>' +
                        '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">'
                        ;
                // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                products.forEach(function (product) {
                    if (product.quantity > 0) {
                        newHTML += '<div class="ajaxcart__row">';
                        newHTML += '<div class="ajaxcart__product cart_product">';
                        newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                        newHTML += '<img width="80" height="80" src="' + product.thumbnail + '" alt="' + product.title + '">';
                        newHTML += '</a>';
                        newHTML += '<div class="grid__item cart_info">';
                        newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                        newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                        newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price">' + formatCurrency(product.price) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half cart_select">';
                        newHTML += '<div class="ajaxcart__qty input-group-btn">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" onclick="reduceProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">-</button>';
                        newHTML += '<input id="quantity_' + product.productId + '" type="text" name="" value="' + product.quantity + '" class="ajaxcart__qty-num number-sidebar" maxlength="3" value="1" min="0" pattern="[0-9]*">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" onclick="addProductQuantity(\'' + product.userId + '\', ' + product.productId + ')">+</button>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + formatCurrency(product.price * product.quantity) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                    }
                });
                products.forEach(function (product) {
                    totalPrice += product.price * product.quantity;
                });
                newHTML += '</div>' +
                        '<div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">' +
                        '<div class="row">' +
                        '<div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">' +
                        '<div class="ajaxcart__subtotal">' +
                        '<div class="cart__subtotal">' +
                        '<div class="cart__col-6">Tổng tiền:</div>' +
                        '<div class="text-right cart__totle"><span class="total-price">' + formatCurrency(totalPrice) + '</span></div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="cart__btn-proceed-checkout-dt">' +
                        '<button onclick="" type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</form>' +
                        '</div>';
            }

            // Thay đổi nội dung của phần tử giỏ hàng
            $("#cart-popup-container").html(newHTML);
        },
        error: function (xhr) {
            console.error("Lỗi khi phân tích cú pháp JSON: ", error);
        }
    });
}



function addProductQuantityInCart(userId, productId) {
    $.ajax({
        url: "/FurnitureProject/productQuantity",
        type: "post",
        data: {
            userId: userId,
            productId: productId
        },
        success: function (response) {
            var products = JSON.parse(response);
            var totalPrice = 0;
            var newHTML = '';

            if (products.length === 0) {
                newHTML = '<div><center><h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3></center></div>';
            } else {
                newHTML += '<form id="content" action="cart" method="post" class="cart ajaxcart cartpage">' +
                        '<div class="cart-header-info">' +
                        '<div>Thông tin sản phẩm</div>' +
                        '<div>Đơn giá (VNĐ)</div>' +
                        '<div>Số lượng</div>' +
                        '<div>Thành tiền (VNĐ)</div>' +
                        '</div>' +
                        '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">';

                products.forEach(function (product) {
                    if (product.quantity > 0) {
                        newHTML += '<div class="ajaxcart__row">';
                        newHTML += '<div class="ajaxcart__product cart_product">';
                        newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                        newHTML += '<img src="' + product.thumbnail + '" alt="' + product.title + '">';
                        newHTML += '</a>';
                        newHTML += '<div class="grid__item cart_info">';
                        newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                        newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                        newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price">' + formatCurrency(product.price) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half cart_select">';
                        newHTML += '<div class="ajaxcart__qty input-group-btn">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" onclick="reduceProductQuantityInCart(\'' + product.userId + '\', ' + product.productId + ')">-</button>';
                        newHTML += '<input id="quantity_' + product.productId + '" type="text" name="" value="' + product.quantity + '" class="ajaxcart__qty-num number-sidebar" maxlength="3" value="1" min="0" pattern="[0-9]*">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" onclick="addProductQuantityInCart(\'' + product.userId + '\', ' + product.productId + ')">+</button>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price">' + formatCurrency(product.price * product.quantity) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                    }
                });

                products.forEach(function (product) {
                    totalPrice += product.price * product.quantity;
                });

                newHTML += '</div>' +
                        '<div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">' +
                        '<div class="row">' +
                        '<div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">' +
                        '<div class="ajaxcart__subtotal">' +
                        '<div class="cart__subtotal">' +
                        '<div class="cart__col-6">Tổng tiền:</div>' +
                        '<div class="text-right cart__totle"><span class="total-price">' + formatCurrency(totalPrice) + '</span></div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="cart__btn-proceed-checkout-dt">' +
                        '<button type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</form>';
            }

            $("#products").html(newHTML);
        },
        error: function (xhr) {
            console.error("Lỗi khi phân tích cú pháp JSON: ", error);
        }
    });
}





function reduceProductQuantityInCart(userId, productId) {
    $.ajax({
        url: "/FurnitureProject/productQuantity",
        type: "get",
        data: {
            userId: userId,
            productId: productId
        },
        success: function (response) {
            // Parse JSON response từ servlet
            var products = JSON.parse(response);
            var totalPrice = 0;
            var newHTML = '';
            // Kiểm tra nếu không còn sản phẩm trong giỏ hàng
            if (products.length === 0) {
                newHTML = '<div><center><h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3></center></div>';
            } else {
                // Tạo HTML mới cho giỏ hàng
                newHTML += '<form id="content" action="cart" method="post" class="cart ajaxcart cartpage">' +
                        '<div class="cart-header-info">' +
                        '<div>Thông tin sản phẩm</div>' +
                        '<div>Đơn giá (VNĐ)</div>' +
                        '<div>Số lượng</div>' +
                        '<div>Thành tiền (VNĐ)</div>' +
                        '</div>' +
                        '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">';
                // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                products.forEach(function (product) {
                    if (product.quantity > 0) {
                        newHTML += '<div class="ajaxcart__row">';
                        newHTML += '<div class="ajaxcart__product cart_product">';
                        newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                        newHTML += '<img src="' + product.thumbnail + '" alt="' + product.title + '">';
                        newHTML += '</a>';
                        newHTML += '<div class="grid__item cart_info">';
                        newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                        newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                        newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price">' + formatCurrency(product.price) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half cart_select">';
                        newHTML += '<div class="ajaxcart__qty input-group-btn">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" onclick="reduceProductQuantityInCart(\'' + product.userId + '\', ' + product.productId + ')">-</button>';
                        newHTML += '<input id="quantity_' + product.productId + '" type="text" name="" value="' + product.quantity + '" class="ajaxcart__qty-num number-sidebar" maxlength="3" value="1" min="0" pattern="[0-9]*">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" onclick="addProductQuantityInCart(\'' + product.userId + '\', ' + product.productId + ')">+</button>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + formatCurrency(product.price * product.quantity) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                    }
                });
                products.forEach(function (product) {
                    totalPrice += product.price * product.quantity;
                });
                newHTML += '</div>' +
                        '<div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">' +
                        '<div class="row">' +
                        '<div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">' +
                        '<div class="ajaxcart__subtotal">' +
                        '<div class="cart__subtotal">' +
                        '<div class="cart__col-6">Tổng tiền:</div>' +
                        '<div class="text-right cart__totle"><span class="total-price">' + formatCurrency(totalPrice) + '</span></div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="cart__btn-proceed-checkout-dt">' +
                        '<button onclick="" type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</form>';
            }

            // Thay đổi nội dung của phần tử giỏ hàng
            $("#products").html(newHTML);
        },
        error: function (xhr) {
            console.error("Lỗi khi phân tích cú pháp JSON: ", error);
        }
    });
}

function removeProductFromCart(userId, productId) {
    $.ajax({
        url: "/FurnitureProject/removeProductFromCart",
        type: "get",
        data: {
            userId: userId,
            productId: productId
        },
        success: function (response) {
            // Parse JSON response từ servlet
            var cart = JSON.parse(response);
            var totalPrice = 0;
            var newHTML = '';
            // Kiểm tra nếu không còn sản phẩm trong giỏ hàng
            if (cart.length === 0) {
                newHTML = '<div><center><h3 class="" style="margin-top: 20px;">Không có sản phẩm nào trong giỏ hàng của bạn</h3></center></div>';
            } else {
                // Tạo HTML mới cho giỏ hàng
                newHTML += '<form id="content" action="cart" method="post" class="cart ajaxcart cartpage">' +
                        '<div class="cart-header-info">' +
                        '<div>Thông tin sản phẩm</div>' +
                        '<div>Đơn giá (VNĐ)</div>' +
                        '<div>Số lượng</div>' +
                        '<div>Thành tiền (VNĐ)</div>' +
                        '</div>' +
                        '<div class="ajaxcart__inner ajaxcart__inner--has-fixed-footer cart_body items">';
                // Duyệt qua danh sách sản phẩm và tạo HTML cho mỗi sản phẩm
                cart.forEach(function (product) {
                    if (product.quantity > 0) {
                        newHTML += '<div class="ajaxcart__row">';
                        newHTML += '<div class="ajaxcart__product cart_product">';
                        newHTML += '<a href="" class="ajaxcart__product-image cart_image" title="' + product.title + '">';
                        newHTML += '<img src="' + product.thumbnail + '" alt="' + product.title + '">';
                        newHTML += '</a>';
                        newHTML += '<div class="grid__item cart_info">';
                        newHTML += '<div class="ajaxcart__product-name-wrapper cart_name">';
                        newHTML += '<a href="" class="ajaxcart__product-name h4" title="' + product.title + '">' + product.title + '</a>';
                        newHTML += '<a class="cart__btn-remove remove-item-cart ajaxifyCart--remove" href="">Xóa</a>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price">' + formatCurrency(product.price) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half cart_select">';
                        newHTML += '<div class="ajaxcart__qty input-group-btn">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--minus items-count" onclick="reduceProductQuantityInCart(\'' + product.userId + '\', ' + product.productId + ')">-</button>';
                        newHTML += '<input id="quantity_' + product.productId + '" type="text" name="" value="' + product.quantity + '" class="ajaxcart__qty-num number-sidebar" maxlength="3" value="1" min="0" pattern="[0-9]*">';
                        newHTML += '<button type="button" class="ajaxcart__qty-adjust ajaxcart__qty--plus items-count" onclick="addProductQuantityInCart(\'' + product.userId + '\', ' + product.productId + ')">+</button>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '<div class="grid">';
                        newHTML += '<div class="grid__item one-half text-right cart_prices">';
                        newHTML += '<span class="cart-price" data-quantity="' + product.quantity + '">' + formatCurrency(product.price * product.quantity) + '</span>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                        newHTML += '</div>';
                    }
                });
                cart.forEach(function (product) {
                    totalPrice += product.price * product.quantity;
                });
                newHTML += '</div>' +
                        '<div class="ajaxcart__footer ajaxcart__footer--fixed cart-footer">' +
                        '<div class="row">' +
                        '<div class="col-lg-4 col-12 offset-md-8 offset-lg-8 offset-xl-8">' +
                        '<div class="ajaxcart__subtotal">' +
                        '<div class="cart__subtotal">' +
                        '<div class="cart__col-6">Tổng tiền:</div>' +
                        '<div class="text-right cart__totle"><span class="total-price">' + formatCurrency(totalPrice) + '</span></div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="cart__btn-proceed-checkout-dt">' +
                        '<button onclick="" type="submit" class="button btn btn-default cart__btn-proceed-checkout" title="Thanh toán">Thanh toán</button>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</form>';
            }

            // Thay đổi nội dung của phần tử giỏ hàng
            $("#products").html(newHTML);
        },
        error: function (xhr) {
            console.error("Lỗi khi phân tích cú pháp JSON: ", error);
        }
    });
}


