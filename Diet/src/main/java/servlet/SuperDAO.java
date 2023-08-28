package servlet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.*;

public class SuperDAO {
	
	protected DataSource dataSource;
	public SuperDAO(){
		try {
			Context initialContext = new InitialContext();
			Context envContext = (Context) initialContext.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/p1");
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
	}
}
