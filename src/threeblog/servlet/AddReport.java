package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Report;
import threeblog.service.Service;

/**
 * Servlet implementation class AddReport
 */
@WebServlet("/AddReport")
public class AddReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReport() {
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
		String url=request.getParameter("url");
		String username=request.getParameter("username");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		String simple_reason=request.getParameter("simple_reason");
		String all_reason=request.getParameter("all_reason");
		System.out.println("type:"+type);
		System.out.println("username:"+username);
		Report report=new Report();
		report.setUrl(url);
		report.setUsername(username);
		report.setType(type);
		if(type.equals("举报文章")){
			content="null";
			report.setContent(content);
		}else{
			report.setContent(content);
		}
		report.setSimple_reason(simple_reason);
		report.setAll_reason(all_reason);
		Service service=new Service();
		int n=service.addReport(report);
		if(n==0){
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`用户ID不存在，请重新填写！`)</script>");
			String   content1=0+ ";URL= "+"../login_jsp/report_center.jsp"; 
			response.setHeader( "REFRESH ",content1);
		}
		else{
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print("<script>alert(`举报成功，请等待管理员处理！`)</script>");
			String   content1=0+ ";URL= "+"../login_jsp/report_center.jsp"; 
			response.setHeader( "REFRESH ",content1);
		}
	}

}
