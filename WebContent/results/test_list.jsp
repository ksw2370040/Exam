<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>成績参照</title>
<link rel="stylesheet" type="text/css" href="../css/test_list.css">

</head>
<body>
<c:import url="../common/base.jsp">
<c:param name="title"></c:param>
<c:param name="scripts"></c:param>
<c:param name="content">
<section class="me-4">
<h2>成績参照</h2>

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
<c:forEach var="stubject" items="${subs}">
<option value="${sub.cd}" <c:if test="${sub==f3 }">selected</c:if>>${stubject}</option>
</c:forEach>
</select>
</div>
<div>
<button id="filter-button" type="submit">検索</button>
</div>
</div>
</form>

                <form method="get">
<div id="filter">
<div class="form-group">
<p>学生情報</p>
<label for="student-f4-input">学生番号</label>
<input type="text" id="student-f4-input" name="f4" value="${f4}" maxlength="10" required placeholder="学生番号を入力してください">
</div>
<div>
<button id="filter-button" type="submit">検索</button>
</div>
</div>
</form>

                <c:choose>
<c:when test="${TLsubs.size()>0}">
<div>科目: ${subs.name}</div>
<table>
<tr>
<th>入学年度</th>
<th>クラス</th>
<th>学生番号</th>
<th>氏名</th>
<th>１回目</th>
<th>２回目</th>
<th></th>
<th></th>
</tr>
<c:forEach var="TLsub" items="${TLsubs}">
<tr>
<td>${TLsub.entYear}</td>
<td>${TLsub.classNum}</td>
<td>${TLsub.studentNo}</td>
<td>${TLsub.studentName}</td>
<td>${TLsub.points1}</td>
<td>${TLsub.points2}</td>
</tr>
</c:forEach>
</table>
</c:when>

                </c:choose>

                <div class="info-message">
<p><label>科目情報を選択または学生情報を入力して検索ボタンをクリックしてください</label></p>
</div>
<input type="hidden" id="subject-code" name="sj" value="${selectedSubjectCode}">
<input type="hidden" id="student-code" name="st" value="${selectedStudentCode}">

            </section>
</c:param>
</c:import>
</body>
</html>