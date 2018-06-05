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
import threeblog.tools.*;

/**
 * Servlet implementation class AddAnswer
 * ��ӻظ�
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
		
		//��ȡ��ǰ������ʱ��
		java.util.Date d=new java.util.Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateNowStr = sdf.format(d);  
		Timestamp add_time=Timestamp.valueOf(dateNowStr);
		
		Answer answer=new Answer();
		SensitivewordFilter filter = new SensitivewordFilter();
		text2=filter.replaceSensitiveWord(text2,1,"*");
		answer.setAdd_time(add_time);
		answer.setAuthor_id(author_id);
		answer.setText(text2);
		answer.setComment_id(comment_id);
		Service service=new Service();
		
		
		//����������������
		Article article=service.getArticleFromId(article_id);
		article.setComment_num(article.getComment_num()+1);
		service.updateArticleComment_num(article);
	
		int answer_id=service.addAnswer(answer);
		//���1��comment_id��answer_id�ص������
		if(flag==1){
			//�����������߽�����Ϣ����
			Message message=new Message();
			message.setType("��������");
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
			//���2:comment_id��answer_id���ص���������ͬ
			Message message=new Message();
			message.setType("�ظ�����");
			Answer answer3=service.getAnswertFromAnswer_id(last_answer_id);
			message.setReceiver_id(answer3.getAuthor_id());
			message.setAnswer_id(author_id);
			message.setArticle_id(article_id);
			int start1=answer3.getText().indexOf(":");
			int start3=answer3.getText().indexOf(":",start1+1);
			String t1=answer3.getText().substring(start3+1);
			message.setText1(t1);//��Ҫ��ת��
			int start2=text2.indexOf(":");
			int start4=text2.indexOf(":",start2+1);
			String t2=text2.substring(start4+1);
			message.setText2(t2);//��Ҫ��ת��
			message.setAdd_time(add_time);
			service.addMessage(message);			 
		}

		else{
			//���3��comment_id��answer_id���ص������߲���ͬ
			//���������߽�����Ϣ����
			if(service.getCommentFromComment_id(comment_id).getAuthor_id()!=service.getAnswertFromAnswer_id(last_answer_id).getAuthor_id()){
			Message message=new Message();
			message.setType("��������");
			Comment comment=service.getCommentFromComment_id(comment_id);
			message.setReceiver_id(comment.getAuthor_id());
			message.setAnswer_id(author_id);
			message.setArticle_id(article_id);
			message.setText1(comment.getText());
			//int start=text2.indexOf(":");
			//int start4=text2.indexOf(":",start+1);
			//String t=text2.substring(start4+1);
			message.setText2(text2); //��Ҫ��ת��
			message.setAdd_time(add_time);
				service.addMessage(message);
			//�������µĻظ����߽�����Ϣ����
			Message message2=new Message();
			message2.setType("�ظ�����");
			Answer answer2=service.getAnswertFromAnswer_id(last_answer_id);
			message2.setReceiver_id(answer2.getAuthor_id());
			message2.setAnswer_id(author_id);
			message2.setArticle_id(article_id);
			int start1=answer2.getText().indexOf(":");
			int start3=answer2.getText().indexOf(":",start1+1);
			String t1=answer2.getText().substring(start3+1);
			message2.setText1(t1);//��Ҫ��ת��
			int start2=text2.indexOf(":");
			int start5=text2.indexOf(":",start2+1);
			String t2=text2.substring(start5+1);
			message2.setText2(t2);//��Ҫ��ת��
			message2.setAdd_time(add_time);
			service.addMessage(message2);	
			}else{
				Message message2=new Message();
				message2.setType("�ظ�����");
				Answer answer2=service.getAnswertFromAnswer_id(last_answer_id);
				message2.setReceiver_id(answer2.getAuthor_id());
				message2.setAnswer_id(author_id);
				message2.setArticle_id(article_id);
				int start1=answer2.getText().indexOf(":");
				int start3=answer2.getText().indexOf(":",start1+1);
				String t1=answer2.getText().substring(start3+1);
				message2.setText1(t1);//��Ҫ��ת��
				int start2=text2.indexOf(":");
				int start5=text2.indexOf(":",start2+1);
				String t2=text2.substring(start5+1);
				message2.setText2(t2);//��Ҫ��ת��
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
		.append("}"); //����json��
		System.out.println(result.toString());
		response.setContentType("test/html");  
        response.setCharacterEncoding("UTF-8");  
        response.getWriter().print(result.toString()); 
		
	}

}
