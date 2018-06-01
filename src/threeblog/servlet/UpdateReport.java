package threeblog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import threeblog.entity.Report;
import threeblog.entity.Zan;
import threeblog.service.Service;

/**
 * Servlet implementation class UpdateReport
 */
@WebServlet("/UpdateReport")
public class UpdateReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReport() {
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
		Report report=new Report();
		int report_id=Integer.valueOf(request.getParameter("report_id"));
		report.setId(report_id);
		String status=null;
		String status2=null;
		String status3=null;
		String feedback_reason=null;
		if(request.getParameter("status")!=null) {status=request.getParameter("status");report.setStatus(status);}
		if(request.getParameter("status2")!=null) {status2=request.getParameter("status2");report.setStatus2(status2);}
		if(request.getParameter("status3")!=null) {status3=request.getParameter("status3");report.setStatus3(status3);}
		if(request.getParameter("feedback_reason")!=null) {feedback_reason=request.getParameter("feedback_reason");report.setFeedback_reason(feedback_reason);;}
		Service service=new Service();
		service.updateReportStatus(report);
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("<script>alert(`反馈成功！请静候管理员处理！`)</script>");
		String   content=0+ ";URL= "+request.getContextPath()+"/jsp/report_center/reportcenter.jsp?id=2"; 
		response.setHeader( "REFRESH ",content);
	}

}
