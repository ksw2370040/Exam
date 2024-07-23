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
                <h2>成績参照</h2>
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
                                    <option value="${sub.cd}" <c:if test="${sub.cd==f2 }">selected</c:if>>${sub.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                            <button id="filter-button">絞込み</button>
                        </div>
                    </div>
                </form>
                <form method="get">
                    <div id="filter">
                        <div class="form-group">
                            <label for="student-f1-select">学生番号</label>
							<input id="subject-name" type="text" name="f4" >
                        </div>
                     	<div>
                            <button id="filter-button">絞込み</button>
                        </div>

                     </div>
                </form>
                <c:choose>
                    <c:when test="${TLsubs.size()>0}">
					        <c:forEach var="sub" items="${subs}">
					            <c:if test="${sub.cd == f3}">
					                <div>科目: ${sub.name}</div>
					            </c:if>
					        </c:forEach>
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
					                <td>
					                    <c:forEach var="entry" items="${TLsub.points}">
					                        <c:if test="${entry.key == 1}">
					                            <c:if test="${not empty entry}">
					                            	<c:out value="${entry.value}"/>
					                   	     	</c:if>
					                   	     	<c:if test="${empty entry}">
					                            	<c:out value="-"/>
					                   	     	</c:if>

					   	                     </c:if>
					                    </c:forEach>
					                </td>
					                <td>
					                    <c:forEach var="entry" items="${TLsub.points}">
					                        <c:if test="${entry.key == 2}">
					                            <c:if test="${not empty entry}">
					                            	<c:out value="${entry.value}"/>
					                   	     	</c:if>
					                   	     	<c:if test="${empty entry}">
					                            	<c:out value="-"/>
					                   	     	</c:if>

					   	                     </c:if>
					                    </c:forEach>
					                </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:when test="${TLstus.size()>0}">
					    <div>氏名: ${stu.name}(${stu.no})</div>
                        <table>
                            <tr>
                                <th>科目名</th>
                                <th>科目コード</th>
                                <th>回数</th>
                                <th>点数</th>
                                <th></th>
								<th></th>
							</tr>
                            <c:forEach var="TLstu" items="${TLstus}">
                                <tr>
                                    <td>${TLstu.subjectName}</td>
                                    <td>${TLstu.subjectCd}</td>
                                    <td>${TLstu.num}</td>
                                    <td>${TLstu.point}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div>情報が存在しませんでした</div>
                    </c:otherwise>
                </c:choose>
            </section>
        </c:param>
    </c:import>
</body>
</html>
