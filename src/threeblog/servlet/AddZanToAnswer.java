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
import threeblog.entity.Zan;
import threeblog.service.Service;

/**
 * Servlet implementation class AddZanToAnswer
 */
@WebServlet("/AddZanToAnswer")
public class AddZanToAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddZanToAnswer() {
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
		String status=request.getParameter("status");
		int zan=Integer.valueOf(request.getParameter("zan"));
		int answer_id=Integer.valueOf(request.getParameter("comment_id"));
		int sender_id=Integer.valueOf(request.getParameter("sender_id"));
		int article_id=Integer.valueOf(request.getParameter("article_id"));
		Answer answer=new Answer();
		answer.setZan(zan);
		answer.setId(answer_id);
		Service service=new Service();
		service.updateAnswerZan(answer);
		if(status.equals("点赞")){
			
			Zan zzZan=new Zan();
			String type="回复点赞";
			zzZan.setType(type);
			zzZan.setText(service.getAnswertFromAnswer_id(answer_id).getText());
			zzZan.setArticle_id(article_id);
			//获取服务器当前时间
			java.util.Date d=new java.util.Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String dateNowStr = sdf.format(d);  
			Timestamp add_time=Timestamp.valueOf(dateNowStr);
			
			zzZan.setAdd_time(add_time);
			zzZan.setSender_id(sender_id);
			zzZan.setReceiver_id(service.getAnswertFromAnswer_id(answer_id).getAuthor_id());
			service.addZanMessage(zzZan);
		}
	}

}
