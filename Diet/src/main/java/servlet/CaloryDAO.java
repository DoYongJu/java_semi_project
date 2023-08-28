package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Calory;

public class CaloryDAO extends SuperDAO{
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
	
	final static String QUERY_PATH="/sql/calory_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch(IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}
	public CaloryDAO() {
		super();
	}
	
	public List<Calory> select() {
		List<Calory> calories = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Calory>> h = new BeanListHandler<>(Calory.class);
			calories = qr.query(QM.get("select"), h);


		} catch (SQLException se) {
			se.printStackTrace();
		}
		return calories;
	}

	public List<Calory> selectByType(String type) {
		List<Calory> calories = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Calory>> h = new BeanListHandler<>(Calory.class);
			Object[] p = {type};
			calories = qr.query(QM.get("selectByType"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return calories;
	}
	
	public List<Calory> selectByTitle(String title){
		List<Calory> calories = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Calory>> h = new BeanListHandler<>(Calory.class);
			Object[] p = {title};
			calories = qr.query(QM.get("selectByTitle"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return calories;
	}
}
