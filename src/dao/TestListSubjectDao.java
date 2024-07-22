package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.School;
import bean.Subject;
import bean.TestListSubject;

public class TestListSubjectDao extends Dao{
	private String baseSql = "SELECT DISTINCT "+
		    "STUDENT.ENT_YEAR as ent_year, "+
		    "STUDENT.NO AS student_no, "+
		    "STUDENT.NAME AS student_name, "+
		    "STUDENT.class_num AS class_num, "+
		    "TEST1.no as no1, "+
		    "TEST1.point as point1, "+
		    "TEST2.no as no2, "+
		    "TEST2.point as point2 "+
		"FROM STUDENT "+
		"LEFT JOIN TEST AS TEST1 ON TEST1.STUDENT_NO = STUDENT.NO AND TEST1.no = 1 "+
		"LEFT JOIN TEST AS TEST2 ON TEST2.STUDENT_NO = STUDENT.NO AND TEST2.no = 2 "+
		"WHERE STUDENT.SCHOOL_CD = ? "+
		  "AND STUDENT.ENT_YEAR = ? "+
		  "AND TEST1.CLASS_NUM = ? "+
		  "AND TEST1.SUBJECT_CD = ?";


	private List<TestListSubject> postFilter(ResultSet rSet)throws Exception{
		List<TestListSubject> list = new ArrayList<>();
		try{
			while (rSet.next()) {
				TestListSubject TLS = new TestListSubject();
				String student_name = rSet.getString("student_name");
				String student_no = rSet.getString("student_no");
				String class_num = rSet.getString("class_num");
				int ent_year = rSet.getInt("ent_year");
				int no1 = rSet.getInt("no1");
				int point1 = rSet.getInt("point1");
				int no2 = rSet.getInt("no2");
				int point2 = rSet.getInt("point2");
				Map<Integer, Integer> points = new HashMap<>();
				points.put(no1, point1);
				points.put(no2, point2);


				TLS.setStudentName(student_name);
				TLS.setStudentNo(student_no);
				TLS.setClassNum(class_num);
				TLS.setEntYear(ent_year);
				TLS.setPoints(points);
				list.add(TLS);
			}
		}catch (SQLException | NullPointerException e){
			e.printStackTrace();
		}
		return list;
	}
	public List<TestListSubject> filter(int entYear,String classNum,Subject subject,School school) throws Exception {
		List<TestListSubject> list =new ArrayList<>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		statement = connection.prepareStatement(baseSql);
		statement.setString(1, school.getCd());
		statement.setInt(2, entYear);
		statement.setString(3, classNum);
		statement.setString(4, school.getCd());
		rSet = statement.executeQuery();
		list = postFilter(rSet);

		return list;
	}
}

