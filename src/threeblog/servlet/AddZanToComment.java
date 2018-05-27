package threeblog.servlet;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Comment;
import threeblog.service.Service;

/**
 * Servlet implementation class AddZan
 * 点赞和取消点赞
 */
@WebServlet("/AddZan")
public class AddZanToComment extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddZanToComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int zan=Integer.valueOf(request.getParameter("zan"));
		int comment_id=Integer.valueOf(request.getParameter("comment_id"));
		Comment comment=new Comment();
		comment.setZan(zan);
		comment.setId(comment_id);
		Service service=new Service();
		service.updateCommentZan(comment);
		
	}

}
