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
 * µÇÂ¼
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
			int user_id=service.getIdFromPhonenum(phonenum);
			request.getSession().setAttribute("user_id",Integer.toString(user_id));
			response.setContentType("text/html;charset=utf-8");
			String   content=0+ ";URL= "+li_url; 
			response.setHeader( "REFRESH ",content);
		}else{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`ÕËºÅ»òÃÜÂë´íÎó£¬½«×Ô¶¯·µ»ØµÇÂ¼Ò³Ãæ£¡`)</script>");
			String   content=0+ ";URL= "+request.getContextPath()+"/jsp/login/sign_in.jsp"; 
			response.setHeader( "REFRESH ",content);
	
		}
	}

}
