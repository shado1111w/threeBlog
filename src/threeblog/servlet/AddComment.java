package threeblog.servlet;

import java.io.IOException;

import java.sql.Timestamp;

import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.*;
import threeblog.service.Service;

/**
 * Servlet implementation class AddComment
 * 添加评论
 */
@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComment() {
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
		int article_id=Integer.valueOf(request.getParameter("article_id"));
		
		
		int author_id=Integer.valueOf(request.getParameter("author_id"));
		int receiver_id=Integer.valueOf(request.getParameter("receiver_id"));
		String text1=request.getParameter("text1");
		String text2=request.getParameter("text2");
   
		 java.util.Date d=new java.util.Date();
	        System.out.println(d);  
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String dateNowStr = sdf.format(d);  
	        
	        System.out.println("格式化后的日期：" + dateNowStr);
		Timestamp add_time=Timestamp.valueOf(dateNowStr);
		
		Comment comment=new Comment();
		comment.setArticle_id(article_id);
		comment.setAuthor_id(author_id);
		comment.setText(text2);
		comment.setAdd_time(add_time);
		
		
		Service service=new Service();
		//增加文章评论数
		Article article=service.getArticleFromId(article_id);
		article.setComment_num(article.getComment_num()+1);
		service.updateArticleComment_num(article);
		
		
		int comment_id=service.addComment(comment);
		//如果文章评论者不是文章作者本人
		if(author_id!=receiver_id){
		Message message=new Message();
		message.setType("文章留言");
		message.setReceiver_id(receiver_id);
		message.setAnswer_id(author_id);
		message.setArticle_id(article_id);
		message.setText1(text1);
		message.setText2(text2);
		message.setAdd_time(add_time);
		service.addMessage(message);
		}
		StringBuilder result = new StringBuilder();  
		result.append("{")
		.append("\"comment_id\":\""+String.valueOf(comment_id)+"\"")
		.append(",")
		.append("\"add_time\":\""+dateNowStr+"\"")
		.append("}"); //构建json串
		System.out.println(result.toString());
		response.setContentType("test/html");  
        response.setCharacterEncoding("UTF-8");  
        response.getWriter().print(result.toString()); 
		
	}

}
