<%-- 
    Document   : accountInfo
    Created on : Dec 22, 2023, 4:55:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../UIcomponents/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Information Page</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f5f5f5;
                margin: 0;
            }

            .main {
                padding-left: 240px;
            }

            .container {
                margin-top: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                margin-top: 80px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: center;
            }

            th {
                background-color: #ccc;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            input[type="text"] {
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 8px;
                text-align: center;
            }

            .btn-save button {
                background-color: #ccc;
                border: none;
                border-radius: 10px;
                padding: 10px;
                cursor: pointer;
            }

            .btn-save button:hover {
                background-color: #f3a270;
            }
            
            .modal {
                display: none;
                justify-content: center;
                align-items: center;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
            }

            .modal-container {
                background-color: #fff;
                width: 300px;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
            }

            .open {
                display: flex !important;
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
                            <th>Họ và tên</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>                   
                            <th>Xoá</th>
                            <th>Chỉnh sửa</th>
                        </tr>
                    </thead>

                    <tbody>                   
                        <c:set var="customers" value="${requestScope.LIST_CUSTOMERS}"/>
                        <c:if test="${not empty customers}">
                            <c:forEach var="dto" items="${customers}" varStatus="counter">
                            <form action="updateUsers">                                                                
                                <tr>
                                    <td>
                                        <input type="hidden" name="id" value="${dto.id}" />
                                        ${dto.id}
                                    </td>
                                    <td>                                       
                                        <input type="text" name="txtFullname" value="${dto.name}" />                                      
                                    </td>
                                    <td>
                                        <input type="hidden" name="hdEmail" value="${dto.email}" />
                                        ${dto.email}
                                    </td>
                                    <td>                                        
                                        <input type="text" name="txtPhone" value=" ${dto.phone}" />
                                    </td>

                                    <td>
                                        <div>
                                            <c:url var="urlDelete" value="deleteUsers">
                                                <c:param name="email" value="${dto.email}"></c:param>                                               
                                            </c:url>
                                            <a class="ti-trash" href="${urlDelete}"></a>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="btn-save">                                                                                    
                                            <button class="ti-save"></button>
                                        </div>                                        
                                    </td> 
                                </tr>
                            </form>
                        </c:forEach>


                    </c:if>


                    </tbody>

                </table>

            </div>
        </div>
        <div>
            <div class="modal">
                <div class="modal-container">
                    <p>Chỉnh sửa thành công</p>
                </div>
            </div>

        </div>




    </body>
</html>
<%--<%@include file="../UIcomponents/footer.jsp" %>--%>