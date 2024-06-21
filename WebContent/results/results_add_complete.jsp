<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">

		<h2>成績管理</h2>
		<p>登録が完了しました</p>
		<a href="../student/StudentCreate.action">戻る</a>

		<a href="../student/StudentList.action">成績参照</a>
	</c:param>
</c:import>