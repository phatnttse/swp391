<%-- 
    Document   : enterEmail
    Created on : Jan 2, 2024, 1:12:49 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/themify-icons/themify-icons.css">
        <title>JSP Page</title>
        <style>
            .main {
                display: flex;
                height: 90vh;
                align-items: center;
                justify-content: center;
            }
            .logo {
                text-align: center;
            }

            .container {
                border: 1px solid #ccc;
                padding: 60px;
                border-radius: 1rem;
            }

            .title {
                color: #f3a270;
                text-align: center;
                text-transform: uppercase;
            }
            .des {
                font-size: 18px;
                text-align: center;
            }
            .enter-input {
                width: 100%;
                padding: 10px 0;
            }
            .enter-input label {
                font-size: 18px;
                text-align: left;
                font-weight: 600;
            }
            .enter-input input {
                width: 100%;
                padding: 10px 0;
                border-radius: 6px;

            }
            ::placeholder {
                text-indent: 6px;
            }
            input[type="email"] {
                margin-top: 10px;
            }   

            .btn-continue {
                padding-top: 40px;
                text-align: right;
            }
            .btn-continue button {
                padding: 10px;
                border: none;
                background-color: #007bff;
                color: #fff;
                border-radius: 6px;
                cursor: pointer;
            }
            .back {
                padding: 10px;
            }

            .back a {
                font-size: 24px;
                padding: 10px;
                border-radius: 50%;
                text-decoration: none;
                color: #000;
            }
            .back a:hover {
                background-color: #ccc;
                cursor: pointer;
            }

        </style>

    <body>
        <div class="back">
            <a href="loginPage" class="ti-arrow-left"></a>
        </div>
        <div class="main">
            <div class="container">
                <form action="forgotPassword" method="POST">
                    <div class="logo">
                        <a href="home">
                            <img src="assets/img/logo.webp" alt="Logo">
                        </a>
                    </div>
                    <div class="title">
                        <h2>Khôi phục tài khoản</h2>
                    </div>
                    <div class="des">
                        <p>Sử dụng tài khoản email của bạn để khôi phục mật khẩu</p>
                    </div>
                    <div class="enter-input">
                        <label for="">Email</label>
                        <input type="email" name="email" id="" placeholder="Nhập email">
                    </div>
                    <div class="btn-continue">
                        <button type="submit">Tiếp theo</button>
                    </div>
                </form>
            </div>
        </div>
    </body>

</html>
