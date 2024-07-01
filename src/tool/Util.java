package tool;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import bean.Student;
import bean.Subject;
import bean.Teacher;
import dao.ClassNumDao;
import dao.StudentDao;
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
	Teacher teacher = getUser(req);
	List<Student> students=null;
	StudentDao sDao=new StudentDao();
	boolean isAttend = true;
	students = sDao.filter(teacher.getSchool(), isAttend);
	req.setAttribute("students", students);
	}
public void setSubject(HttpServletRequest req)
	throws Exception{
	Teacher user = getUser(req);
	String subject_cd= req.getParameter("cd");
	SubjectDao subjectDao= new SubjectDao();
	Subject subject = subjectDao.get(subject_cd,user.getSchool());
	req.setAttribute("subject", subject);
	}
public void setNumSet(HttpServletRequest req)
	throws Exception{
	int num = 0;
	List<Integer> number = new ArrayList<>();
	for (int i = num + 10; i <= num+1; i++){
	number.add(i);
	}
	req.setAttribute("number", number);
	}
}
