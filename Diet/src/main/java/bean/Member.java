package bean;

public class Member {
	long Id;
	String userName;
	String password;
	String email;
	String menuType;
	String sportType;
	String type;

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		Id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
		if(this.menuType == null) {
			this.menuType = "테스트를 통해 나의 식단유형을 알아보세요!";
		}
	}

	public String getSportType() {
		return sportType;
	}

	public void setSportType(String sportType) {
		this.sportType = sportType;
		if(this.sportType == null) {
			this.sportType = "테스트를 통해 나의 운동유형을 알아보세요!";
		}
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
