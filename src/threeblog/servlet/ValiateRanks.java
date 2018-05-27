package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ValiateRanks
 * ajax验证验证码是否错误
 */
@WebServlet("/ValiateRanks")
public class ValiateRanks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValiateRanks() {
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
		String result=null;
		String mobile_code1=request.getParameter("mobile_code");
		String mobile_code2=(String)request.getSession().getAttribute("mobile_code");
		if(mobile_code1.equals(mobile_code2)){
			 result="{'bol':true}";
		}
        else{  
       	result="{'bol':false}";
        }
		response.setContentType("test/html");  
        response.setCharacterEncoding("UTF-8");  
        response.getWriter().print(result); 
	}

}
