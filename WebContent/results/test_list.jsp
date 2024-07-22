<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
    <link rel="stylesheet" type="text/css" href="../css/student.css">

</head>
<body>
    <c:import url="../common/base.jsp">
        <c:param name="title"></c:param>
        <c:param name="scripts"></c:param>
        <c:param name="content">
            <section class="me-4">
                <h2>学生管理</h2>
                <div class="new">
                    <a href="StudentCreate.action">新規登録</a>
                </div>
                <form method="get">
                    <div id="filter">
                        <div class="form-group">
                            <label for="student-f1-select">入学年度</label>
                            <select id="student-f1-select" name="f1">
                                <option value="0">--------</option>
                                <c:forEach var="year" items="${ent_year_set}">
                                    <option value="${year}" <c:if test="${year==f1 }">selected</c:if>>${year}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label for="student-f2-select">クラス</label>
                            <select id="student-f2-select" name="f2">
                                <option value="0">--------</option>
                                <c:forEach var="num" items="${class_num_set}">
                                    <option value="${num}" <c:if test="${num==f2 }">selected</c:if>>${num}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <label for="student-f3-select">科目名</label>
                            <select id="student-f3-select" name="f3">
                                <option value="0">--------</option>
                                <c:forEach var="sub" items="${subs}">
                                    <option value="${sub.cd}" <c:if test="${sub==f2 }">selected</c:if>>${sub.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <button id="filter-button">絞込み</button>
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
                    <c:otherwise>
                        <div>学生情報が存在しませんでした</div>
                    </c:otherwise>
                </c:choose>
            </section>
        </c:param>
    </c:import>
</body>
</html>
