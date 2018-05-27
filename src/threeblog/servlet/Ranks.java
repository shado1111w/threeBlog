package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.service.Service;


/**
 * Servlet implementation class Ranks
 * 生成验证码并传给第三方
 */
@WebServlet("/Ranks")
public class Ranks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ranks() {
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
		String mobile=request.getParameter("phone");
		System.out.println(mobile);
		int mobile_code = (int)((Math.random()*9+1)*100000); //获取6位随机数
		System.out.println("ranks:"+mobile_code);
		request.getSession().setAttribute("mobile_code",Integer.toString(mobile_code));
		Service service=new Service();
		service.ranks(mobile,mobile_code);
	}

}
