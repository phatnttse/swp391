<%-- 
    Document   : formFeedback
    Created on : Mar 13, 2024, 9:09:01 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback Form</title>
  <style>
    /* Thêm CSS để thiết kế form theo ý muốn */
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
    }
    form {
      max-width: 600px;
      margin: auto;
    }
    label {
      display: block;
      margin-bottom: 10px;
    }
    textarea {
      width: 100%;
      height: 150px;
    }
  </style>
</head>
<body>
  <form id="SubmitFeedback" action="SubmitFeedback" method="POST">
    <label for="errorDescription">Mô tả lỗi:</label>
    <textarea id="errorDescription" name="errorDescription" required></textarea>

    <label for="userName">Email:</label>
    <input type="text" id="userName" name="userName">

    <button type="submit">Gửi Phản Hồi</button>
  </form>

</body>
</html>
