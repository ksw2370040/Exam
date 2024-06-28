package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import tool.Action;

public class LoginAction extends Action{
	public void execute(
		HttpServletRequest req,HttpServletResponse res
	)throws Exception{
	HttpSession session=req.getSession();

	if(session.getAttribute("password")!=null){
		Teacher teacher =(Teacher) session.getAttribute("user");
		session.setAttribute("id",teacher.getId());
		session.setAttribute("password", teacher.getPassword());
		req.getRequestDispatcher("../user/login.jsp").forward(req, res);
	}else{
		req.getRequestDispatcher("../user/login.jsp").forward(req, res);
	}


	}

}