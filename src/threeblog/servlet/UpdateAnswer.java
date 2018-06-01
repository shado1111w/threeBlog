package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Answer;
import threeblog.entity.Comment;
import threeblog.service.Service;

/**
 * Servlet implementation class UpdateAnswer
 */
@WebServlet("/UpdateAnswer")
public class UpdateAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAnswer() {
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
		int content_id=Integer.valueOf(request.getParameter("content_id"));
		String status=request.getParameter("status");
		Service service=new Service();
		Answer answer=new Answer();
		answer.setId(content_id);
		answer.setStatus(status);
		
		service.updateAnswerStatus(answer);
	}

}
