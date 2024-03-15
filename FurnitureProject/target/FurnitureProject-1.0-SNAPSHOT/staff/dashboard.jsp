<%-- 
    Document   : dashboard
    Created on : Mar 4, 2024, 4:27:10 PM
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


        <%@include file="../UIcomponents/sidebar.jsp"%>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <%@include file="../UIcomponents/topbar.jsp"%>
                
                

               
            </div>
            <!-- End of Main Content -->

            <%@include file="../UIcomponents/footerStaffAdmin.jsp"%>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->


</body>
</html>
