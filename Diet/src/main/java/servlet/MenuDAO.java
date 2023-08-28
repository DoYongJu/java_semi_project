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

import bean.Menu;

public class MenuDAO extends SuperDAO {
	final static String QUERY_PATH = "/sql/menu_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		} catch (IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}

	public MenuDAO() {
		super();
	}

	public List<Menu> select() {
		List<Menu> menus = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Menu>> h = new BeanListHandler<>(Menu.class);
			menus = qr.query(QM.get("select"), h);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return menus;
	}

	public Menu selectByTitle(String title) {
		Menu m = new Menu();

		try {
			if (title.equals("테스트를 통해 나의 식단유형을 알아보세요!")) {
				return new Menu(-1, "", "", "");

			} else {
				QueryRunner qr = new QueryRunner(dataSource);
				ResultSetHandler<Menu> h = new BeanHandler<>(Menu.class);
				Object[] p = { title };
				m = qr.query(QM.get("selectByTitle"), h, p);

			}

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return m;
	}
}
