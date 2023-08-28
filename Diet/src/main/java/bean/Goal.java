package bean;

import java.util.*;

public class Goal {
	long id;
	long memberId;
	long scheduleId;
	String goal;
	Date achieveDate;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public long getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(long scheduleId) {
		this.scheduleId = scheduleId;
	}
	public Date getAchieveDate() {
		return achieveDate;
	}
	public void setAchieveDate(Date achieveDate) {
		this.achieveDate = achieveDate;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}

	
}
