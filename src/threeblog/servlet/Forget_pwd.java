package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.service.Service;

/**
 * Servlet implementation class Forget_pwd
 * 更改密码
 */
@WebServlet("/Forget_pwd")
public class Forget_pwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forget_pwd() {
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
		String username="";
		String password="";
		request.setCharacterEncoding("utf-8");
		
		username=request.getParameter("zh");
		password=request.getParameter("pass1");
		
		
		System.out.println("username:"+username);
		System.out.println("password:"+password);
		
		Service service = new Service();
		boolean b=service.changePassword(username, password);
		if(b){
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`修改密码完成，将自动返回登录页面！`)</script>");
			String   content=0+ ";URL= "+"../jichu/login.jsp"; 
			response.setHeader( "REFRESH ",content);
		}else{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`未知错误，请重试！`)</script>");
			String   content=3+ ";URL= "+"../jichu/forget_pwd.jsp"; 
			response.setHeader( "REFRESH ",content);
		}
		
	}

}
