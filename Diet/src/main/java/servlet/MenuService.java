package servlet;

import bean.Menu;

public class MenuService {
	MenuDAO menudao;
	
	public MenuService() {
		menudao = new MenuDAO();
	}
	
	public Menu find(String title) {		
		return menudao.selectByTitle(title);
	}

}
