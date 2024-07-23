<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>エラー</title>
    <style>
        .error-message {
            color: red;
            font-size: 16px;
            text-align: center;
            margin-top: 20%;
        }
    </style>
</head>
<body>
    <div class="error-message">
        <h2>エラーが発生しました</h2>
        <p><%= request.getAttribute("errorMessage") %></p>
        <p><a href="<%= request.getContextPath() %>/user/login.jsp">ログインページに戻る</a></p>
    </div>
</body>
</html>
