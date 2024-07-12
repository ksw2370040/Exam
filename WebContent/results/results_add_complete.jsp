<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../common/base.jsp">

	<c:param name="title"></c:param>
	<c:param name="scripts"></c:param>
	<c:param name="content">
	<div style = "margin-left: 28%;">
		<div style = "width: 85%;">
			<div style="background-color: #dddddd;">
				<h2>成績管理</h2>
			</div>
			<div style="background-color: #339966;">
				<div style="text-align: center;">
					<p>登録が完了しました</p>
				</div>
			</div>
		</div>
	</div>
		<p><a href="../results/TestRegist2.action">戻る</a>
		&ensp; &ensp; &ensp; &ensp; &ensp;
		<a href="../results/TestList.action">成績参照</a></p>
	</c:param>
</c:import>