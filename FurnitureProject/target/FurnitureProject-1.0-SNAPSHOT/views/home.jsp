<%-- 
    Document   : home
    Created on : Dec 11, 2023, 5:37:23 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Furniture Project</title>
        <link rel="stylesheet" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968"> 
        <link rel="preload" as="style" type="text/css" href="//bizweb.dktcdn.net/100/494/385/themes/919262/assets/bootstrap-4-3-min.css?1703641115968">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>    
        <link rel="stylesheet" href="/FurnitureProject/assets/js/product.js" />
        <link rel="stylesheet" href="/FurnitureProject/assets/css/popupCart.css">
        <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>

    </head>
    <body>      
        <div class="backdrop__body-backdrop___1rvky"></div>
        <%@include file="../UIcomponents/header.jsp"%>
        <%@include file="../UIcomponents/slider.jsp"%>
        <%@include file="../views/hotcategory.jsp"%>  
        <%@include file="../views/productset.jsp"%>
        <%@include file="../views/productsHome.jsp"%>
        <%@include file="../views/abouthome.jsp"%>

        <div id="popup-cart-desktop" class="popup-cart"></div>
        
    <df-messenger
        intent="WELCOME"
        chat-title="Lofi_Furniture_Support"
        agent-id="cf3b1e72-2c0d-43b8-b9d4-e26ce22ec3bd"
        language-code="en">          
    </df-messenger>


    <script src="assets/js/ajaxfunctions.js"></script>

</body>
</html>
<%@include file="../UIcomponents/footer.jsp" %>