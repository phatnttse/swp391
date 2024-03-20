<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                    <a class="nav-link" href="staffPage">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
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
                        <!-- Topbar Search -->
                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

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
                                    <a class="dropdown-item" href="logOut">
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

                        <h1 class="my-4">Biểu đồ doanh thu</h1>
                        <div class="row">
                            <div class="col-md-6">
                                <canvas id="revenueChart"></canvas>
                            </div>
                            <div class="col-md-6">
                                <canvas id="monthlyRevenueChart"></canvas>
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

                        <script>
                            // Function to fetch total revenue data from Servlet and draw chart
                            function drawRevenueChart() {
                                fetch('dashboard')
                                        .then(response => response.json())
                                        .then(data => {
                                            const ctx = document.getElementById('revenueChart').getContext('2d');
                                            const chart = new Chart(ctx, {
                                                type: 'line',
                                                data: {
                                                    labels: ['Total Revenue', '1', '2', '3', '4'],
                                                    datasets: [{
                                                            label: 'Total Revenue',
                                                            data: [data.totalRevenue, 10000000, 2000000, 5000000, 3000000],
                                                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                                            borderColor: 'rgba(75, 192, 192, 1)',
                                                            borderWidth: 2
                                                        }]
                                                },
                                                options: {
                                                    scales: {
                                                        y: {
                                                            beginAtZero: true
                                                        }
                                                    }
                                                }
                                            });
                                        })
                                        .catch(error => console.error('Error fetching data:', error));
                            }

                            // Function to fetch monthly revenue data from Servlet and draw chart
                            function drawMonthlyRevenueChart() {
                                fetch('dashboard')
                                        .then(response => response.json())
                                        .then(data => {
                                            const ctx = document.getElementById('monthlyRevenueChart').getContext('2d');
                                            const labels = data.map(item => item.date); // Lấy mảng các ngày
                                            const values = data.map(item => item.value); // Lấy mảng các giá trị

                                            const chart = new Chart(ctx, {
                                                type: 'bar',
                                                data: {
                                                    labels: labels,
                                                    datasets: [{
                                                            label: 'Doanh thu hàng tháng',
                                                            data: values,
                                                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                                            borderColor: 'rgba(255, 99, 132, 1)',
                                                            borderWidth: 1
                                                        }]
                                                },
                                                options: {
                                                    scales: {
                                                        y: {
                                                            beginAtZero: true
                                                        }
                                                    }
                                                }
                                            });
                                        })
                                        .catch(error => console.error('Error fetching data:', error));
                            }


                            // Call the function to draw the charts when the page loads
                            window.onload = function () {
                                drawRevenueChart(); // Draw the total revenue chart
                                drawMonthlyRevenueChart(); // Draw the monthly revenue chart
                            };

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


