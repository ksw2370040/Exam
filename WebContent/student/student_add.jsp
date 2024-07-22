<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
    <link rel="stylesheet" type="text/css" href="../css/student-add.css">
    <script>
        function validateForm() {
            var f1Select = document.getElementById('student-f1-create');
            var f2Select = document.getElementById('student-f2-create');
            var f1Error = document.getElementById('f1-error');
            var f2Error = document.getElementById('f2-error');
            var studentNo = document.getElementById('student-no');
            var studentName = document.getElementById('student-name');
            var studentNoError = document.getElementById('student-no-error');
            var studentNameError = document.getElementById('student-name-error');

            f1Error.style.display = f1Select.value === '0' ? 'block' : 'none';
            f2Error.style.display = f2Select.value === '0' ? 'block' : 'none';
            studentNoError.style.display = studentNo.value.trim() === '' ? 'block' : 'none';
            studentNameError.style.display = studentName.value.trim() === '' ? 'block' : 'none';


            return f1Select.value !== '0' && f2Select.value !== '0' && studentNo.value.trim() !== '' && studentName.value.trim() !== '';
        }
    </script>
</head>
<body>
<c:import url="../common/base.jsp">
    <c:param name="title"></c:param>
    <c:param name="scripts"></c:param>
    <c:param name="content">
        <section class="me-4">
            <h2>学生情報登録</h2>
            <form action="StudentCreateExecute.action" method="get" onsubmit="return validateForm()">
                <div id="filter">
                    <div>
                        <label for="student-f1-create">入学年度</label>
                        <select id="student-f1-create" name="ent_year">
                            <option value="0">--------</option>
                            <c:forEach var="year" items="${ent_year_set}">
                                <option value="${year}" <c:if test="${year==ent_year }">selected</c:if>>${year}</option>
                            </c:forEach>
                        </select>
                        <div id="f1-error" class="error-message" style="display:none;">選択してください。</div>
                    </div>
                    <div>
                        <label for="student-no">学生番号</label>
                        <input id="student-no" type="text" name="no" placeholder="学生番号を入力してください" maxlength="10" required>
                        <div id="student-no-error" class="error-message" style="display:none;">学生番号を入力してください。</div>
                    </div>
                    <div>
                        <label for="student-name">氏名</label>
                        <input id="student-name" type="text" name="name" placeholder="氏名を入力してください" maxlength="30" required>
                        <div id="student-name-error" class="error-message" style="display:none;">氏名を入力してください。</div>
                    </div>
                    <div>
                        <label for="student-f2-create">クラス</label>
                        <select id="student-f2-create" name="class_num">
                            <option value="0">--------</option>
                            <c:forEach var="num" items="${class_num_set}">
                                <option value="${num}" <c:if test="${num==class_num}">selected</c:if>>${num}</option>
                            </c:forEach>
                        </select>
                        <div id="f2-error" class="error-message" style="display:none;">選択してください。</div>
                    </div>
                </div>
                <button id="filter-button">登録して終了</button>
                <div>${errors.get("f1")}</div>
            </form>
            <p></p>
            <div>
                <a href="../student/StudentList.action">戻る</a>
            </div>
        </section>
    </c:param>
</c:import>
</body>
</html>
