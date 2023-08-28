package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Schedule;

public class ScheduleDAO extends SuperDAO{
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
	
	final static String QUERY_PATH="/sql/schedule_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch(IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}
	public ScheduleDAO() {
		super();
	}
	
	public List<Schedule> select() {
		List<Schedule> schedules = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Schedule>> h = new BeanListHandler<>(Schedule.class);
			schedules = qr.query(QM.get("select"), h);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return schedules;
	}

	public Schedule selectByType(String type) {
		Schedule s = new Schedule();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Schedule> h = new BeanHandler<>(Schedule.class);
			Object[] p = {type};
			s = qr.query(QM.get("selectByType"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return s;
	}
	
	public List<Schedule> selectByMemberId(long memberId) {
		open();
		List<Schedule> scheduleList = new ArrayList<Schedule>();

		try {
			ps = conn.prepareStatement("SELECT * FROM schedule WHERE memberId=?");
			ps.setLong(1, memberId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Schedule schedule = new Schedule();
				schedule.setId(rs.getLong("id"));
				schedule.setMemberId(rs.getLong("memberId"));
				schedule.setType(rs.getString("type"));
				schedule.setGoal(rs.getString("goal"));
				schedule.setPeriod(rs.getLong("period"));
				schedule.setInputDate(rs.getDate("inputdate"));
				schedule.setDueDate(rs.getDate("duedate"));
				scheduleList.add(schedule);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return scheduleList;
	}
	
	public void insert(Schedule s) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = {s.getMemberId(), s.getType(), s.getGoal(), s.getPeriod(), new Date(), s.getDueDate()};
			qr.execute(QM.get("insert"), p);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
	
	public List<Schedule> selectAllTodoList(long memberId, String clickedDate) {
		List<Schedule> schedule = new ArrayList<>();
		Date clicked = java.sql.Date.valueOf(clickedDate);

		try {
			//이번주 첫일, 이번달 첫날 구하기
			String sunday = "";
			GregorianCalendar cal = new GregorianCalendar();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date= simpleDateFormat.parse(clickedDate);
			cal.setTime(date);
			cal.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);
			String startDate = simpleDateFormat.format(cal.getTime());
			System.out.println("startDate:"+startDate);
			
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Schedule>> h = new BeanListHandler<>(Schedule.class);
			Object[] p= {startDate,clickedDate,memberId};
			schedule = qr.query(QM.get("selectJoin"), h, p);

		} catch (SQLException  se) {
			se.printStackTrace();
		}catch (Exception  e) {
			e.printStackTrace();
		}
		return schedule;
	}
	
}
