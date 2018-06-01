package threeblog.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Answer;
import threeblog.entity.Article;
import threeblog.entity.Comment;
import threeblog.entity.Message;
import threeblog.service.Service;

/**
 * Servlet implementation class AddAnswer
 * 添加回复
 */
@WebServlet("/AddAnswer")
public class AddAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAnswer() {
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
		int author_id=Integer.valueOf(request.getParameter("author_id"));
		int comment_id=Integer.valueOf(request.getParameter("comment_id"));
		int last_answer_id=Integer.valueOf(request.getParameter("last_answer_id"));
		int article_id=Integer.valueOf(request.getParameter("article_id"));
		int flag=Integer.valueOf(request.getParameter("flag"));
		String text2=request.getParameter("text2");
		
		//获取当前服务器时间
		java.util.Date d=new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateNowStr = sdf.format(d);  
		Timestamp add_time=Timestamp.valueOf(dateNowStr);
		
		Answer answer=new Answer();
		answer.setAdd_time(add_time);
		answer.setAuthor_id(author_id);
		answer.setText(text2);
		answer.setComment_id(comment_id);
		Service service=new Service();
		
		
		//增加文章评论数量
		Article article=service.getArticleFromId(article_id);
		article.setComment_num(article.getComment_num()+1);
		service.updateArticleComment_num(article);
	
		int answer_id=service.addAnswer(answer);
		//情况1：comment_id与answer_id重叠且相等
		if(flag==1){
			//仅对评论作者进行消息推送
			Message message=new Message();
			message.setType("评论留言");
			Comment comment=service.getCommentFromComment_id(comment_id);
			message.setReceiver_id(comment.getAuthor_id());
			message.setAnswer_id(author_id);
			message.setArticle_id(article_id);
			message.setText1(comment.getText());
			int start=text2.indexOf(":");
			int start2=text2.indexOf(":",start+1);
			String t=text2.substring(start2+1);
			message.setText2(t);
			message.setAdd_time(add_time);
			service.addMessage(message);
			
		}else{
			if(service.getCommentFromComment_id(comment_id).getAuthor_id()==author_id){
			//情况2:comment_id和answer_id不重叠且作者相同
			Message message=new Message();
			message.setType("回复留言");
			Answer answer3=service.getAnswertFromAnswer_id(last_answer_id);
			message.setReceiver_id(answer3.getAuthor_id());
			message.setAnswer_id(author_id);
			message.setArticle_id(article_id);
			int start1=answer3.getText().indexOf(":");
			int start3=answer3.getText().indexOf(":",start1+1);
			String t1=answer3.getText().substring(start3+1);
			message.setText1(t1);//需要待转化
			int start2=text2.indexOf(":");
			int start4=text2.indexOf(":",start2+1);
			String t2=text2.substring(start4+1);
			message.setText2(t2);//需要待转化
			message.setAdd_time(add_time);
			service.addMessage(message);			 
		}

		else{
			//情况3：comment_id与answer_id不重叠且作者不相同
			//对评论作者进行消息推送
			if(service.getCommentFromComment_id(comment_id).getAuthor_id()!=service.getAnswertFromAnswer_id(last_answer_id).getAuthor_id()){
			Message message=new Message();
			message.setType("评论留言");
			Comment comment=service.getCommentFromComment_id(comment_id);
			message.setReceiver_id(comment.getAuthor_id());
			message.setAnswer_id(author_id);
			message.setArticle_id(article_id);
			message.setText1(comment.getText());
			//int start=text2.indexOf(":");
			//int start4=text2.indexOf(":",start+1);
			//String t=text2.substring(start4+1);
			message.setText2(text2); //需要待转化
			message.setAdd_time(add_time);
				service.addMessage(message);
			//对评论下的回复作者进行消息推送
			Message message2=new Message();
			message2.setType("回复留言");
			Answer answer2=service.getAnswertFromAnswer_id(last_answer_id);
			message2.setReceiver_id(answer2.getAuthor_id());
			message2.setAnswer_id(author_id);
			message2.setArticle_id(article_id);
			int start1=answer2.getText().indexOf(":");
			int start3=answer2.getText().indexOf(":",start1+1);
			String t1=answer2.getText().substring(start3+1);
			message2.setText1(t1);//需要待转化
			int start2=text2.indexOf(":");
			int start5=text2.indexOf(":",start2+1);
			String t2=text2.substring(start5+1);
			message2.setText2(t2);//需要待转化
			message2.setAdd_time(add_time);
			service.addMessage(message2);	
			}else{
				Message message2=new Message();
				message2.setType("回复留言");
				Answer answer2=service.getAnswertFromAnswer_id(last_answer_id);
				message2.setReceiver_id(answer2.getAuthor_id());
				message2.setAnswer_id(author_id);
				message2.setArticle_id(article_id);
				int start1=answer2.getText().indexOf(":");
				int start3=answer2.getText().indexOf(":",start1+1);
				String t1=answer2.getText().substring(start3+1);
				message2.setText1(t1);//需要待转化
				int start2=text2.indexOf(":");
				int start5=text2.indexOf(":",start2+1);
				String t2=text2.substring(start5+1);
				message2.setText2(t2);//需要待转化
				message2.setAdd_time(add_time);
				service.addMessage(message2);	
			}
		}
		
		
		
		}
		
		StringBuilder result = new StringBuilder(); 
		
		result.append("{")
		.append("\"answer_id\":\""+String.valueOf(answer_id)+"\"")
		.append(",")
		.append("\"add_time\":\""+dateNowStr+"\"")
		.append("}"); //构建json串
		System.out.println(result.toString());
		response.setContentType("test/html");  
        response.setCharacterEncoding("UTF-8");  
        response.getWriter().print(result.toString()); 
		
	}

}
