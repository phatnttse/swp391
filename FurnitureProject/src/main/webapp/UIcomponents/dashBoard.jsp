<%-- 
    Document   : adminSidebar
    Created on : Dec 22, 2023, 10:40:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            
            #sidebar {
                width: 240px;
                height: 100%;
                position: fixed;              
                padding-top: 20px;
                transition: 0.3s ease-in-out;
                display: flex;
                flex-direction: column;
                border: 1px solid #ccc; 
/*                background-color:  #ffffff;*/
/*                border-radius: 5px;*/
            }
            #sidebar:hover {
                width: 260px;
            }

            .title-menu {
                padding: 20px;
                font-size: 20px;
                font-weight: bold;
            }

            .item-title {
                font-size: 16px;
                font-weight: bold;
            }

            .main-item {
                cursor: pointer;;
                padding: 20px;
            }

            .sub-menu {
                display: none;
                list-style: none;
                padding-left: 10px;
                transition: opacity 0.5s ease;
            }
            .sub-menu-item {
                display: flex;
                align-items: center;
                padding: 20px 10px;
            }

            .main-item a {
                font-size: 16px;
                width: 100%;
            }
            .main-item a:hover {
                color: #f3a270;
            }


        </style>
    </head>
    <body>
        <div id="sidebar">
            <div class="title-menu">
                <i class="ti-home"></i>
                <span>Bảng quản lý</span>
            </div>
            <hr/>
            <div class="main-item" onclick="toggleSubMenu('menu1')">
                <div class="item-title">
                    <i class="ti-user"></i>
                    <span>Quản lý người dùng</span>
                    <i class="ti-angle-down"></i>
                </div>
                <ul id="menu1" class="sub-menu">
                    <li class="sub-menu-item">
                        <a href="userAccounts">Danh sách khách hàng</a>
                    </li>
                    <li class="sub-menu-item">
                        <a href="">Danh sách quản trị viên</a>
                    </li>
                    <li class="sub-menu-item">
                        <a href="">Phản hồi</a>
                    </li>
                </ul>
            </div>
            <div class="main-item" onclick="toggleSubMenu('menu2')">
                <div class="item-title">
                    <i class="ti-dashboard"></i>
                    <span>Quản lý sản phẩm</span>
                    <i class="ti-angle-down"></i>
                </div>
                <ul id="menu2" class="sub-menu">
                    <li class="sub-menu-item">
                        <a href="viewProducts">Sản phẩm trong kho</a>
                    </li>
                    <li class="sub-menu-item">
                        <a href="">Sản phẩm</a>
                    </li>
                    <li class="sub-menu-item">
                        <a href="">Sản phẩm</a>
                    </li>
                </ul>
            </div>
            <div class="main-item" onclick="toggleSubMenu('menu3')">
                <div class="item-title">
                    <i class="ti-desktop"></i>
                    <span>Quản lý giao diện</span>
                    <i class="ti-angle-down"></i>
                </div>
                <ul id="menu3" class="sub-menu">
                    <li class="sub-menu-item">
                        <a href="">Sản phẩm</a>
                    </li>
                    <li class="sub-menu-item">
                        <a href="">Sản phẩm</a>
                    </li>
                    <li class="sub-menu-item">
                        <a href="">Sản phẩm</a>
                    </li>
                </ul>
            </div>
            <!-- Add more main items as needed -->
        </div>
        
        <script>
    function toggleSubMenu(menuId) {
      var subMenu = document.getElementById(menuId);
      subMenu.style.display = subMenu.style.display === 'block' ? 'none' : 'block';
    }
  </script>
    </body>
</html>
