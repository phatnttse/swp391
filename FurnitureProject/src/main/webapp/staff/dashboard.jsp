<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>        
        <title>DashBoard</title>
        <style>
            a {
                cursor: pointer;
            }
        </style>
    </head>
    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Content Wrapper -->
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gray-900  sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">

                    <div class="sidebar-brand-text mx-3">Lofi Furniture</div>
                </a>

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="dashboard">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Thông kê</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Menu
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="productManager">
                        <span>Sản Phẩm</span>
                        <i id="arrow-icon" class="fas fa-chevron-right" style="color: white;margin-left: 100px"></i>
                    </a>                  
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="categoryManager">
                        <span>Danh mục</span>
                        <i id="arrow-icon" class="fas fa-chevron-right" style="color: white;margin-left: 100px"></i>
                    </a>                  
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" onclick="toggleSubMenu('sub-order')">                  
                        <span>Đơn Hàng</span>
                        <i id="arrow-icon-sub-order" class="fas fa-chevron-right" style="color: white;margin-left: 100px"></i>
                    </a>
                </li>

                <li id="sub-order" class="nav-item" style="display: none">
                    <a class="nav-link collapsed" href="orderManager">                  
                        <span>Tất Cả Đơn Hàng</span>
                    </a>
                    <a class="nav-link collapsed" href="requestCancelOrderManager">                  
                        <span>Yêu cầu huỷ đơn</span>
                    </a>
                </li>


                <!-- Divider -->
                <hr class="sidebar-divider">       


            </ul>
            <!-- End of Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Begin Page Content -->
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                       

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>


                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <c:set var="staff" value="${sessionScope.STAFF_INFO}"/>
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" onclick="toggleSubMenu('sub-menu')">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${staff.name}</span>
                                    <img class="img-profile rounded-circle"
                                         src="assets/img/users/avatar.jpg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div id="sub-menu" class="dropdown-menu dropdown-menu-right shadow animated--grow-in">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>                                                                    
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="LogOutAdmin">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->
                    <div class="container-fluid">
                        <!-- Content Row -->

                        <h1 class="my-4">Thống kê</h1>
                    
                        <div class="row">
                            <div class="col-md-6">
                                <canvas id="monthlyRevenueChart"></canvas>
                            </div>
                            <div class="col-md-6">
                                <canvas id="purchasesByCategoryChart"></canvas>
                            </div>

                        </div>
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <canvas id="thirdChart"></canvas>
                            </div>
                            <div class="col-md-6">
                                <canvas id="fourthChart"></canvas>
                            </div>
                        </div>

                        <c:set var="RevenueByMonth" value="${requestScope.REVENUE_BY_MONTH}"/>
                        <c:set var="PurchasesByCategory" value="${requestScope.TOTAL_PURCHASES_BY_CATEGORY}"/>
                       

                        <script>
                            var ctx1 = document.getElementById('monthlyRevenueChart').getContext('2d');
                            var revenueChart = new Chart(ctx1, {
                                type: 'bar',
                                data: {
                                    labels: [<c:forEach var="revenue" items="${RevenueByMonth}">"${revenue.date}",</c:forEach>],
                                            datasets: [{
                                                    label: "Doanh thu theo tháng",
                                                    lineTension: 0.3,
                                                    backgroundColor: "rgba(2,117,216,0.2)",
                                                    borderColor: "rgba(2,117,216,1)",
                                                    pointRadius: 5,
                                                    pointBackgroundColor: "rgba(2,117,216,1)",
                                                    pointBorderColor: "rgba(255,255,255,0.8)",
                                                    pointHoverRadius: 5,
                                                    pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                                    pointHitRadius: 50,
                                                    pointBorderWidth: 2,
                                                    data: [<c:forEach var="revenue" items="${RevenueByMonth}">${revenue.value},</c:forEach>],
                                                }],
                                },
                                options: {
                                    scales: {
                                        xAxes: [{
                                                time: {
                                                    unit: 'date'
                                                },
                                                gridLines: {
                                                    display: false
                                                },
                                                ticks: {
                                                    maxTicksLimit: 7
                                                }
                                            }],
                                        yAxes: [{
                                                ticks: {
                                                    min: 0,
                                                    max: 10,
                                                    maxTicksLimit: 5
                                                },
                                                gridLines: {
                                                    color: "rgba(0, 0, 0, .125)",
                                                }
                                            }],
                                    },
                                    legend: {
                                        display: false
                                    }
                                }
                            });

                            var ctx2 = document.getElementById('purchasesByCategoryChart').getContext('2d');
                            var purchasesByCategoryChart = new Chart(ctx2, {
                                type: 'line',
                                data: {
                                    labels: [<c:forEach var="item" items="${PurchasesByCategory}">"${item.key}",</c:forEach>],
                                    datasets: [{
                                            label: "Số lượng mua hàng",
                                            backgroundColor: "rgba(255,99,132,0.2)",
                                            borderColor: "rgba(255,99,132,1)",
                                            borderWidth: 1,
                                            data: [<c:forEach var="item" items="${PurchasesByCategory}">${item.value},</c:forEach>]
                                        }]
                                },
                                options: {
                                    // Các tùy chọn của biểu đồ (nếu cần)
                                }
                            });
                            
                            function toggleSubMenu(menuId) {
                                var subMenu = document.getElementById(menuId);
                                var arrowIcon = document.getElementById('arrow-icon-' + menuId);
                                if (subMenu.style.display === 'none') {
                                    subMenu.style.display = 'block';
                                    arrowIcon.classList.remove('fa-chevron-right');
                                    arrowIcon.classList.add('fa-chevron-down');
                                } else {
                                    subMenu.style.display = 'none';
                                    arrowIcon.classList.remove('fa-chevron-down');
                                    arrowIcon.classList.add('fa-chevron-right');
                                }
                            }
                        </script>
                    </div>
                </div>
                <!-- /.container-fluid -->
                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->
            </div>
            <!-- End of Main Content -->
        </div>
        <!-- End of Content Wrapper -->
    </body>
</html>


