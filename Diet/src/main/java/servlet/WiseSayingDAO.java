package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.WiseSaying;

public class WiseSayingDAO extends SuperDAO{
	final static String QUERY_PATH="/sql/wisesaying_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch(IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}
	public WiseSayingDAO() {
		super();
	}
	
	public List<WiseSaying> select() {
		List<WiseSaying> wisesayings = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<WiseSaying>> h = new BeanListHandler<>(WiseSaying.class);
			wisesayings = qr.query(QM.get("select"), h);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return wisesayings;
	}

	public WiseSaying selectById(int id) {
		WiseSaying w = new WiseSaying();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<WiseSaying> h = new BeanHandler<>(WiseSaying.class);
			Object[] p = {id};
			w = qr.query(QM.get("selectById"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return w;
	}
	
	public List<WiseSaying> selectByRandomId() {
		List<WiseSaying> rtn= new ArrayList<>();
		//Random random = new Random();
		//int randomNo=(random.nextInt(10)+1); //1~10까지의 랜덤숫자
		try (Connection c = dataSource.getConnection();){
			QueryRunner qr = new QueryRunner();
			ResultSetHandler<List<WiseSaying>> h = new BeanListHandler<>(WiseSaying.class);
			//Object[] p = {randomNo};
			rtn = qr.query(c, QM.get("select"), h);
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		return rtn;
	}
}
