<%-- 
    Document   : sidebar
    Created on : Mar 15, 2024, 12:24:37 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">     
        <style>
            a {
                cursor: pointer;
            }
        </style>
    </head>
    <body>
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
            
            <script>

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
    </body>
</html>
