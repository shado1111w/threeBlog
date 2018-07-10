package threeblog.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Article;
import threeblog.entity.Zan;
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
		request.setCharacterEncoding("utf-8");
		int liked=Integer.valueOf(request.getParameter("liked"));
		int article_id=Integer.valueOf(request.getParameter("article_id"));
		int receiver_id=Integer.valueOf(request.getParameter("receiver_id"));
		int sender_id=Integer.valueOf(request.getParameter("sender_id"));
		String status=request.getParameter("status");
		if(status.equals("喜欢")) liked++;
		else liked--;
		Article article=new Article();
		article.setId(article_id);
		article.setLiked(liked);
		Service service=new Service();
		service.updateArticleLiked(article);
		
		if(status.equals("喜欢")){
			Zan zan=new Zan();
			String type="文章点赞";
			zan.setType(type);
			zan.setText(service.getArticleFromId(article_id).getTitle());
			zan.setArticle_id(article_id);
			//获取服务器当前时间
			java.util.Date d=new java.util.Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String dateNowStr = sdf.format(d);  
			Timestamp add_time=Timestamp.valueOf(dateNowStr);
			zan.setAdd_time(add_time);
			zan.setSender_id(sender_id);
			zan.setReceiver_id(receiver_id);
			service.addZanMessage(zan);
			
		}
	}

}
