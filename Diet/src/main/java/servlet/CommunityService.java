package servlet;

import java.util.List;
import bean.Community;


public class CommunityService {
	CommunityDAO communitydao;

	public CommunityService() {
		communitydao = new CommunityDAO();
	}

	public List<Object[]> getAll(String searchType, String searchContent) {
		List<Object[]> rtn = null;
		if(searchType == null) {
			rtn = communitydao.select();
		}else {
			if(searchType.equals("content")) { 
				rtn =communitydao.getSearchByContent(searchContent); 
				}
			if(searchType.equals("userName")) { 
				rtn =communitydao.getSearchByUserName(searchContent); 
				}
			if(searchType.equals("date")) { 
				rtn =communitydao.getSearchByUserDate(searchContent); 
				}
		}
		
		
		
		return rtn;
	}
	
	public Object[] getPost(long listId) {
		return communitydao.selectById(listId);
	}

	public synchronized void addPost(Community c) {
		communitydao.insert(c);
	}
	
	public synchronized void setPost(Community c) {
		communitydao.update(c);
	}

	public synchronized void deletePost(long listId) {
		communitydao.delete(listId);
	}
	public List<Object[]>getPostByType(String type) {
		List<Object[]> rtn= null;
		if(type.equals("전문가꿀팁")) {
			rtn =communitydao.selectByPro();
		}
		
		if(type.equals("자유게시판")) { rtn =communitydao.selectByPeople(); }
		 
		if(type.equals("전체보기")) {
			rtn =communitydao.select();
		}		
		return rtn;
	}
	
	public Community getByCommunityId(long listId) {
		return communitydao.selectByCommunityId(listId);
	}
}
