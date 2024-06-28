<<<<<<< HEAD
package bean;

public class Subject implements java.io.Serializable {
    private static final long serialVersionUID = 1L;

    private String schoolCd;
    private String cd;
    private String name;

    // コンストラクタ、ゲッター、セッターは省略

    public String getSchoolCd() {
        return schoolCd;
    }

    public void setSchoolCd(String schoolCd) {
        this.schoolCd = schoolCd;
    }

    public String getCd() {
        return cd;
    }

    public void setCd(String cd) {
        this.cd = cd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
=======
package bean;

public class Subject implements java.io.Serializable {
    private School school;
    private String cd;
    private String name;

    public School getSchool() {
        return school;
    }
    public void setSchool(School school){
    	this.school=school;
    }
    public String getCd(){
    	return cd;
    }
    public void setCd(String cd){
    	this.cd=cd;
    }
    public String getName(){
    	return name;
    }
    public void setName(String name){
    	this.name=name;
    }
}
>>>>>>> branch 'master' of https://github.com/ksw2370040/Exam.git
