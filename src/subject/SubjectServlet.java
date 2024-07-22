package subject;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/subject_add")
public class SubjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private SubjectService subjectService = new SubjectService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> existingSubjectCodes = subjectService.getAllSubjectCodes();
        request.setAttribute("existingSubjectCodes", existingSubjectCodes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/subject/subject_add.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newCode = request.getParameter("cd");
        List<String> existingSubjectCodes = subjectService.getAllSubjectCodes();

        if (existingSubjectCodes.contains(newCode)) {
            request.setAttribute("error", "この科目コードは既に存在します。");
            doGet(request, response); // doGetを呼び出してフォームを再表示
        } else {
            // 新しい科目コードを保存する処理（ここでは省略）
            response.sendRedirect(request.getContextPath() + "/subject_add"); // 登録成功後、再表示
        }
    }
}
