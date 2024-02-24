<%-- 
    Document   : accountInfo
    Created on : Dec 23, 2023, 10:01:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <title>Account Information Page</title>
        <link rel="stylesheet" href="assets/css/accountInfoStyle.css">
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>

        <c:set var="user" value="${sessionScope.USER_INFO}"/>
        <c:set var="error" value="${requestScope.CHANGE_PASS_ERROR}"/>
        <c:set var="saveError" value="${requestScope.UPDATE_ACCOUNT_INFO_ERR}"/>
        <section class="section">
            <div class="account-title">
                <h2>Thông tin tài khoản</h2>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-12">
                        <div class="offset-lg-2 user-img">                          

                            <img width="50px" style="border-radius: 50%" src="${user.picture}">
                            <p style="text-align: center;font-size: 18px;padding-top: 10px;color: #f3a270;font-weight: 600">
                                Ảnh Đại Diện
                            </p>

                        </div>
                    </div>

                    <div class="col-lg-9 col-12 row account-body">
                        <form action="accountInfo" method="POST" enctype="multipart/form-data" class="offset-lg-2 col-lg-9">
                            <input type="hidden" name="hdId" value="${user.id}"/>
                            <div class="row account-input">
                                <div class="col-lg-6">
                                    <label for="">Email</label>
                                    <p style="font-size: 18px">${user.email}</p>
                                </div>
                                <div class="col-lg-6">
                                    <label for="">Họ và tên</label>
                                    <input type="text" name="txtName" value="${user.name}">
                                    <p style="font-size: 14px;color: red">${saveError.fullnameLengthError}</p>
                                </div>
                            </div>
                            <div class="row account-input">
                                <div class="col-lg-6">
                                    <label for="">Số điện thoại</label>
                                    <input type="text" name="txtPhone" value="${user.phone}">
                                    <c:if test="${saveError != null and saveError.phoneLengthError != null}">
                                        <p style="font-size: 14px;color: red">${saveError.phoneLengthError}</p>
                                    </c:if>                                   
                                </div>
                                <div class="col-lg-6">
                                    <label for="">Địa chỉ</label>
                                    <input type="text" name="txtAddress" value="${user.address}">
                                </div>
                                <div class="col-lg-12">
                                    <label for="folderInput">Ảnh đại diện</label>
                                    <input type="file" id="folderInput" name="avatar">
                                </div>
                                <div class="col-lg-12">
                                    <label for="">Mật khẩu</label>

                                    <input type="submit" class="js-RsPassBtn" value="Đổi mật khẩu" onclick="showChangePassword()">


                                </div>
                            </div>

                            <div class="row">
                                <div class="btn-save">                                   
                                    <button type="submit" class="">Lưu</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../UIcomponents/footer.jsp" %>


        <div class="modal">
            <form action="changePassword" method="POST">
                <input type="hidden" name="hdId" value="${user.id}" />
                <div class="modal-container js-modal-container">
                    <div class="modal-close js-modal-close">
                        <i class="ti-close"></i>
                    </div>
                    <header class="modal-header">
                        <h3>Thay đổi mật khẩu</h3>
                    </header>
                    <div class="modal-body">
                        <label for="" class="modal-label">Nhập mật khẩu cũ</label>
                        <input  type="password" name="oldPass" class="modal-input" placeholder="Mật khẩu cũ" required>
                        <c:if test="${not empty error and error.oldPassNotMatch != null}">
                            <p style="color: red;font-size: 14px">${error.oldPassNotMatch}</p>
                        </c:if>
                        <label for="" class="modal-label">Nhập mật khẩu mới</label>
                        <input  type="password" name="newPass" class="modal-input" placeholder="Mật khẩu mới" required>
                        <c:if test="${not empty error and error.passwordLengthError != null}">
                            <p style="color: red;font-size: 14px">${error.passwordLengthError}</p>
                        </c:if>
                        <label for="" class="modal-label">Nhập lại mật khẩu</label>
                        <input  type="password" name="confirmNewPass" class="modal-input" placeholder="Nhập lại mật khẩu mới" required>
                        <c:if test="${not empty error and error.confirmNotMatch != null}">
                            <p style="color: red;font-size: 14px">${error.confirmNotMatch}</p>
                        </c:if>
                    </div>
                    <div class="modal-btn">
                        <button type="submit">Cập nhật mật khẩu</button>
                    </div>
                </div>
            </form>
        </div>


        <script>
            const resetPassBtn = document.querySelector('.js-RsPassBtn');
            const modal = document.querySelector('.modal');
            const modalClose = document.querySelector('.js-modal-close');
            function showChangePassword() {
                modal.classList.add('open');
                event.preventDefault();
            }
            function hideChangePassword() {
                modal.classList.remove('open');
            }
            resetPassBtn.addEventListener('click', showChangePassword);
            modalClose.addEventListener('click', hideChangePassword);
        </script>

    </body>
</html>
