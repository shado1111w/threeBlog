package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Article;
import threeblog.service.Service;

/**
 * Servlet implementation class AddLiked
 */
@WebServlet("/AddLiked")
public class AddLiked extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLiked() {
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
		int liked=Integer.valueOf(request.getParameter("liked"));
		int article_id=Integer.valueOf(request.getParameter("article_id"));
		String status=request.getParameter("status");
		if(status.equals("Ï²»¶")) liked++;
		else liked--;
		Article article=new Article();
		article.setId(article_id);
		article.setLiked(liked);
		Service service=new Service();
		service.updateArticleLiked(article);
	}

}
