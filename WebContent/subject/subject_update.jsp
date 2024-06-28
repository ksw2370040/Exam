<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">

			<form action="SubjectUpdateExecute.action" method="get">
				<div id="filter">
					<div>
						<label>科目コード</label>
						<p>${subject.cd}</p>
						<input id="radius" type="hidden" name="cd" value="${subject.cd}" required><br>
					</div>
					<div>
						<label>科目名</label>
						<input id="radius" type="text" name="name" value="${subject.name}" required><br>

					</div>
					<div>
						<button>変更</button>
					</div>
				</div>
			</form>
	</c:param>
</c:import>