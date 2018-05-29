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
@WebServlet("/AddCollected")
public class AddCollected extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCollected() {
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
		int collected=Integer.valueOf(request.getParameter("collected"));
		int article_id=Integer.valueOf(request.getParameter("article_id"));
		String status=request.getParameter("status");
		if(status.equals(" ’≤ÿ")) collected++;
		else collected--;
		System.out.println(collected);
		Article article=new Article();
		article.setId(article_id);
		article.setCollected(collected);
		Service service=new Service();
		service.updateArticleCollected(article);
	}

}
