package threeblog.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Article;
import threeblog.entity.Collect;
import threeblog.service.Service;

/**
 * Servlet implementation class CollectArticle
 * 收藏文章与取消收藏
 */
@WebServlet("/CollectArticle")
public class CollectArticle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CollectArticle() {
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
		
		
		int user_id=Integer.valueOf((String)request.getSession().getAttribute("user_id"));
		int article_id=Integer.valueOf(request.getParameter("article_id"));
		String status=request.getParameter("status");
		int author_id=Integer.valueOf(request.getParameter("author_id"));
		String result="";
		Service service=new Service();
		Article article=service.getArticleFromId(article_id);
		java.util.Date now=new java.util.Date();
		Date collectdate=new java.sql.Date(now.getTime());
		Collect collect=new Collect();
		collect.setArticle_id(article_id);
		collect.setUser_id(user_id);
		collect.setCollectdate(collectdate);
		collect.setAuthor_id(author_id);
		
		if(user_id==article.getAuthor_id()){
			//情况1：收藏了自己的文章
			 result="{'bol':1}";
			 System.out.println("1");
		}else{
			if(status.equals("收藏")){
				if(service.addCollectRecord(collect)!=0){
					//情况2：收藏成功
					result="{'bol':2}";
					System.out.println("2");
				}else{
					//情况3：收藏失败(已收藏)
					result="{'bol':3}";
					System.out.println("3");
				}	
			}else if(status.equals("取消收藏")){
				service.deleteCollectRecord(collect);
				//情况4：取消收藏成功
				result="{'bol':4}";
				System.out.println("4");
			}	
		}
		response.setContentType("test/html");  
        response.setCharacterEncoding("UTF-8");  
        response.getWriter().print(result); 
	}

}
