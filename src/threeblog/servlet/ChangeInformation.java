package threeblog.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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
		String username=null;
		String age=null;
		String sex=null;
		String address=null;
		String introduction=null;
		String job=null;
		String experience=null;
		//图片
		String touxiang=null;
		//用户名图片
		String usernamepic=null;
		//从会话获取
		int id=Integer.valueOf((String)request.getSession().getAttribute("user_id"));
		 
		while(iterator.hasNext()){
			FileItem item=(FileItem)iterator.next();
			if(item.isFormField()){
				String value=item.getString("UTF-8");
				if(item.getFieldName().equals("username")){
					username=value;
				}else if(item.getFieldName().equals("age")){
					age=value;
				}else if(item.getFieldName().equals("sex")){
					sex=value;
				}else if(item.getFieldName().equals("address")){
					address=value;
				}else if(item.getFieldName().equals("introduction")){
					introduction=value;
				}else if(item.getFieldName().equals("job")){
					job=value;
				}else if(item.getFieldName().equals("experience")){
					experience=value;
				}
			}else{
				String filedName=item.getFieldName();
				System.out.println("filedName:"+filedName);
				String filename=item.getName();
				String t1 = request.getServletContext().getRealPath("./") + "image"; 	
				String realFile=t1  +File.separator+ filename;
				System.out.println("realFile:"+realFile);
				File saveFile = new File(realFile);
				try {
                    item.write(saveFile);// 把上传的内容写到一个文件中
                    touxiang="/travelNote/image/"+filename;
                } catch (Exception e) {
                   //e.printStackTrace(); 
                   //String error=e.getMessage();
                    System.out.println("文件为空");
                }
				
			}
		}
		threeblog.entity.User user=new threeblog.entity.User();
		user.setId(id);
		user.setUsername(username);
		user.setAge(Integer.valueOf(age));
		user.setSex(sex);
		user.setAddress(address);
		user.setIntroduction(introduction);
		user.setJob(job);
		user.setExperience(experience);
		user.setTouxiang(touxiang);
		
		String name=String.valueOf((Math.random()*9+1)*100000);
		String filename=name+".png";
		String t1 = request.getServletContext().getRealPath("./") + "image"; 	
		String realFile=t1  +File.separator+ filename;
		int width=numOfString(username)*17;
		int height=55;
		createImage(username, new Font("华文行楷", Font.PLAIN, 50), new File(realFile), width, height);
		usernamepic="/travelNote/image/"+filename;
		user.setUsernamepic(usernamepic);
		
		Service service=new Service();
		service.changeInformation(user);
		
		response.sendRedirect("../login_jsp/personalcenter.jsp?res=3");
		
	}
	
	public void createImage(String str, Font font, File outFile, Integer width, Integer height) throws IOException {
		// 创建图片
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		Graphics g = image.getGraphics();
		g.setClip(0, 0, width, height);
		g.setColor(Color.white);
		// g.fillRect(0, 0, width, height);// 先用黑色填充整张图片,也就是背景
		// g.setColor(Color.black);// 在换成黑色
		g.setFont(font);// 设置画笔字体
		/** 用于获得垂直居中y */
		Rectangle clip = g.getClipBounds();
		FontMetrics fm = g.getFontMetrics(font);
		int ascent = fm.getAscent();
		int descent = fm.getDescent();
		int y = (clip.height - (ascent + descent)) / 2 + ascent;
		for (int i = 0; i < 6; i++) {// 256 340 0 680
			g.drawString(str, i * 680, y);// 画出字符串
		}
		g.dispose();
		ImageIO.write(image, "png", outFile);// 输出png图片
	}
	
	public int numOfString(String name){
		int num=0;
		for(int i=0;i<name.length();i++){
			char c=name.charAt(i);
			if(Character.isLowerCase(c)){
				num+=1;
			}else if(Character.isUpperCase(c)){
				num+=2;
			}
			else{
				num+=3;
			}
		}
		return num;
	}

}
