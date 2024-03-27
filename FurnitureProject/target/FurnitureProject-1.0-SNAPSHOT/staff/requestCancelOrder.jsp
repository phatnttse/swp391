<%-- 
    Document   : requestCancellation
    Created on : Mar 11, 2024, 7:50:45 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.min.css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="assets/css/admin/sb-admin-2.min.css">     
        <title>Yêu cầu huỷ đơn</title>
        <style>
            a {
                cursor: pointer;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <%@include file="../UIcomponents/sidebar.jsp"%>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->

                <div id="content">

                    <%@include file="../UIcomponents/topbar.jsp"%>

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <c:set var="requests" value="${requestScope.REQUEST_CANCELS}"/>

                        <h1 class="h3 my-5 mb-4 text-gray-800">Yêu cầu huỷ đơn</h1>

                        <c:if test="${not empty requestScope.ACCEPT}">
                            <div id="autoCloseAlert" class="alert alert-success alert-dismissible fade show" role="alert">                                     
                                ${requestScope.ACCEPT}
                                <button type="button" class="close" onclick="document.getElementById('autoCloseAlert').style.display = 'none';" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>
                        <c:if test="${not empty requestScope.REFUSE}">
                            <div id="autoCloseAlert" class="alert alert-success alert-dismissible fade show" role="alert">                                     
                                ${requestScope.REFUSE}
                                <button type="button" class="close" onclick="document.getElementById('autoCloseAlert').style.display = 'none';" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </c:if>

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Bảng yêu cầu huỷ đơn</h6>
                            </div>
                            <div class="card-body">


                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Mã đơn hàng</th>
                                                <th>Tên</th>
                                                <th>Email</th>
                                                <th>SĐT</th>                                                                                  
                                                <th>Xử lý</th>
                                                <th>Lí do</th>
                                                <th>Tác vụ</th>                                                    
                                            </tr>
                                        </thead>
                                        <c:forEach var="request" items="${requests}">
                                            <form action="handlingOrderCancellationReq" method="post">
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <input type="hidden" name="orderId" value="${request.orderId}" />
                                                            #${request.orderId}
                                                        </td>
                                                        <td>${request.email}</td>
                                                        <td>${request.name}</td>
                                                        <td>${request.phone}</td>
                                                        <td>
                                                            <input type="hidden" name="trantype" value="02" />
                                                            <input type="hidden" name="amount" value="${request.amount}" />
                                                            <input type="hidden" name="trans_date" value="${request.orderDate}" />
                                                            <button type="submit" class="btn btn-outline-info">Chấp nhận</button>
                                                        </td>
                                                        <td>
                                                            ${request.reason}
                                                        </td>
                                                        <td>
                                                            <a href="handlingOrderCancellationReq?orderId=${request.orderId}" class="btn btn-danger">Từ chối</a>
                                                        </td> 
                                                    </tr>  

                                                </tbody>
                                            </form>
                                        </c:forEach>
                                    </table>
                                </div>                               

                            </div>
                        </div>
                        <c:set var="page" value="${requestScope.PAGE}"/>
                        <c:set var="totalPage" value="${requestScope.TOTAL_PAGES}"/>
                        <c:if test="${totalPage != null}">
                            <ul class="pagination justify-content-center my-3">
                                <li class="page-item"><a class="page-link" href="requestCancelOrderManager?page=${page - 1}">Previous</a></li>
                                    <c:forEach begin="1" end="${totalPage}" var="pageNumber">
                                    <li class="page-item"><a class="page-link" href="requestCancelOrderManager?page=${pageNumber}">${pageNumber}</a></li>
                                    </c:forEach>
                                <li class="page-item"><a class="page-link" href="requestCancelOrderManager?page=${page + 1}">Next</a></li>
                            </ul>
                        </c:if>
                        

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->


        <script src="/FurntiureProject/assets/js/alert.js"></script>
    </body>
</html>
