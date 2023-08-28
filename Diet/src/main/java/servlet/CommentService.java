package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommentService {
	CommentDAO commentdao;
	
	public CommentService() {
		commentdao = new CommentDAO();
	}
	
	public void addComment(long listId, long memberId, String context) {
		commentdao.insert(listId, memberId, context);
	}
	public List<Object[]> getComment(long listId) {
		return commentdao.select(listId);
	}
	
	public void deleteComment(long listId) {
		commentdao.delete(listId);
	}
}