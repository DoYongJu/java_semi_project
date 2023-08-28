package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryLoader;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Member;

public class MemberDAO extends SuperDAO {
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

	final static String QUERY_PATH = "/sql/member_sql.properties";
	final static Map<String, String> QM;
	static {
		try {
			QM = QueryLoader.instance().load(QUERY_PATH);
		} catch (IOException ioe) {
			ioe.printStackTrace();
			throw new ExceptionInInitializerError(ioe);
		}
	}

	public MemberDAO() {
		super();
	}

	public List<Member> select() {
		open();
		List<Member> members = new ArrayList<>();

		try {
			ps = conn.prepareStatement("SELECT * FROM member");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Member m = new Member();
				m.setId(rs.getLong("id"));
				m.setUserName(rs.getString("userName"));
				m.setPassword(rs.getString("password"));
				m.setEmail(rs.getString("email"));
				m.setMenuType(rs.getString("menuType"));
				m.setSportType(rs.getString("sportType"));
				m.setType(rs.getString("type"));

				members.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return members;
	}
	public void deleteAccountById(long userId) {
		open(); //UPDATE member SET password='rrrr' where username='t1'
		try {
			ps = conn.prepareStatement("DELETE member where id = ?");
			ps.setLong(1, userId);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	public Member selectByUsername(String username) {
		open();
		Member member = new Member();

		try {
			ps = conn.prepareStatement("SELECT * FROM member WHERE username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				member.setId(rs.getInt("id"));
				member.setUserName(rs.getString("username"));
				member.setPassword(rs.getString("password"));
				member.setEmail(rs.getString("email"));
				member.setMenuType(rs.getString("menuType"));
				member.setSportType(rs.getString("sportType"));
				member.setType(rs.getString("type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}
	
	public void addMember(Member m) {
		try(Connection c =dataSource.getConnection();) {	
			QueryRunner qr = new QueryRunner();
			Object[] p = {m.getUserName(), m.getPassword(), m.getEmail(),  null, null, m.getType()};
			qr.execute(c, QM.get("insertMember"),p);		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public synchronized boolean check(String userName) {
		open();
		boolean rtn = false;
		try{
			ps = conn.prepareStatement("SELECT username FROM MEMBER where username=(?)");
			ps.setString(1, userName);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				rtn=false;
			}else { //가능
				rtn=true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rtn;
	}
	
	public void updateSportType(Member m) {
		open();
		String sql = "UPDATE member SET sportType=? WHERE username=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, m.getSportType());
			ps.setString(2, m.getUserName());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void updateMenuType(Member m) {
		open();
		String sql = "UPDATE member SET menuType=? WHERE username=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, m.getMenuType());
			ps.setString(2, m.getUserName());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void updatePwdByUserName(Member member) {
		open(); //UPDATE member SET password='rrrr' where username='t1'
		try {
			ps = conn.prepareStatement("UPDATE member SET password = ? where username = ?");
			ps.setString(1, member.getPassword());
			ps.setString(2, member.getUserName());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}	
	}
	
	public Member selectByEmail(String email) {
		open();
		Member member = new Member();

		try {
			ps = conn.prepareStatement("SELECT * FROM member WHERE email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				member.setId(rs.getInt("id"));
				member.setUserName(rs.getString("username"));
				member.setPassword(rs.getString("password"));
				member.setEmail(rs.getString("email"));
				member.setMenuType(rs.getString("menuType"));
				member.setSportType(rs.getString("sportType"));
				member.setType(rs.getString("type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}

}
