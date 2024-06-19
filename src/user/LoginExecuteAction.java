package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDAO;
import tool.Action;

public class LoginExecuteAction extends Action{
	public void execute(
		HttpServletRequest req,HttpServletResponse res
	)throws Exception{

	HttpSession session=req.getSession();

	String id =req.getParameter("id");
	String password=req.getParameter("password");
	TeacherDAO dao=new TeacherDAO();
	Teacher user=dao.get(id, password);
	if(user==null){
		req.getRequestDispatcher("../user/login.jsp").forward(req, res);

	}else
	session.setAttribute("user",user);
	req.getRequestDispatcher("../menu/menu.jsp").forward(req, res);
	}
}