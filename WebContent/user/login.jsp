<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>得点管理システム</title>
      <link href="../css/stylesheet.css" rel="stylesheet" />

</head>
<body>

<header>
        <h1>得点管理システム</h1>
</header>
    <p></p>
    <div class="box-container">
<div class=box>
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

<h2>ログイン</h2>

<form action="../user/LoginExecute.action" method="post">

<p> <input type="text" id="id" name="id" maxlength="20" pattern="[a-zA-Z0-9]+"
                   required placeholder="半角でご入力ください"></p>
<p>パスワード<input type="password" name="password" id="password" required placeholder="メールアドレスを入力してください"></p>

<p><input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()"> パスワードを表示</p>

<p><input type="submit" value="ログイン"></p>

</form>
</div>
</div>
</body>
</html>
