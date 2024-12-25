package poly.entity;

public class Emlpoyee {
	String id;
	String password;
	String fullName;
	String photo;
	boolean gender;
	String birthday;
	int salary;
	String departmentID;
	
	public Emlpoyee() {
		// TODO Auto-generated constructor stub
	}

	public Emlpoyee(String id, String password, String fullName, String photo, boolean gender, String birthday,
			int salary, String departmentID) {
		super();
		this.id = id;
		this.password = password;
		this.fullName = fullName;
		this.photo = photo;
		this.gender = gender;
		this.birthday = birthday;
		this.salary = salary;
		this.departmentID = departmentID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getDepartmentID() {
		return departmentID;
	}

	public void setDepartmentID(String departmentID) {
		this.departmentID = departmentID;
	}
	
	
}
