package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Follow;
import threeblog.entity.Zan;
import threeblog.service.Service;

/**
 * Servlet implementation class UpdateZan
 */
@WebServlet("/UpdateZan")
public class UpdateZan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateZan() {
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
		int zan_id=Integer.valueOf(request.getParameter("zan_id"));
		String status=request.getParameter("status");
		Service service=new Service();
		Zan zan=new Zan();
		zan.setId(zan_id);
		zan.setStatus(status);
		service.updateZanStatus(zan);
	}

}
