package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.School;
import bean.Student;
import bean.Subject;
import bean.Test;

public class TestDao extends Dao{
	private String baseSql =
			"SELECT student.no as student_no,subject.cd as subject_cd,student.school_cd as school_cd ,coalesce(test.no,1) as no ,coalesce(point,0) as point ,student.class_num as class_num  FROM STUDENT "+
			"left join TEST on TEST.STUDENT_NO = STUDENT.NO "+
			"left join SUBJECT on SUBJECT.SCHOOL_CD =STUDENT.SCHOOL_CD where STUDENT.SCHOOL_CD =? ";
	public Test get(Student student,Subject subject,School school,int no) throws Exception{
		Test test = new Test();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		try{
			statement =connection.prepareStatement("select * from test where student_no=? and subject_cd=? and school_cd=? and no=?");
			statement.setString(1, student.getNo());
			statement.setString(2, subject.getCd());
			statement.setString(3, school.getCd());
			statement.setInt(4, no);
			ResultSet rSet = statement.executeQuery();
			SchoolDao schoolDao = new SchoolDao();
			StudentDao studentDao = new StudentDao();
			SubjectDao subjectDao = new SubjectDao();
			if (rSet.next()){
				test.setStudent(studentDao.get(rSet.getString("student_no")));
				test.setSubject(subjectDao.get(rSet.getString("subject_cd"),schoolDao.get(rSet.getString("school_cd"))));
				test.setSchool(schoolDao.get(rSet.getString("school_cd")));
				test.setNo(rSet.getInt("no"));
				test.setPoint(rSet.getInt("point"));
				test.setClassNum(rSet.getString("class_num"));
			}else{
				student = null;
			}
		}catch(Exception e){
			throw e;
		}finally{
			if(statement != null){
				try{
					statement.close();
				}catch  (SQLException sqle){
					throw sqle;
				}
			}
			if (connection != null){
				try{
					connection.close();
				}catch (SQLException sqle){
					throw sqle;
				}
			}
		}
		return test;

	}

	private List<Test> postFilter(ResultSet rSet, School school) throws Exception {
	    List<Test> list = new ArrayList<>();
	    try {
	        while (rSet.next()) {
	            String studentNo = rSet.getString("student_no");  // Assuming "student_no" is the correct column name
	            String subjectCd = rSet.getString("subject_cd");  // Assuming "subject_cd" is the correct column name

	            StudentDao stuDao = new StudentDao();
	            Student student = stuDao.get(studentNo);  // Use the actual student number retrieved from ResultSet

	            SubjectDao subDao = new SubjectDao();
	            Subject subject = subDao.get(subjectCd, school);  // Use the actual subject code and school

	            Test test = new Test();
	            test.setSchool(school);
	            test.setNo(rSet.getInt("no"));
	            test.setClassNum(rSet.getString("class_num"));
	            test.setPoint(rSet.getInt("point"));
	            test.setStudent(student);
	            test.setSubject(subject);

	            list.add(test);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        throw e;  // Rethrow SQLException for handling at higher level if needed
	    }
	    return list;
	}

	public List<Test> filter(int entYear,String classNum ,Subject subject, int num,School school)throws Exception{
		List<Test> list =new ArrayList<>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
        String condition = " AND STUDENT.ENT_YEAR =? AND STUDENT.CLASS_NUM = ? AND SUBJECT.CD = ? AND COALESCE(TEST.NO, 1) = ?";

		try{
			statement = connection.prepareStatement(baseSql +" "+ condition );
			statement.setString(1, school.getCd());
			statement.setInt(2, entYear);
			statement.setString(3, classNum);
			statement .setString(4, subject.getCd());
			statement.setInt(5, num);
			rSet = statement.executeQuery();
			list = postFilter(rSet, school);
		}catch (Exception e){
			throw e;
		}finally{
			if (statement != null){
				try{
					statement.close();
				}catch (SQLException sqle){
					throw sqle;
				}
			}
			if (connection != null){
				try{
					connection.close();
				}catch (SQLException sqle){
					throw sqle;
				}
			}
		}
		return list;
	}

	public boolean save(List<Test> list) throws Exception {
	    Connection connection = null;
	    boolean result = false;
	    try {
	        connection = getConnection();
	        for (Test test : list) {
	            result = save(test, connection);
	        }
	    } catch (Exception e) {
	        throw e;
	    } finally {
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException sqle) {
	                throw sqle;
	            }
	        }
	    }

	    return result;
	}
	private boolean save(Test test ,Connection connection)throws Exception{
		connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;
		try{
			Test old = get(test.getStudent(),test.getSubject(),test.getSchool(),test.getNo());
			if (old == null){
				statement = connection.prepareStatement(
						"insert into test(student_no, subject_cd, school_cd, no, point, class_num) values(?,?,?,?,?,?)");
				statement.setString(1, test.getStudent().getNo());
				statement.setString(2, test.getSubject().getCd());
				statement.setString(3, test.getSchool().getCd());
				statement.setInt(4, test.getNo());
				statement.setInt(5, test.getPoint());
				statement.setString(6, test.getClassNum());
			}else{
				statement = connection.prepareStatement("update test point=? where student_no=? and subject_cd=? and school_cd=? and no=?");
				statement.setInt(1, test.getPoint());
				statement.setString(2, test.getStudent().getNo());
				statement.setString(3, test.getSubject().getCd());
				statement.setString(4, test.getSchool().getCd());
				statement.setInt(5, test.getNo());

			}
			count = statement.executeUpdate();
		}catch (Exception e){
			throw e;
		}finally{
			if (statement != null){
				try{
					statement.close();
				}catch (SQLException sqle){
					throw sqle;
				}
			}
			if (connection != null){
				try{
					connection.close();
				}catch (SQLException sqle){
					throw sqle;
				}
			}
		}
		if(count > 0){
			return true;
		}else{
			return false ;
		}
	}
	public boolean delete(List<Test> list)throws Exception{
	    Connection connection = null;
	    boolean result = false;
	    try {
	        connection = getConnection();
	        for (Test test : list) {
	            result = delete(test, connection);
	        }
	    } catch (Exception e) {
	        throw e;
	    } finally {
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (SQLException sqle) {
	                throw sqle;
	            }
	        }
	     }
	    return result;

	}
	private boolean delete(Test test, Connection connection) throws Exception{
		connection = getConnection();
		PreparedStatement statement = null;
		int count = 0;

		try{
			statement =connection.prepareStatement("delete from test where student_no=? and subject_cd=? and school_cd=? and no=?");
			statement.setInt(1, test.getPoint());
			statement.setString(2, test.getStudent().getNo());
			statement.setString(3, test.getSubject().getCd());
			statement.setString(4, test.getSchool().getCd());
			statement.setInt(5, test.getNo());
			statement.executeUpdate();
			count = statement.executeUpdate();
		}catch (Exception e){
			throw e;
		}finally{
			if (statement != null){
				try{
					statement.close();
				}catch (SQLException sqle){
					throw sqle;
				}
			}
			if (connection != null){
				try{
					connection.close();
				}catch (SQLException sqle){
					throw sqle;
				}
			}
		}
		if(count > 0){
			return true;
		}else{
			return false ;
		}

	}
}