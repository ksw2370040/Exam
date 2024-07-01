<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">

		<section class="me-4">
			<h2>学生情報登録</h2>
			<form action="SubjectCreateExecute.action" method="get">
				<div id="filter">
					<label>科目コード</label>
					<input id="radius" type="text" name="cd" maxlength="3" required><br>
					<label>科目名</label>
					<input id="radius" type="text" name="name" required><br>
					<div>
						<button>登録して終了</button>
					</div>
				</div>
			</form>
		</section>
	</c:param>
</c:import>