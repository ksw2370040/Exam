<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<c:choose>
  <c:when test="${sessionScope.user == null}">
  	<p>ログインに失敗しました。idまたはパスワードが正しくありません。</p>
  </c:when>
 </c:choose>
<form action="../user/LoginExecute.action" method="post">
<p>ログイン名<input type="text" name="id" required></p>
<p>パスワード<input type="password" name="password" id="password" required></p>

<p><input type="checkbox" id="showPassword" onclick="togglePasswordVisibility()"> パスワードを表示</p>

<p><input type="submit" value="ログイン"></p>
</form>

