package subject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.Subject;
import bean.Teacher;
import dao.ClassNumDao;
import dao.SubjectDao;

public class Util{
	public Teacher getUser(HttpServletRequest req)
	throws Exception{
		HttpSession session = req.getSession();
		Teacher user =(Teacher) session.getAttribute("user");
		return user;
	}
public void setClassNum(HttpServletRequest req)
	throws Exception{
		Teacher teacher = getUser(req);
		ClassNumDao cNumDao=new ClassNumDao();
		List<String> list = cNumDao.filter(teacher.getSchool());
		req.setAttribute("class_num_set", list);
	}
public void setEntYearSet(HttpServletRequest req)
	throws Exception{
	HttpSession session = req.getSession();
    String entYearSet = (String) session.getAttribute("ent_year_set");
	req.setAttribute("ent_year_set", entYearSet);
	}
public void setSubject(HttpServletRequest req)
	throws Exception{
		Util util = new Util();
		Teacher user = util.getUser(req);
		String subject_cd= req.getParameter("cd");
		SubjectDao subjectDao= new SubjectDao();
		Subject subject = subjectDao.get(subject_cd,user.getSchool());
		req.setAttribute("subject", subject);
	}
public void setNumSet(HttpServletRequest req)
	throws Exception{

	}
}