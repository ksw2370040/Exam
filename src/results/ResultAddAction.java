package results;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import bean.Subject;
import dao.ResultDao;
import tool.Action;

public class ResultCreateExecuteAction extends Action {
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        Util util = new Util();
        Student student = util.getStudent(req);
        Subject subject = util.getSubject(req);

        String resultValue = req.getParameter("result");

        Result result = new Result();
        result.setStudent(student);
        result.setSubject(subject);
        result.setValue(resultValue);

        ResultDao dao = new ResultDao();
        dao.save(result);

        req.getRequestDispatcher("../results/results_add_complete.jsp").forward(req, res);
    }
}
