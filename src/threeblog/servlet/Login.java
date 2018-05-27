package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.User;
import threeblog.service.Service;


/**
 * Servlet implementation class Login
 * 登录
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String phonenum="";
		String password="";
		String li_url="";
		request.setCharacterEncoding("utf-8");
		
		phonenum=request.getParameter("zh");
		password=request.getParameter("mm");
		li_url=request.getParameter("li_url");
		
		System.out.println("username:"+phonenum);
		System.out.println("password:"+password);
		System.out.println(li_url);
		
		
		
		Service service = new Service();
		
		
		
		
		boolean b=service.login(phonenum, password);
		if(b){
			int id=service.getIdFromPhonenum(phonenum);
			request.getSession().setAttribute("user_id",Integer.toString(id));
			User user=service.getUserFromId(id);
			if(user.getUsername()==null){
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert(`请完善个人信息！`)</script>");
				String   content=0+ ";URL= "+"../login_jsp/information2.jsp?res=3"; 
				response.setHeader( "REFRESH ",content);
			}else{
				response.sendRedirect(li_url);
			}
			
		}else{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`账号或密码错误，将自动返回登录页面！`)</script>");
			String   content=3+ ";URL= "+"../jichu/login.jsp"; 
			response.setHeader( "REFRESH ",content);
	
		}
	}

}
