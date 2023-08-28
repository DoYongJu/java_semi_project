package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.lang3.time.DateUtils;

import bean.Comment;
import bean.Goal;

public class CommentDAO extends SuperDAO{
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
	
	final static String QUERY_PATH="/sql/comment_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch(IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}
	public CommentDAO() {
		super();
	}
	
	public void insert(long listId, long memberId, String context) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Comment> h = new BeanHandler<>(Comment.class);
			
			Date nowDate = new Date();
			Date today = DateUtils.truncate(nowDate, Calendar.DATE);
			
			Object[] p = {listId, today, memberId, context};
			qr.execute(QM.get("insert"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
	public List<Object[]> select(long listId) {
		List<Object[]> comments = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			Object[] p = {listId};
			comments = qr.query(QM.get("select"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return comments;
	}
	
	public void delete(long listId) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = {listId};
			qr.execute(QM.get("delete"), p);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
}
