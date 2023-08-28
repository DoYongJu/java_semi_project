package servlet;

import bean.Sport;

public class SportService {
	SportDAO sportdao;
	
	public SportService() {
		sportdao = new SportDAO();
	}
	
	public Sport find(String title) {
		return sportdao.selectByTitle(title);
	}

}
