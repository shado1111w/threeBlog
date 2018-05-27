package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Answer;
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
		int zan=Integer.valueOf(request.getParameter("zan"));
		int answer_id=Integer.valueOf(request.getParameter("comment_id"));
		Answer answer=new Answer();
		answer.setZan(zan);
		answer.setId(answer_id);
		Service service=new Service();
		service.updateAnswerZan(answer);
	}

}
