<%-- 
    Document   : viewProducts
    Created on : Dec 23, 2023, 3:39:25 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../UIcomponents/header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>View Products Page</title>
    </head>
    <body>
       
        <style>
            .container{
                padding-left: 240px;
                display: flex;
                align-items: center;
                margin-bottom: 100px;
               
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 100px; 
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: center;
            }        
        
        </style>
    </head>
    <body>
        <%@include file="../UIcomponents/adminSidebar.jsp" %>
        <div class="main">
            
            <div class="container">
                
                <table border="1">               
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá</th>                   
                            <th>Hình ảnh</th>
                            <th>Giảm giá</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>

                    <tbody>                   
                        <c:set var="products" value="${requestScope.PRODUCTS_LIST}"/>
                        <c:if test="${not empty products}">
                            <c:forEach var="dto" items="${products}" varStatus="counter">
                            <form action="">                                                                
                                <tr>
                                    <td>                                     
                                        ${counter.count}
                                    </td>
                                    <td>                                       
                                        ${dto.name}                               
                                    </td>                                   
                                    <td>                                        
                                         ${dto.quantity}
                                    </td>

                                    <td>
                                        ${dto.price}
                                    </td>
                                    <td>
                                        <img width="100px" height="100px" src="assets/img/products/${dto.image}">                                                                          
                                    </td>
                                     <td>
                                        ${dto.discount}                                      
                                    </td>
                                     <td>
                                        ${dto.status}                                      
                                    </td> 
                                </tr>
                            </form>
                        </c:forEach>


                    </c:if>


                    </tbody>

                </table>

            </div>
                       
        </div>
      
    </body>
</html>
