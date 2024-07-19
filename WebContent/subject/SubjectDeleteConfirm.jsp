<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<title>削除確認</title>
</head>
<body>
	<h2>科目削除確認</h2>
	<p>本当に科目を削除しますか？</p>
	<table>
					<tr>
						<td>${subject.cd}</td>
						<td>${subject.name}</td>
					<td><a class="delete-button" href="SubjectDeleteExecute.action?cd=${subject.cd}">削除</a></td></tr>
	</table>
</body>
<style>
    .delete-button {
        display: inline-block;
        padding: 5px 10px;
        margin: 5px 0;
        font-size: 14px;
        font-weight: bold;
        color: #fff;
        background-color: #d9534f;
        border: none;
        border-radius: 4px;
        text-decoration: none;
        text-align: center;
    }

    .delete-button:hover {
        background-color: #c9302c;
    }
</style>
</html>
