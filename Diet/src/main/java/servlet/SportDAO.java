package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Sport;

public class SportDAO extends SuperDAO{
	final static String QUERY_PATH="/sql/sport_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch(IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}
	public SportDAO() {
		super();
	}

	public List<Sport> select() {
		List<Sport> sports = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Sport>> h = new BeanListHandler<>(Sport.class);
			sports = qr.query(QM.get("select"), h);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return sports;
	}

	public Sport selectByTitle(String title) {
		Sport s = new Sport();

		try {
			if(title.equals("테스트를 통해 나의 운동유형을 알아보세요!")) {
				return new Sport(-1, "", "", "");
				
			}else {
				QueryRunner qr = new QueryRunner(dataSource);
				ResultSetHandler<Sport> h = new BeanHandler<>(Sport.class);
				Object[] p = {title};
				s = qr.query(QM.get("selectByTitle"), h, p);	
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		}
		return s;
	}
}
