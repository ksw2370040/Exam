<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Student" %>
<%@ page import="bean.ClassNum" %>
<%@ page import="bean.School" %>

<c:import url="../common/base.jsp">
    <c:param name="title"></c:param>
    <c:param name="scripts"></c:param>
    <c:param name="content">
        <div class="container">
            <h2>学生情報一覧</h2>

            <%-- データベース接続情報 --%>
            <%@ page import="java.sql.DriverManager" %>
            <%@ page import="java.sql.SQLException" %>

            <%
                String url = "jdbc:mysql://localhost:3306/yourdatabase";
                String user = "yourusername";
                String password = "yourpassword";

                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;

                try {
                    // データベース接続を確立
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(url, user, password);

                    // SQLクエリの準備（例としてテーブル名やカラム名は適宜変更する必要があります）
                    String sql = "SELECT NO, NAME, ENT_YEAR, CLASS_NUM, IS_ATTEND, SCHOOL_CD FROM student";
                    statement = connection.prepareStatement(sql);
                    resultSet = statement.executeQuery();

                    // 検索結果をリストに格納
                    List<Student> students = new ArrayList<>();
                    while (resultSet.next()) {
                        String studentNo = resultSet.getString("NO");
                        String name = resultSet.getString("NAME");
                        int entYear = resultSet.getInt("ENT_YEAR");
                        String classNum = resultSet.getString("CLASS_NUM");
                        boolean isAttend = resultSet.getBoolean("IS_ATTEND");
                        String schoolCd = resultSet.getString("SCHOOL_CD");

                        Student student = new Student();
                        student.setNo(studentNo);
                        student.setName(name);
                        student.setEntYear(entYear);
                        student.setClassNum(classNum);
                        student.setIsAttend(isAttend);
                        student.setSchool(school);

                        students.add(student);
                    }

                    // リクエストスコープに検索結果をセット
                    request.setAttribute("students", students);

                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) resultSet.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>

            <%-- 検索結果をテーブル形式で表示 --%>
            <table border="1">
                <thead>
                    <tr>
                        <th>学生番号</th>
                        <th>氏名</th>
                        <th>入学年度</th>
                        <th>クラス番号</th>
                        <th>出席フラグ</th>
                        <th>学校コード</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${students}">
                        <tr>
                            <td>${student.no}</td>
                            <td>${student.name}</td>
                            <td>${student.entYear}</td>
                            <td>${student.classNum}</td>
                            <td>${student.attend}</td>
                            <td>${student.schoolCd}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
    </c:param>
</c:import>
