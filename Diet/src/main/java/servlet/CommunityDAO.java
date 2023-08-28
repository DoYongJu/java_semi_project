package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Community;
import bean.Schedule;


public class CommunityDAO extends SuperDAO{
	final static String QUERY_PATH="/sql/community_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		}catch(IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}
	public CommunityDAO() {
		super();
	}
	
	public List<Object[]> select() {
		List<Object[]> communities = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			communities = qr.query(QM.get("select"), h);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return communities;
	}
	public List<Object[]> selectByPro() {
		List<Object[]> communities = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			Object[] p = {"전문"};
			communities = qr.query(QM.get("selectByType"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return communities;
	}
	public List<Object[]> selectByPeople() {
		List<Object[]> communities = new ArrayList<>();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
			Object[] p = {"일반"};
			communities = qr.query(QM.get("selectByType"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return communities;
	}

	public Object[] selectById(long listId) {
		Object[] c = null;

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Object[]> h = new ArrayHandler();
			Object[] p = {listId};
			c = qr.query(QM.get("selectById"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return c;
	}
	
	public void insert(Community c) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = {c.getContent(), c.getImage(), c.getDate(), c.getMemberId(), c.getTitle()};
			qr.execute(QM.get("insert"), p);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
	
	public void update(Community c) {
		try {
			QueryRunner qr = new QueryRunner(dataSource);
			Object[] p = {c.getContent(), c.getImage(), c.getDate(), c.getTitle(), c.getId()};
			qr.execute(QM.get("update"), p);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
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
	
	public List<Object[]> getSearchByUserName(String searchContent) { //0823 용주작성
		List<Object[]> c = null;
		try {
				searchContent = searchContent.trim();
				QueryRunner qr = new QueryRunner(dataSource);
				ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
				Object[] p = {searchContent};
				c = qr.query(QM.get("selectBySearchByUsername"), h, p);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return c;
	}
	
	public List<Object[]> getSearchByContent(String searchContent) { //0821 용주작성
		List<Object[]> c = null;
		
		try {
				searchContent = searchContent.trim();
				QueryRunner qr = new QueryRunner(dataSource);
				ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
				Object[] p = {searchContent};
				c = qr.query(QM.get("selectBySearchByContent"), h, p);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return c;
	}
	
	public List<Object[]> getSearchByUserDate(String searchContent) { //0823 용주작성
		List<Object[]> c = null;
		try {
				searchContent = searchContent.trim();
				QueryRunner qr = new QueryRunner(dataSource);
				ResultSetHandler<List<Object[]>> h = new ArrayListHandler();
				Object[] p = {searchContent};
				c = qr.query(QM.get("selectBySearchByDate"), h, p);
			
		}catch(SQLException se) {
			se.printStackTrace();
		}
		return c;
	}
	
	public Community selectByCommunityId(long listId) {
		Community c = new Community();

		try {
			QueryRunner qr = new QueryRunner(dataSource);
			ResultSetHandler<Community> h = new BeanHandler<>(Community.class);
			Object[] p = {listId};
			c = qr.query(QM.get("selectByCommunityId"), h, p);

		} catch (SQLException se) {
			se.printStackTrace();
		}
		return c;
	}
	
}
