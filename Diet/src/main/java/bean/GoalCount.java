package bean;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONObject;

public class GoalCount {
	int count;
	Date achieveDate;
	long memberId;
	
	public GoalCount() {		
	}
	
	public String toJsonString() {
		String rtn = null;
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		
		JSONObject jo = new JSONObject();
		jo.put("count", count);
		jo.put("achieveDate", fm.format(achieveDate));
		rtn = jo.toString();
		return rtn;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getAchieveDate() {
		return achieveDate;
	}
	public void setAchieveDate(Date achieveDate) {
		this.achieveDate = achieveDate;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
}
