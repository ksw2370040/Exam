<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>得点管理システム</title>
    <link href="../css/student-add.css" rel="stylesheet" />
</head>
<body>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">
	<section class="me-4">
<div id="addcomplete">
		<h2>学生情報削除</h2>
		<p>削除が完了しました</p>
<a href="../subject/SubjectList.action">科目一覧</a>
	</div>
	</section>
	</c:param>
</c:import>
</body>
</html>