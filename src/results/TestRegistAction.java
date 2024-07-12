package results;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import bean.Teacher;
import bean.Test;
import tool.Util;

@WebServlet("/TestRegistAction")
public class TestRegistAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // データベース接続情報
        String url = "jdbc:h2:tcp://localhost/~/JSE";
        String user = "sa";
        String password = "";

        List<Test> testResults = new ArrayList<>();
        List<Subject> subjects = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            // 成績情報を取得
            String sql = "SELECT STUDENT_NO, SUBJECT_CD, SCHOOL_CD, NO, POINT, CLASS_NUM FROM test";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        Test result = new Test();
                        result.setStudent(resultSet.getString("STUDENT_NO"));
                        result.setSubject(resultSet.getString("SUBJECT_CD"));
                        result.setSchool(resultSet.getString("SCHOOL_CD"));
                        result.setNo(resultSet.getInt("NO"));
                        result.setPoint(resultSet.getInt("POINT"));
                        result.setClassNum(resultSet.getString("CLASS_NUM"));
                        testResults.add(result);
                    }
                }
            }

            // 科目情報を取得
            sql = "SELECT SCHOOL_CD, CD, NAME FROM subject";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                    	Util util = new Util();
                    	Teacher teacher=util.getUser(request);
                        Subject subject = new Subject();
                        subject.setSchool(teacher.getSchool());
                        subject.setCd(resultSet.getString("CD"));
                        subject.setName(resultSet.getString("NAME"));
                        subjects.add(subject);
                    }
                } catch (Exception e) {
					// TODO 自動生成された catch ブロック
					e.printStackTrace();
				}
            }

            // リクエストスコープに設定
            request.setAttribute("testResults", testResults);
            request.setAttribute("subjects", subjects);

            // JSPにフォワード
            request.getRequestDispatcher("../results/test_regist.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
