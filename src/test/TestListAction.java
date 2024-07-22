package test;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import bean.Teacher;
import bean.TestListSubject;
import dao.ClassNumDao;
import dao.SubjectDao;
import dao.TestListSubjectDao;
import tool.Action;
import tool.Util;

public class TestListAction extends Action{
	public void execute(
			HttpServletRequest req,HttpServletResponse res
		)throws Exception{
			Util util=new Util();
			Subject subject = new Subject();
			SubjectDao subDao = new SubjectDao();

			Teacher teacher =util.getUser(req);

			String entYearStr=req.getParameter("f1");
			String classNum=req.getParameter("f2");
			String subjectCd=req.getParameter("f3");

			int entYear=0;
			List<TestListSubject> TLsub=new ArrayList<>();
			LocalDate todaysDate=LocalDate.now();
			int year=todaysDate.getYear();
			TestListSubjectDao TLsubDao=new TestListSubjectDao();
			ClassNumDao cNumDao=new ClassNumDao();

			List<String> list = cNumDao.filter(teacher.getSchool());

			subject.setCd(subjectCd);

			if (entYearStr != null){
				entYear = Integer.parseInt(entYearStr);
			}


			if (entYear != 0 && !classNum.equals("0")&& !subjectCd.equals("0")){
				TLsub = TLsubDao.filter(entYear,classNum,subject,teacher.getSchool());
			}

			List<Integer> entYearSet = new ArrayList<>();
			for (int i = year - 10; i < year +1; i++){
				entYearSet.add(i);
			}
			List<Subject> subjectSet = new ArrayList<>();
			subjectSet = subDao.filter(teacher.getSchool());


			req.setAttribute("f1", entYear);
			req.setAttribute("f2", classNum);
			req.setAttribute("f3", subject);
			req.setAttribute("TLsubs", TLsub);
			req.setAttribute("subs", subjectSet);
			req.setAttribute("class_num_set", list);
			req.setAttribute("ent_year_set", entYearSet);

			req.getRequestDispatcher("../results/test_list.jsp").forward(req, res);
		}

}