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
	private String baseSql = "select stu.ent_year, c.class_num, sub.name, t.no from test t join student stu on t.student_no=stu.no join class_num c on t.class_num = c.class_num join subject sub on t.subject_cd=sub.cd where school_cd=?";
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

	private List<Test> postFilter(ResultSet rSet, School school)throws Exception{
		List<Test> list = new ArrayList<>();
		try{
			while (rSet.next()) {
				StudentDao studentDao = new StudentDao();
				SubjectDao subjectDao = new SubjectDao();
				Test test = new Test();
				test.setStudent(studentDao.get(rSet.getString("student_no")));
				test.setSubject(subjectDao.get(rSet.getString("subject_cd"),school));
				test.setSchool(school);
				test.setNo(rSet.getInt("no"));
				test.setPoint(rSet.getInt("point"));
				test.setClassNum(rSet.getString("class_num"));
				list.add(test);
			}
		}catch (SQLException | NullPointerException e){
			e.printStackTrace();
		}
		return list;
	}

	public List<Test> filter(int entYear,String classNum ,Subject subject, int num,School school)throws Exception{
		List<Test> list =new ArrayList<>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rSet = null;
		String condition ="and ent_year=? and class_num=? and subject_cd=? and no=?";
		String order = " order by no asc";
		try{
			statement = connection.prepareStatement(baseSql +" "+ condition  +" "+ order);
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