package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Goal;
import bean.GoalCount;
import bean.Schedule;

public class GoalDAO extends SuperDAO{
	Connection conn = null;
	PreparedStatement ps;

	final String JDBC_DRIVER = "org.h2.Driver";
	final String JDBC_URL = "jdbc:h2:tcp://localhost/C:/java/h2/data/p1";

	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "sa", "sa");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	final static String QUERY_PATH="/sql/goal_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch(IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}
	public GoalDAO() {
		super();
	}
	
	public List<Goal> selectByMemberId(long memberId) {
		List<Goal> goals = new ArrayList<>();
		
		LocalDate now = LocalDate.now();
		int monthValue = now.getMonthValue();

		
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Goal>> h = new BeanListHandler<>(Goal.class);
			Object[] p = {memberId, monthValue};
			goals = qr.query(QM.get("selectByMemberId"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return goals;
	}

	public Goal selectByScheduleId(int scheduleId) {
		Goal c = new Goal();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Goal> h = new BeanHandler<>(Goal.class);
			Object[] p = {scheduleId};
			c = qr.query(QM.get("selectByScheduleId"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return c;
	}
	
	public List<Goal> selectByMemberIdAndDate(long memberId, Date date) {
		List<Goal> goals = new ArrayList<>();
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Goal>> h = new BeanListHandler<>(Goal.class);
			Object[] p = {memberId, date};
			goals = qr.query(QM.get("selectByMemberIdAndDate"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return goals;
	}
	
	public List<GoalCount> selectCountByAchieveDate(long memberId){
		List<GoalCount> goals = new ArrayList<>();		
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<GoalCount>> h = new BeanListHandler<>(GoalCount.class);
			Object[] p = {memberId};
			goals = qr.query(QM.get("selectCountByAchieveDate"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}			
		return goals;
	}
	
	public void insert(long mid, long memberId) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Goal> h = new BeanHandler<>(Goal.class);
			Object[] p = {mid, new Date(), memberId};
			qr.execute(QM.get("insert"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
	public void remove(long deleteGoalId) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Goal> h = new BeanHandler<>(Goal.class);
			Object[] p = {deleteGoalId, deleteGoalId};
			qr.execute(QM.get("remove"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
	public List<Schedule> selectByMemberId2(long memberId) {
		List<Schedule> scheduleList = new ArrayList<Schedule>();
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Schedule>> h = new BeanListHandler<>(Schedule.class);
			Object[] p = {memberId};
			scheduleList = qr.query(QM.get("selectByMemberId2"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}		
		return scheduleList;
	}
	
	public List<Schedule> selectByScheduleId2(long scheduleId){
		List<Schedule> goals = new ArrayList<>();		
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Schedule>> h = new BeanListHandler<>(Schedule.class);
			Object[] p = {scheduleId};
			goals = qr.query(QM.get("selectByScheduleId2"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}			
		return goals;
	}


}
