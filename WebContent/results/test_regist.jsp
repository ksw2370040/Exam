<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../common/base.jsp">
    <c:param name="title">成績管理</c:param>
    <c:param name="scripts"></c:param>
    <c:param name="content">
        <div class="container">
            <h2>成績管理</h2>

            <form action="../student/TestRegistAction" method="get">
                <table>
                    <tr>
                        <th>入学年度</th>
                        <th>クラス</th>
                        <th>科目</th>
                        <th>回数</th>
                    </tr>
                    <tr>
                        <td>
                            <select name="year">
                                <c:forEach var="year" items="${years}">
                                    <option value="${year}">${year}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <select name="classNum">
                                <c:forEach var="classNum" items="${classes}">
                                    <option value="${classNum}">${classNum}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <select name="subjectCd">
                                <c:forEach var="subject" items="${subjects}">
                                    <option value="${subject.cd}">${subject.name}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <select name="testNum">
                                <c:forEach var="testNum" items="${testNumbers}">
                                    <option value="${testNum}">${testNum}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>

                <div style="margin-top: 20px;">
                    <button type="submit">検索</button>
                </div>
            </form>

            <c:if test="${not empty testResults}">
                <h2>成績情報検索結果</h2>

                <table border="1">
                    <thead>
                        <tr>
                            <th>入学年度</th>
                            <th>クラス</th>
                            <th>学生番号</th>
                            <th>氏名</th>
                            <th>点数</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="result" items="${testResults}">
                            <tr>
                                <td>${result.entYear}</td>
                                <td>${result.classNum}</td>
                                <td>${result.studentNo}</td>
                                <td>${result.studentName}</td>
                                <td>
                                    <form action="test_regist_done.jsp" method="post">
                                        <input type="hidden" name="studentNo" value="${result.studentNo}">
                                        <input type="number" name="point_${result.studentNo}"
                                               value="${result.point}" min="0" max="100">
                                        <input type="submit" value="更新">
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div style="margin-top: 20px;">
                    <form action="test_regist_done.jsp" method="post">
                        <input type="submit" class="button" value="登録して終了">
                    </form>
                </div>
            </c:if>
        </div>
    </c:param>
</c:import>
