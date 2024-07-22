<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">
		<section class="me-4">

            <h2>成績一覧(科目)</h2>

            <form method="get">
                <div id="filter">

                    <div class="form-group">
                    	<p>科目情報</p>
                        <label for="student-f1-select">入学年度</label>
                        <select id="student-f1-select" name="f1">
                            <option value="0">--------</option>
                            <c:forEach var="year" items="${ent_year_set}">
                                <option value="${year}" <c:if test="${year==f1 }">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="student-f2-select">クラス</label>
                        <select id="student-f2-select" name="f2">
                            <option value="0">--------</option>
                            <c:forEach var="num" items="${class_num_set}">
                                <option value="${num}" <c:if test="${num==f2 }">selected</c:if>>${num}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="student-f3-select">科目</label>
                        <select id="student-f3-select" name="f3">
                            <option value="0">--------</option>
                            <c:forEach var="stubject" items="${stubject_set}">
                                <option value="${stubject}" <c:if test="${stubject==f3 }">selected</c:if>>${stubject}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <button id="filter-button" type="submit">検索</button>
                    </div>

                    <div class="form-group">
                    	<p>学生情報</p>
                        <label for="student-f4-select">学生番号</label>
                        <select id="student-f4-select" name="f4">
                            <option value="0">--------</option>
                            <c:forEach var="stubject" items="${stubject_set}">
                                <option value="${stubject}" <c:if test="${stubject==f4 }">selected</c:if>>${stubject}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <button id="filter-button" type="submit">検索</button>
                    </div>
                </div>
            </form>

			<table>
				<tr>
			 		<th>入学年度</th>
			 		<th>クラス</th>
			 		<th>学生番号</th>
			 		<th>氏名</th>
			 		<th>１回</th>
			 		<th>２回</th>
			 	</tr>
			 	<tr>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 		<td></td>
			 	</tr>
			 </table>

		</section>
	</c:param>
</c:import>
