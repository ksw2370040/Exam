<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生情報登録</title>
</head>
<body>
    <form action="RegisterStudentServlet" method="post">
        学生番号: <input type="text" name="studentId"><br>
        氏名: <input type="text" name="name"><br>
        <input type="submit" value="登録">
    </form>

    <c:if test="${not empty errorMessage}">
        <p style="color:red;">${errorMessage}</p>
    </c:if>
</body>
</html>