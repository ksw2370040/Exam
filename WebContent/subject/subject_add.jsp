<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
    <title>学生管理</title>
    <link rel="stylesheet" type="text/css" href="../css/subject.css">
</head>
<body>
	<c:import url="../common/base.jsp">
	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">
		<section class="me-4">
			<h2>科目情報登録</h2>
			<form action="SubjectCreateExecute.action" method="get">
				<div id="filter">
					<div>
						<label>科目コード</label>
						<input id="radius" type="text" name="cd"placeholder="科目コードを入力してください" maxlength="3" required><br>
					</div>
					<div>
						<label>科目名</label>
						<input id="radius" type="text" name="name"placeholder="科目名を入力してください" required><br>
					</div>
					<div>
						<button id = "button">登録</button>
					</div>
				</div>
			</form>
			<div>
                <a href="../menu/menu.jsp">戻る</a>
            </div>
		</section>
	</c:param>
</c:import>
</body>
</html>


