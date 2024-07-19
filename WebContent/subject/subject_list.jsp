<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset = "UTF-8">
	<title>科目管理</title>
	<link rel="stylesheet" type="text/css" href="../css/subject.css">
</head>
<body>
	<c:import url="../common/base.jsp">
	<c:param name="title">科目管理</c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">
		<section class="me-4">
			<h2>科目管理</h2>
			<div class= "new">
				<a href="SubjectCreate.action">新規登録</a>
			</div>
			<table>
				<tr>
					<th>科目コード</th>
					<th>科目名</th>
					<th></th>
					<th></th>
				</tr>
				<c:forEach var="subject" items="${subjects}">
					<tr>
						<td>${subject.cd}</td>
						<td>${subject.name}</td>
						<td><a href="SubjectUpdate.action?cd=${subject.cd}">変更</a></td>
						<td><a href="SubjectDeleteConfirm.jsp" >削除</a></td>
					</tr>
				</c:forEach>
			</table>
		</section>
	</c:param>
</c:import>
</body>
</html>


