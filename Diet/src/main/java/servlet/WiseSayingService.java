package servlet;

import java.util.ArrayList;
import java.util.List;

import bean.WiseSaying;

public class WiseSayingService {

	WiseSayingDAO wisesayingdao;

	public WiseSayingService() {
		wisesayingdao = new WiseSayingDAO();
	}
	
	//명언 관련 메소드
	public List<WiseSaying> randomWiseSaying() { 
		List<WiseSaying> m = new ArrayList<>();
		m = wisesayingdao.selectByRandomId();
		return m;
	}
}
