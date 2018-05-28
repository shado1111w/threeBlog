package threeblog.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import threeblog.service.Service;

/**
 * Servlet implementation class ChangeInformation
 * 更改个人信息
 */
@WebServlet("/ChangeInformation")
public class ChangeInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInformation() {
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
		
		response.setContentType("text/html");
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		List items=null;
		try{
			items=upload.parseRequest(request);
		}catch(FileUploadException e){
			e.printStackTrace();
		}
		Iterator iterator=items.iterator();
		//从表单获取
		String age=null;
		String sex=null;
		String introduction=null;
		String province=null;
		String city=null;
		//图片
		String touxiang=null;
		//从会话获取
		int user_id=Integer.valueOf((String)request.getSession().getAttribute("user_id"));
		 
		while(iterator.hasNext()){
			FileItem item=(FileItem)iterator.next();
			if(item.isFormField()){
				String value=item.getString("UTF-8");
				if(item.getFieldName().equals("age")){
					age=value;
				}else if(item.getFieldName().equals("sex")){
					sex=value;
				}else if(item.getFieldName().equals("introduction")){
					introduction=value;
				}else if(item.getFieldName().equals("province")){
					province=value;
				}else if(item.getFieldName().equals("city")){
					city=value;
				}
			}else{
				Date date=new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String filename = sdf.format(date)+"."+item.getContentType().substring(6);
				String t1 = request.getServletContext().getRealPath("./") + "image"; 	
				String realFile=t1  +File.separator+ filename;
				System.out.println("realFile:"+realFile);
				File saveFile = new File(realFile);
				try {
                    item.write(saveFile);// 把上传的内容写到一个文件中
                    touxiang="/threeBlog/image/"+filename;
                } catch (Exception e) {
                   //e.printStackTrace(); 
                   //String error=e.getMessage();
                    System.out.println("文件为空");
                }
				
			}
		}
		threeblog.entity.User user=new threeblog.entity.User();
		user.setId(user_id);
		user.setAge(Integer.valueOf(age));
		user.setSex(sex);
		user.setProvince(province);
		user.setCity(city);
		user.setIntroduction(introduction);
		user.setTouxiang(touxiang);
		
		
		Service service=new Service();
		service.changeInformation(user);
		
		response.sendRedirect(request.getContextPath()+"/jsp/personal_center/personalcenter.jsp?id=5");
		
	}
	
	
	
	
}
