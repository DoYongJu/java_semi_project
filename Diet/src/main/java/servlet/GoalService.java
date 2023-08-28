package servlet;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.time.DateUtils;

import bean.Goal;
import bean.GoalCount;
import bean.Schedule;

public class GoalService {
	GoalDAO goaldao;
	
	public GoalService() {
		goaldao = new GoalDAO();
	}
	
	public List<Goal> find(long memberId){
		return goaldao.selectByMemberId(memberId);
	}
	
	public List<Goal> findByUserAndDate(long memberId, Date date) {
		Date tDate = DateUtils.truncate(date, Calendar.DATE);
		return goaldao.selectByMemberIdAndDate(memberId, tDate);
	}

	public List<GoalCount> findCountByAchieveDate(long memberId){
		return goaldao.selectCountByAchieveDate(memberId);
	}
	
	public void addGoal(long mid, long memberId) {
		goaldao.insert(mid, memberId);
	}
	public void removeGoal(long deleteGoalId) {
		goaldao.remove(deleteGoalId);
	}
	public List<Schedule> findReportList(long memberId) {
		return goaldao.selectByMemberId2(memberId);
	}
	public List<Schedule> findCountList(long scheduleId) {
		return goaldao.selectByScheduleId2(scheduleId);
	}
}
