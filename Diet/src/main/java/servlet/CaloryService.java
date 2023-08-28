package servlet;

import java.util.List;

import bean.Calory;

public class CaloryService {
	CaloryDAO calorydao;
	
	public CaloryService() {
		calorydao = new CaloryDAO();
	}
	
	public List<Calory> findAll() {		
		return calorydao.select();
	}
	
	public List<Calory> findByType(String type) {
		return calorydao.selectByType(type);
	}
	
	public List<Calory> findByTitle(String title) {
		return calorydao.selectByTitle(title);
	}
	
}
