import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterStudentServlet")
public class RegisterStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("studentId");
        String name = request.getParameter("name");
        
        // ここで学生番号の重複チェックを行う
        boolean isDuplicate = checkStudentIdDuplicate(studentId);
        
        if (isDuplicate) {
            // エラーメッセージを設定
            request.setAttribute("errorMessage", "学生番号が重複しています。");
            // JSP ページにフォワード
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        } else {
            // 学生情報を登録する処理
            registerStudent(studentId, name);
            // 成功した場合はリダイレクトなど適切な処理を行う
            response.sendRedirect("success.jsp");
        }
    }

    private boolean checkStudentIdDuplicate(String studentId) {
        // ここで実際の重複チェックを行う
        // 仮の実装
        return "12345".equals(studentId); // 学生番号 "12345" が既に存在する場合
    }
    
    private void registerStudent(String studentId, String name) {
        // 学生情報を登録する処理
    }
}
^