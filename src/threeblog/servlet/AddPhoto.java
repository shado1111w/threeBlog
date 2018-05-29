package threeblog.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import threeblog.service.Service;

/**
 * Servlet implementation class AddPhoto
 */
@WebServlet("/AddPhoto")
public class AddPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPhoto() {
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
		int id=Integer.valueOf((String)request.getSession().getAttribute("user_id"));
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload upload=new ServletFileUpload(factory);
		List items=null;
		try{
			items=upload.parseRequest(request);
		}catch (FileUploadException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Iterator iterator=items.iterator();
		Service service=new Service();
		String album=service.getAlbumFromUser_id(id);
		
		while(iterator.hasNext()){
			FileItem item=(FileItem)iterator.next();
			String filedName=item.getFieldName();
			System.out.println("filedName:"+filedName);
			String filename=item.getName();
			String t1 = request.getServletContext().getRealPath("./") + "image"; 	
			String realFile=t1  +File.separator+ filename;
			System.out.println("realFile:"+realFile);
			File saveFile = new File(realFile);
			try {
                item.write(saveFile);// 把上传的内容写到一个文件中
                String tString="/threeBlog/image/"+filename+"#";
                album=album+tString;
            } catch (Exception e) {
               //e.printStackTrace(); 
               //String error=e.getMessage();
                System.out.println("文件为空");
            }
		}
		service.updateAlbumByUser_idAlbum(id, album);
	}

}
