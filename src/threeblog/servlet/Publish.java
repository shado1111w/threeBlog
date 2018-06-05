package threeblog.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import threeblog.entity.Article;
import threeblog.service.Service;
import threeblog.tools.*;

/**
 * Servlet implementation class Publish
 * 发表文章
 */
@WebServlet("/Publish")
public class Publish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Publish() {
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
		//版本1
		/*
		request.setCharacterEncoding("utf-8");
		
		String title=request.getParameter("bt");
		String introduction=request.getParameter("pub_daoyu");
		String text=request.getParameter("editor");
		int author_id=1;
		author_id=Integer.valueOf((String)request.getSession().getAttribute("user_id"));
		String author=(String)request.getSession().getAttribute("username");
		
		System.out.println("title:"+title);
		System.out.println("introduction:"+introduction);
		System.out.println("text:"+text);
		System.out.println("author_id:"+author_id);
		System.out.println("author:"+author);
		
		Article article=new Article();
		article.setIntroduction(introduction);
		article.setText(text);
		article.setTitle(title);
		article.setAuthor_id(author_id);
		article.setAuthor(author);
		
		
		Service service=new Service();
		service.addArticle(article);
		
		request.setAttribute("title", title);
		request.setAttribute("text", text);
		request.setAttribute("author", author);
		request.getRequestDispatcher("../note.jsp").forward(request, response);*/
		//版本2
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
		//点击量初始化为0
		int click_num=0;
		//从表单获取
		String bt=null;
		String pub_daoyu=null;
		String editor=null;
		String pub_fengmian=null;
		String lable=null;
		String author=null;
		String allpic="";
		//从会话获取
		int author_id=Integer.valueOf((String)request.getSession().getAttribute("user_id"));
		
		 
		while(iterator.hasNext()){
			FileItem item=(FileItem)iterator.next();
			if(item.isFormField()){
				String value=item.getString("UTF-8");
				if(item.getFieldName().equals("bt")){
					bt=value;
				}else if(item.getFieldName().equals("pub_daoyu")){
					pub_daoyu=value;
				}else if(item.getFieldName().equals("editor")){
					editor=value;
				}else if(item.getFieldName().equals("lable")){
					lable=value;
				}
				else if(item.getFieldName().equals("author")){
					author=value;
				}
			}else{
				java.util.Date date=new java.util.Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String filename = sdf.format(date)+".jpg"; 
				String t1 = request.getServletContext().getRealPath("./") + "image"; 	
				String realFile=t1  +File.separator+ filename;
				System.out.println("realFile:"+realFile);
				File saveFile = new File(realFile);
				try {
                    item.write(saveFile);// 把上传的内容写到一个文件中
                    pub_fengmian="/threeBlog/image/"+filename;
                } catch (Exception e) {
                   //e.printStackTrace(); 
                   //String error=e.getMessage();
                    System.out.println("文件为空");
                }
				
			}
		}
		
		int current=0,a,b;
		String pattern_a="src=\""; //src="
		String pattern_b="\"";    //"
		
		while(true){
			a=editor.indexOf(pattern_a,current);  //查找返回s的位置
			if(a==-1) break;
			a+=pattern_a.length();  //a现在的位置为\的下一位,即h
			current=a;
			b=editor.indexOf(pattern_b,current); //查找返回s的位置 下一个查找从\的下一位(h)开始
			if(b==-1) break;
			String result=editor.substring(a,b);//[a,b)
			allpic=allpic+result+"#";
			current=b+pattern_b.length();//"的下一位		
		}
		Article article=new Article();
		SensitivewordFilter filter = new SensitivewordFilter();
		pub_daoyu=filter.replaceSensitiveWord(pub_daoyu,1,"*");
		editor=filter.replaceSensitiveWord(editor,1,"*");
		bt=filter.replaceSensitiveWord(bt,1,"*");
		lable=filter.replaceSensitiveWord(lable,1,"*");
		article.setIntroduction(pub_daoyu);
		article.setText(editor);
		article.setTitle(bt);
		article.setPic(pub_fengmian);
		article.setAuthor_id(author_id);
		article.setAuthor(author);
		article.setLable(lable);
		article.setClick_num(click_num);
		article.setAllpic(allpic);
		//获取服务器日期
		java.util.Date now=new java.util.Date();
		Date publishdate=new java.sql.Date(now.getTime());
		article.setPublishdate(publishdate);
		
		
		Service service=new Service();
		int id=0;
		id=service.addArticle(article); //将游记插入游记表，并返回该游记id
		
		if(id!=0){
		String content=0+ ";URL= "+request.getContextPath()+"/jsp/article/article.jsp?id="+id; 
		response.setHeader( "REFRESH ",content);
		}
	}

}
