package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Message;
import threeblog.service.Service;

/**
 * Servlet implementation class DeleteMessage
 */
@WebServlet("/UpdateMessage")
public class UpdateMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMessage() {
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
		int message_id=Integer.valueOf(request.getParameter("message_id"));
		String status=request.getParameter("status");
		Service service=new Service();
		Message message=new Message();
		message.setId(message_id);
		message.setStatus(status);
		service.updateMessageStatus(message);
		String result="1";
		System.out.println("result:"+result);
		response.setContentType("test/html");  
        response.setCharacterEncoding("UTF-8");  
        response.getWriter().print(result); 
	}

}
