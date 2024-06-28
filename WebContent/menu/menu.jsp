<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">

	<div class = "menu">
	    <h2>メニュー</h2>
	</div>

	<div class  = "sub">
            <a href = "../student/StudentList.action">学生管理</a>
        </div>

        <div class  = "sub2">
            <p>成績管理</p>
            <a href = "">成績登録</a><br><br>
            <a href = "">成績参照</a>
        </div>

        <div class  = "sub3">
            <a href = "../subject/SubjectList.action">科目管理</a>
        </div>

	</c:param>


</c:import>