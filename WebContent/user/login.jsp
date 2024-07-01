<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
    <link href="../css/stylesheet.css" rel="stylesheet" />
    <style>
        .form-group {
            position: relative;
            margin-bottom: 20px;
        }

        .form-group input {
            width: 100%;
            height: 50px;
            padding: 20px 10px 10px 10px; /* Adjust padding to make space for the label inside the input */
            box-sizing: border-box;
            border-radius: 10px; /* Add this line to make the corners round */
            border: 1px solid #ccc;
        }

        .form-group label {
            position: absolute;
            top: 0;
            left: 10px;
            padding: 10px;
            pointer-events: none;
            color: #aaa;
            font-size: 12px;
            transition: 0.2s;
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            top: -10px;
            left: 10px;
            font-size: 10px;
            color: #333;
        }
    </style>
</head>

<body>

<header>
    <h1>得点管理システム</h1>
</header>

<div class="box-container">
    <div class="login-box">
        <h2>ログイン</h2>
        <form action="../user/LoginExecute.action" method="post">
            <div class="form-group">
                <input type="text" id="id" name="id" maxlength="20" pattern="[a-zA-Z0-9]+" required placeholder=" ">
                <label for="id">ID</label>
            </div>
            <div class="form-group">
                <input type="password" name="password" id="password" required placeholder=" ">
                <label for="password">パスワード</label>
            </div>
            <p><input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()"> パスワードを表示</p>
            <p><input type="submit" value="ログイン"></p>
        </form>
    </div>
</div>

<script type="text/javascript">
    function togglePasswordVisibility() {
        var passwordField = document.getElementById("password");
        var checkbox = document.getElementById("showPassword");
        if (checkbox.checked) {
            passwordField.type = "text";
        } else {
            passwordField.type = "password";
        }
    }
</script>

</body>
</html>
