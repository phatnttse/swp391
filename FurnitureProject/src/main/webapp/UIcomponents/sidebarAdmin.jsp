<%-- 
    Document   : headerStaffAdmin
    Created on : Mar 19, 2024, 1:49:03 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul class="navbar-nav bg-gradient-dark  sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
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
                    <a class="nav-link collapsed" href="UserAccountsController">
                        <span>Quản lí tài khoản</span>
                    </a>                  
                </li>

                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="createStaffPage">                  
                        <span>Tạo tài khoản</span>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link collapsed" href="">                  
                        <span>Doanh thu</span>
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link collapsed" href="LogOutAdmin">                  
                        <span>Đăng xuất</span>
                    </a>
                </li>
                
                <!-- Divider -->
                <hr class="sidebar-divider">       

                
            </ul>
    </body>
</html>
