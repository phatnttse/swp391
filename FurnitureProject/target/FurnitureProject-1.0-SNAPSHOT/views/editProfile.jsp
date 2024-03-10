<%-- 
    Document   : accountInfo
    Created on : Dec 23, 2023, 10:01:32 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
        <title>Account Information Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <body>
        <%@include file="../UIcomponents/header.jsp" %>
        <%@include file="../UIcomponents/breadcrumb.jsp" %>

        <c:set var="user" value="${sessionScope.USER_INFO}"/>
        <c:set var="error" value="${requestScope.EDIT_PROFILE_ERR}"/>
        <style>
            .gradient-custom {
                background: #72797f;
            }
            .custom-icon {
                transition: color 0.3s ease;
            }

            .custom-icon:hover {
                cursor: pointer;
                color: #d94e28;
            }
        </style>
        <c:set var="error" value="${requestScope.EDIT_PROFILE_ERR}"/>
        <section class="">
            <div class="container py-5 h-100">
                <form action="accountInfo" method="post">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col col-lg-8 mb-4 mb-lg-0">
                            <div class="card mb-3" style="border-radius: .5rem;">
                                <div class="row g-0">
                                    <div class="col-md-4 gradient-custom text-center text-white" style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
                                        <img
                                            src="assets/img/users/avatar.jpg"
                                            alt="Avatar"
                                            class="img-fluid my-5"
                                            style="width: 80px; border-radius: 10rem"
                                            />
                                        <h5>${user.name}</h5>
                                        <i class="far fa-edit mb-5 custom-icon"></i>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body p-4">
                                            <h6>Thông tin</h6>
                                            <hr class="mt-0 mb-4" style="background-color: gray">
                                            <div class="row pt-1">
                                                <div class="col-6 mb-3">
                                                    <h6>Email</h6>
                                                    <div class="input-group mb-3">
                                                        <input class="form-control" type="text" name="email" value="${user.email}" readonly/>
                                                    </div>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>Phone</h6>
                                                    <div class="input-group mb-3">
                                                        <input class="form-control" type="text" name="phone" value="${user.phone}" />
                                                    </div>
                                                    <c:if test="${error != null}">
                                                        <p style="color: red;font-size: 14px">${error.phoneRegexError}</p>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <hr class="mt-0 mb-4">
                                            <div class="row pt-1">
                                                <div class="col-6 mb-3">
                                                    <h6>Địa chỉ</h6>
                                                    <div class="input-group mb-3">
                                                        <input class="form-control" type="text" name="address" value="${user.address}" />
                                                    </div>
                                                </div>
                                                <div class="col-6 mb-3">
                                                    <h6>Tên</h6>
                                                    <div class="input-group mb-3">
                                                        <input class="form-control" type="text" name="name" value="${user.name}" />
                                                    </div>
                                                    <c:if test="${error != null}">
                                                        <p style="color: red;font-size: 14px">${error.givenNameLengthError}</p>
                                                    </c:if>
                                                </div>
                                                <div class="text-center">
                                                    <button type="submit" class="btn btn-outline-info">Cập nhật</button>
                                                </div>   
                                            </div>                                      
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <%@include file="../UIcomponents/footer.jsp" %>

    </body>
</html>
