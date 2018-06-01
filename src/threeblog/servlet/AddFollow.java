package threeblog.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Follow;
import threeblog.service.Service;

/**
 * Servlet implementation class AddFollow
 */
@WebServlet("/AddFollow")
public class AddFollow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFollow() {
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
		String status=request.getParameter("status");
		java.util.Date now=new java.util.Date();
		Date follow_date=new java.sql.Date(now.getTime());
		Follow follow=new Follow();
		follow.setFollowing_id(following_id);
		follow.setFollower_id(follower_id);
		follow.setFollow_date(follow_date);
		Service service=new Service();
		if(status.equals("¹Ø×¢"))
			service.addFollowRecord(follow);
		else
			service.deleteFollowRecord(follow);
	}

}
