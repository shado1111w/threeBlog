package threeblog.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		Service service = new Service();
		boolean b=service.login(phonenum, password);
		if(b){
			int user_id=service.getIdFromPhonenum(phonenum);
			if(service.isBan(user_id)==false){
				Date now=new Date();
				java.sql.Date last_login_time=new java.sql.Date(now.getTime());
				service.updateLastLoginTime(user_id, last_login_time);
				request.getSession().setAttribute("user_id",Integer.toString(user_id));
				Cookie phonenumCookie=new Cookie("phonenum1", phonenum);
				Cookie passwordCookie=new Cookie("password1", password);
				phonenumCookie.setDomain("localhost");
				phonenumCookie.setPath("/");
				passwordCookie.setDomain("localhost");
				passwordCookie.setPath("/");
				phonenumCookie.setMaxAge(36000);
				passwordCookie.setMaxAge(36000);
				response.addCookie(phonenumCookie);
				response.addCookie(passwordCookie);
				response.setContentType("text/html;charset=utf-8");

				String   content=0+ ";URL= "+li_url; 
				if(li_url.equals("http://www.crayon.xin:8080/threeBlog/jsp/login/register.jsp")||li_url.equals("http://localhost:8080/threeBlog/jsp/login/register.jsp"))
					content=0+";URL= "+"../index.jsp";
				if(li_url.equals("http://localhost:8082/threeBlog/jsp/login/register.jsp"))
					content=0+";URL= "+"../index.jsp";
				if(li_url.equals(""))
					content=0+";URL= "+"../index.jsp";
				response.setHeader( "REFRESH ",content);
			}else{
				java.sql.Date ban_time=service.getBan_time(user_id);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print("<script>alert(`由于多次发布违规内容，你已被限制登录 直到"+ban_time+"！`)</script>");
				String   content=0+ ";URL= "+request.getContextPath()+"/jsp/login/sign_in.jsp"; 
				response.setHeader( "REFRESH ",content);
			}
		}else{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`账号或密码错误，将自动返回登录页面！`)</script>");
			String   content=0+ ";URL= "+request.getContextPath()+"/jsp/login/sign_in.jsp"; 
			response.setHeader( "REFRESH ",content);
	
		}
	}

}
