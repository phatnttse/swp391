<%-- 
    Document   : test
    Created on : Mar 21, 2024, 8:52:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="/FurnitureProject/assets/css/admin/sb-admin-2.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <title>Trang đăng nhập</title>
        <style>
    .product-image {
      width: 100px;
      height: auto;
      margin-right: 20px;
    }
    .table-borderless tr, .table-borderless td {
      border: none;
    }
  </style>
</head>
<body>
  <div class="container mt-5">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Order Details</h5>
        <table class="table table-borderless">
          <tbody>
            <tr>
              <td rowspan="6">
                <img src="product.jpg" alt="Product Image" class="product-image">
              </td>
              <td>Order Date:</td>
              <td>January 1, 2024</td>
            </tr>
            <tr>
              <td>Delivery Address:</td>
              <td>123 Main St, City, Country</td>
            </tr>
            <tr>
              <td>Order Status:</td>
              <td>Processing</td>
            </tr>
            <tr>
              <td>Payment Status:</td>
              <td>Pending</td>
            </tr>
            <tr>
              <td>Total Cost:</td>
              <td>$100.00</td>
            </tr>
            <tr>
              <td colspan="2">
                <a href="#" class="btn btn-primary me-md-2">Xem chi tiết đơn hàng</a>
                <a href="#" class="btn btn-danger">Huỷ đơn hàng</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
