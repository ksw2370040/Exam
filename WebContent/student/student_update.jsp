<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">

			<form action="StudentUpdateExecute.action" method="get">
				<div id="filter">
					<div>
						<label>入学年度</label>
						<p>${student.entYear}</p>
						<input id="radius" type="hidden" name="ent_year" value="${student.entYear}" required><br>
					</div>
					<div>
						<label>学生番号</label>
						<p>${student.no}</p>
						<input id="radius" type="hidden" name="no" value="${student.no}" required><br>

					</div>
					<div>
						<label>氏名</label>
						<input id="radius" type="text" name="name" value="${student.name}" required><br>

					</div>
					<div>
						<label>クラス</label>
						<select name="class_num">
							<option value="0">${student.classNum}</option>
							<c:forEach var="num" items="${class_num_set}">
								<option value="${num}" <c:if test="${num==class_num}">selected</c:if>>${num}</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<label>在学中
							<input type="checkbox" name="isAttend" value="t"
							<c:if test="${!empty isAttend}">checked</c:if>>
						</label>
					</div>
					<div>
						<button>変更</button>
					</div>
					<div>${errors.get("f1")}</div>
				</div>
			</form>
	</c:param>
</c:import>