package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Follow;
import threeblog.service.*;

/**
 * Servlet implementation class DeleteFollow
 */
@WebServlet("/DeleteFollow")
public class DeleteFollow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFollow() {
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
		int following_id=Integer.valueOf(request.getParameter("following_id"));
		int follower_id=Integer.valueOf(request.getParameter("follower_id"));
		Follow follow=new Follow();
		follow.setFollowing_id(following_id);
		follow.setFollower_id(follower_id);
		Service service=new Service();
		service.deleteFollowRecord(follow);
	}

}
