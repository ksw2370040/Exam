package subject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class SubjectUpdateAction extends Action{
	public void execute(
			HttpServletRequest req,HttpServletResponse res
		)throws Exception{
			Util util = new Util();
			util.setSubject(req);
			req.getRequestDispatcher("../subject/subject_update.jsp").forward(req, res);


	}
}