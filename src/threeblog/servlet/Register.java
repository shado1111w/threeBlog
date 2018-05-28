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
 * Servlet implementation class register
 * 注册
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		request.setCharacterEncoding("utf-8");
		
		String username="";
		String password="";
		String phonenum="";
	
		
		
		phonenum=request.getParameter("phonenum");
		username=request.getParameter("username");
		System.out.println("手机号:"+username);
		password=request.getParameter("pass1");

		
		User user=new User();
		user.setUsername(username);
		user.setPhonenum(phonenum);
		user.setPassword(password);
		
		
		Service service=new Service();
		int flag=service.regeditUser(user);
		if(flag==1){
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`注册完成，将自动返回登录页面！`)</script>");
			String   content=3+ ";URL= "+"../jsp/login/sign_in.jsp"; 
			response.setHeader( "REFRESH ",content);
		}else{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`未知错误，请重试！`)</script>");
			String   content=3+ ";URL= "+"../jsp/login/register.jsp"; 
			response.setHeader( "REFRESH ",content);
		}
		
	}

}
