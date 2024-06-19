<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">

		<section class="me-4">
			<h2>学生情報登録</h2>
			<form action="StudentCreateExecute.action" method="get">
				<div id="filter">
					<div>
						<label>入学年度</label>
						<select id="student-f1-create" name="ent_year">
							<option value="0">--------</option>
							<c:forEach var="year" items="${ent_year_set}">
								<option value="${year}" <c:if test="${year==ent_year }">selected</c:if>>${year}</option>
							</c:forEach>
						</select>
					</div>
					<label>学生番号</label>
					<input id="radius" type="text" name="no" required><br>
					<label>氏名</label>
					<input id="radius" type="text" name="name" required><br>
					<div>
						<label for="student-f2-create">クラス</label>
						<select  name="class_num">
							<option value="0">--------</option>
							<c:forEach var="num" items="${class_num_set}">
								<option value="${num}" <c:if test="${num==class_num}">selected</c:if>>${num}</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<button>登録して終了</button>
					</div>
					<div>${errors.get("f1")}</div>
				</div>
			</form>
		</section>
	</c:param>
</c:import>