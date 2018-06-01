package threeblog.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.service.Service;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String get_time=request.getParameter("ban_time");
		java.util.Date ban_time1 = null;
		try {
			ban_time1 = sdf.parse(get_time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date ban_time=new Date(ban_time1.getTime());
		Service service=new Service();
		if(service.updateUserBan_time(username, ban_time)){
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`封印成功！将返回管理页面！`)</script>");
			String   content=0+ ";URL= "+request.getContextPath()+"/jsp/manage_center/managecenter.jsp"; 
			response.setHeader( "REFRESH ",content);
		}else{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`封印失败！请检查用户名是否正确！`)</script>");
			String   content=0+ ";URL= "+request.getContextPath()+"/jsp/manage_center/managecenter.jsp?id=3"; 
			response.setHeader( "REFRESH ",content);
		}
		
	}

}
