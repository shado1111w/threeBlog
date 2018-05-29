package threeblog.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Timestamp;
import java.util.ArrayList;


import threeblog.db.*;
import threeblog.entity.*;


public class Service {
	
	
	//1.对用户表进行的操作 *************************************************
	
	
	
	//根据手机号和密码进行登录
	public boolean login(String username,String password){
		boolean b=false;
		
		DbConMysql db=new DbConMysql();
   	 	ResultSet rs=db.getQuery("select * from t_user");
		try {
			tag:
			while(rs.next()){
				String aname=rs.getString("phonenum");
				String apass=rs.getString("password");
				System.out.println(aname);
				System.out.println(apass);
				
				if(aname.equals(username)&&apass.equals(password)){
					System.out.println("登入成功！");
					b=true;
					break tag;
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	//注册界面，ajax判断手机号是否已经存在
	public boolean valiatePhonenum(String phonenum){
		
		boolean b=false;
		
		DbConMysql db=new DbConMysql();
   	 	ResultSet rs=db.getQuery("select * from t_user");
		try {
			tag:
			while(rs.next()){
				String aname=rs.getString("phonenum");
				System.out.println(aname);
				
				if(aname.equals(phonenum)){
					System.out.println("注册失败！");
					b=true;
					break tag;
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	//注册用户
	public int regeditUser(User user){
		int flag;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_user(phonenum,username,password)"
				+ " values ('"+user.getPhonenum()+"','"+user.getUsername()+"','"+user.getPassword()+"')";
		
		flag=db.insert(sql);
		
		return flag;
	}
	//验证密码
	public boolean valiatePassword(String password,int user_id){
			
			boolean b=false;
			
			DbConMysql db=new DbConMysql();
	   	 	ResultSet rs=db.getQuery("select * from t_user where id='"+user_id+"'");
			try {
				if(rs.next()){
					String aname=rs.getString("password");
					System.out.println(aname);
					
					if(aname.equals(password)){
						System.out.println("注册失败！");
						b=true;
					}
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return b;
		}
	//修改密码
	public boolean changePassword(String phonenum,String password){
		boolean b=false;
		DbConMysql db=new DbConMysql();
		String sql="UPDATE t_user SET password='"+password+"' WHERE phonenum='"+phonenum+"'";
		
		int i=0;
		i=db.update(sql);
		if(i==0){
			return b;
		}
		else{
			b=true;
			return b;
		}
	}
	//修改密码
		public boolean modifyPassword(int user_id,String password){
			boolean b=false;
			DbConMysql db=new DbConMysql();
			String sql="UPDATE t_user SET password='"+password+"' WHERE id='"+user_id+"'";
			
			int i=0;
			i=db.update(sql);
			if(i==0){
				return b;
			}
			else{
				b=true;
				return b;
			}
		}
	//通过手机号获取用户唯一id
	public int getIdFromPhonenum(String phonenum){
			DbConMysql db=new DbConMysql();
			int id=1;
			String sql="SELECT * FROM t_user WHERE phonenum='"+phonenum+"'";
			
	   	 	ResultSet rs=db.getQuery(sql);
	   	 	
			try {
				tag:
				while(rs.next()){
					id=rs.getInt("id");
					System.out.println(id);
						break tag;
					}
					
				}
				catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return id;
		}
	//更改用户个人信息
	public int changeInformation(User user){
			int flag;
			String sql=null;
			DbConMysql db=new DbConMysql();
			if(user.getTouxiang()!=null){
				sql="UPDATE t_user SET "
					+"age='"+user.getAge()+"',"
					+"sex='"+user.getSex()+"',"
					+"province='"+user.getProvince()+"',"
					+"city='"+user.getCity()+"',"
					+"introduction='"+user.getIntroduction()+"',"
					+"touxiang='"+user.getTouxiang()
					+"' WHERE id='"+user.getId()+"'";
			}else{
				sql="UPDATE t_user SET "
					+"age='"+user.getAge()+"',"
					+"sex='"+user.getSex()+"',"
					+"province='"+user.getProvince()+"',"
					+"city='"+user.getCity()+"',"
					+"introduction='"+user.getIntroduction()
					+"' WHERE id='"+user.getId()+"'";
			}
			flag=db.update(sql);
			return flag;
		}
	//通过用户唯一id获取用户所有信息
	public User getUserFromId(int id){
			User user=new User();
			user.setId(id);
			DbConMysql db=new DbConMysql();
			String sql="select * from t_user where id='"+String.valueOf(id)+"'";
	   	 	ResultSet rs=db.getQuery(sql);
			try {
				tag:
				while(rs.next()){
					String username=rs.getString("username");
					user.setUsername(username);
					int age=rs.getInt("age");
					user.setAge(age);
					String sex=rs.getString("sex");
					user.setSex(sex);
					String province=rs.getString("province");
					user.setProvince(province);
					String city=rs.getString("city");
					user.setCity(city);
					String introduction=rs.getString("introduction");
					user.setIntroduction(introduction);
					String touxiang=rs.getString("touxiang");
					user.setTouxiang(touxiang);
					Date register_time=rs.getDate("register_time");
					user.setRegister_time(register_time);
					String phonenum=rs.getString("phonenum");
					user.setPhonenum(phonenum);
				    break tag;
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return user;
		}
	//通过用户id获取用户相册
	public String getAlbumFromUser_id(int user_id){
		String album="";
		DbConMysql db=new DbConMysql();
		String sql="select * from t_user where id='"+user_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			if(rs.next()){
				if(rs.getString("album")!=null){
					album=rs.getString("album");
				}
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return album;	
	}
	//更新用户相册
	public void updateAlbumByUser_idAlbum(int user_id,String album){
		DbConMysql db=new DbConMysql();
		String sql="update t_user set album ='"+album+"' where id='"+user_id+"'";
		db.update(sql);
	}
	//注册界面，ajax判断用户名是否已经存在
	public boolean valiateUsername(String username){
		
		boolean b=false;
		
		DbConMysql db=new DbConMysql();
   	 	ResultSet rs=db.getQuery("select * from t_user");
		try {
			tag:
			while(rs.next()){
				String aname=rs.getString("username");
				System.out.println(aname);
				
				if(aname.equals(username)){
					System.out.println("注册失败！");
					b=true;
					break tag;
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	
	//*************************************************************
	
	
	
	//2.对文章表进行的操作 *************************************************

	
	
	//发表文章 
	public int addArticle(Article article){
			int id=0;
			DbConMysql db=new DbConMysql();
			String sql="insert into t_article(author_id,title,introduction,text,author,fengmian,publishdate,lable,click_num,allpic)"
					+ " values ('" 
					+article.getAuthor_id()+ "','" 
					+article.getTitle()+ "','" 
					+article.getIntroduction()  + "','"
					+article.getText() + "','"
					+article.getAuthor()+ "','"
					+article.getPic()+ "','"
					+article.getPublishdate()+ "','"
					+article.getLable()+ "','"
					+article.getClick_num()+ "','"
					+article.getAllpic()
					+ "')" ;
			db.insert(sql);
			
			String sql2="select max(id) from t_article";
			ResultSet rs=db.getQuery(sql2);
			try{
				if(rs.next()){
					id=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return id;
		}
	//通过用户唯一id获取其发表的所有文章
	public ArrayList<Article> getArticlesFromId(int author_id){
			ArrayList<Article> articles=new ArrayList<Article>();
			
			DbConMysql db=new DbConMysql();
			String sql="select * from t_Article where author_id='"+String.valueOf(author_id)+"'";
			ResultSet rs=db.getQuery(sql);
			try {
				while(rs.next()){
					Article article=new Article();
					int click_num=rs.getInt("click_num");
					article.setClick_num(click_num);
					String fengmian=rs.getString("fengmian");
					article.setPic(fengmian);
					String title=rs.getString("title");
					article.setTitle(title);
					String introduction=rs.getString("introduction");
					article.setIntroduction(introduction);
					String lable=rs.getString("lable");
					article.setLable(lable);
					String text=rs.getString("text");
					article.setText(text);
					String author=rs.getString("author");
					article.setAuthor(author);
					Date publishdate=rs.getDate("publishdate");
					article.setPublishdate(publishdate);
					String id=rs.getString("id");
					article.setId(Integer.valueOf(id));
					article.setAuthor_id(author_id);
					String allpic=rs.getString("allpic");
					article.setAllpic(allpic);
					articles.add(article);
					
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return articles;
		}
	//获取所有文章
	public ArrayList<Article> getAllArticles(){
		ArrayList<Article> articles=new ArrayList<Article>();
		
		DbConMysql db=new DbConMysql();
		String sql="select * from t_Article ORDER BY RAND()";
		ResultSet rs=db.getQuery(sql);
		try {
			while(rs.next()){
				Article article=new Article();
				int click_num=rs.getInt("click_num");
				article.setClick_num(click_num);
				String fengmian=rs.getString("fengmian");
				article.setPic(fengmian);
				String title=rs.getString("title");
				article.setTitle(title);
				String introduction=rs.getString("introduction");
				article.setIntroduction(introduction);
				String lable=rs.getString("lable");
				article.setLable(lable);
				String text=rs.getString("text");
				article.setText(text);
				String author=rs.getString("author");
				article.setAuthor(author);
				Date publishdate=rs.getDate("publishdate");
				article.setPublishdate(publishdate);
				String id=rs.getString("id");
				article.setId(Integer.valueOf(id));
				int author_id=rs.getInt("author_id");
				article.setAuthor_id(author_id);
				String allpic=rs.getString("allpic");
				article.setAllpic(allpic);
				int liked=rs.getInt("liked");
				article.setLiked(liked);
				int collected=rs.getInt("collected");
				article.setCollected(collected);
				articles.add(article);
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articles;
	}
	//获取按照发表日期排序的文章
	public ArrayList<Article> getAllArticlesOrderByPublishdateDESC(){
		ArrayList<Article> articles=new ArrayList<Article>();
		
		DbConMysql db=new DbConMysql();
		String sql="select * from t_Article ORDER BY publishdate DESC";
		ResultSet rs=db.getQuery(sql);
		try {
			while(rs.next()){
				Article article=new Article();
				int click_num=rs.getInt("click_num");
				article.setClick_num(click_num);
				String fengmian=rs.getString("fengmian");
				article.setPic(fengmian);
				String title=rs.getString("title");
				article.setTitle(title);
				String introduction=rs.getString("introduction");
				article.setIntroduction(introduction);
				String lable=rs.getString("lable");
				article.setLable(lable);
				String text=rs.getString("text");
				article.setText(text);
				String author=rs.getString("author");
				article.setAuthor(author);
				Date publishdate=rs.getDate("publishdate");
				article.setPublishdate(publishdate);
				String id=rs.getString("id");
				article.setId(Integer.valueOf(id));
				int author_id=rs.getInt("author_id");
				article.setAuthor_id(author_id);
				String allpic=rs.getString("allpic");
				article.setAllpic(allpic);
				int liked=rs.getInt("liked");
				article.setLiked(liked);
				int collected=rs.getInt("collected");
				article.setCollected(collected);
				articles.add(article);
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articles;
	}
	//获取按照点击量排序的文章
	public ArrayList<Article> getAllArticlesOrderByClicknumDESC(){
		ArrayList<Article> articles=new ArrayList<Article>();
		
		DbConMysql db=new DbConMysql();
		String sql="select * from t_Article ORDER BY click_num DESC";
		ResultSet rs=db.getQuery(sql);
		try {
			while(rs.next()){
				Article article=new Article();
				int click_num=rs.getInt("click_num");
				article.setClick_num(click_num);
				String fengmian=rs.getString("fengmian");
				article.setPic(fengmian);
				String title=rs.getString("title");
				article.setTitle(title);
				String introduction=rs.getString("introduction");
				article.setIntroduction(introduction);
				String lable=rs.getString("lable");
				article.setLable(lable);
				String text=rs.getString("text");
				article.setText(text);
				String author=rs.getString("author");
				article.setAuthor(author);
				Date publishdate=rs.getDate("publishdate");
				article.setPublishdate(publishdate);
				String id=rs.getString("id");
				article.setId(Integer.valueOf(id));
				int author_id=rs.getInt("author_id");
				article.setAuthor_id(author_id);
				String allpic=rs.getString("allpic");
				article.setAllpic(allpic);
				int liked=rs.getInt("liked");
				article.setLiked(liked);
				int collected=rs.getInt("collected");
				article.setCollected(collected);
				articles.add(article);
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articles;
	}
	//通过文章id获取文章
	public Article getArticleFromId(int article_id){

		Article article=new Article();
		article.setId(article_id);
		DbConMysql db=new DbConMysql();
		String sql="select * from t_article where id='"+String.valueOf(article_id)+"'";
   	 	ResultSet rs=db.getQuery(sql);
		try {
			while(rs.next()){
				int click_num=rs.getInt("click_num");
				article.setClick_num(click_num);
				int author_id=rs.getInt("author_id");
				article.setAuthor_id(author_id);
				String fengmian=rs.getString("fengmian");
				article.setPic(fengmian);
				String title=rs.getString("title");
				article.setTitle(title);
				String introduction=rs.getString("introduction");
				article.setIntroduction(introduction);
				String lable=rs.getString("lable");
				article.setLable(lable);
				String text=rs.getString("text");
				article.setText(text);
				String author=rs.getString("author");
				article.setAuthor(author);
				Date publishdate=rs.getDate("publishdate");
				article.setPublishdate(publishdate);
				String allpic=rs.getString("allpic");
				article.setAllpic(allpic);  
				int liked=rs.getInt("liked");
				article.setLiked(liked);
				int collected=rs.getInt("collected");
				article.setCollected(collected);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return article;
	}
	//刷新点击量
	public void updateArticleClicknum(Article article){
		DbConMysql db=new DbConMysql();
		String sql="UPDATE t_article SET "
				+"click_num='"+article.getClick_num()
				+"' WHERE id='"+article.getId()+"'";
		db.update(sql);
	}
	//刷新喜欢数量
	public void updateArticleLiked(Article article){
			DbConMysql db=new DbConMysql();
			String sql="UPDATE t_article SET "
					+"liked='"+article.getLiked()
					+"' WHERE id='"+article.getId()+"'";
			db.update(sql);
		}
	//刷新收藏数量
	public void updateArticleCollected(Article article){
				DbConMysql db=new DbConMysql();
				String sql="UPDATE t_article SET "
						+"collected='"+article.getCollected()
						+"' WHERE id='"+article.getId()+"'";
				db.update(sql);
			}
	
	
	//*************************************************************
	
	
	
	
	//3.对评论表进行的操作 *************************************************
	
	
	
	//添加评论
	public int addComment(Comment comment){
			int id=0;
			DbConMysql db=new DbConMysql();
			String sql="insert into t_comment(article_id,author_id,text,add_time)"
					+ " values ('" 
					+comment.getArticle_id()+ "','" 
					+comment.getAuthor_id()+ "','" 
					+comment.getText()+ "','"
					+comment.getAdd_time()
					+ "')" ;
			db.insert(sql);
			
			String sql2="select max(id) from t_comment";
			ResultSet rs=db.getQuery(sql2);
			try{
				if(rs.next()){
					id=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return id;
		}
	//更新评论点赞数
	public void updateCommentZan(Comment comment){
			DbConMysql db=new DbConMysql();
			String sql="UPDATE t_comment SET "
					+"zan='"+comment.getZan()
					+"' WHERE id='"+comment.getId()+"'";
			db.update(sql);
		}
	//通过评论id获取评论
	public Comment getCommentFromComment_id(int comment_id){
		DbConMysql db=new DbConMysql();
		String sql="select * from t_comment where id='"+comment_id+"'";
		ResultSet rs=db.getQuery(sql);
		Comment comment=new Comment();
		try{
			if(rs.next()){
				comment.setId(comment_id);
				int article_id=rs.getInt("article_id");
				comment.setArticle_id(article_id);
				int author_id=rs.getInt("author_id");
				comment.setAuthor_id(author_id);
				String text=rs.getString("text");
				comment.setText(text);
				Timestamp add_time=rs.getTimestamp("add_time");
				comment.setAdd_time(add_time);
				int zan=rs.getInt("zan");
				comment.setZan(zan);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return comment;
		
	}	
	//通过文章id获取所有评论
	public ArrayList<Comment> getCommentsFromArticle_id(int article_id){
		DbConMysql db=new DbConMysql();
		String sql="select * from t_comment where article_id='"+article_id+"' ORDER BY id DESC";
		ResultSet rs=db.getQuery(sql);
		ArrayList<Comment> comments=new ArrayList<Comment>();
		try{
				while(rs.next()){
					Comment comment=new Comment();
					comment.setArticle_id(article_id);
					int id=rs.getInt("id");
					comment.setId(id);
					int author_id=rs.getInt("author_id");
					comment.setAuthor_id(author_id);
					String text=rs.getString("text");
					comment.setText(text);
					Timestamp add_time=rs.getTimestamp("add_time");
					comment.setAdd_time(add_time);
					int zan=rs.getInt("zan");
					comment.setZan(zan);
					comments.add(comment);
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		return comments;
	}
	
	
	//*************************************************************
	
	
	
	//4.对回复表进行的操作 *************************************************
	
	
	
	//添加回复（对评论） 
	public int addAnswer(Answer answer){
			int id=0;
			DbConMysql db=new DbConMysql();
			String sql="insert into t_answer(comment_id,author_id,text,add_time)"
					+ " values ('" 
					+answer.getComment_id()+ "','" 
					+answer.getAuthor_id()+ "','" 
					+answer.getText()+ "','"
					+answer.getAdd_time()
					+ "')" ;
			db.insert(sql);
			
			String sql2="select max(id) from t_answer";
			ResultSet rs=db.getQuery(sql2);
			try{
				if(rs.next()){
					id=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return id;
		}
	//通过评论id获取对应评论的回复
	public ArrayList<Answer> getAnswersFromArticle_idComment_id(int comment_id){
			DbConMysql db=new DbConMysql();
			String sql="select * from t_answer where comment_id='"+comment_id+"'ORDER BY id DESC";
			ResultSet rs=db.getQuery(sql);
			ArrayList<Answer> answers=new ArrayList<Answer>();
			try{
					while(rs.next()){
						Answer answer=new Answer();
						answer.setComment_id(comment_id);
						int id=rs.getInt("id");
						answer.setId(id);
						int author_id=rs.getInt("author_id");
						answer.setAuthor_id(author_id);
						String text=rs.getString("text");
						answer.setText(text);
						Timestamp add_time=rs.getTimestamp("add_time");
						answer.setAdd_time(add_time);
						int zan=rs.getInt("zan");
						answer.setZan(zan);
						answers.add(answer);	
					}
				}catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			return answers;
		}
	//通过回复id获取回复
	public Answer getAnswertFromAnswer_id(int answer_id){
			DbConMysql db=new DbConMysql();
			String sql="select * from t_answer where id='"+answer_id+"'";
			ResultSet rs=db.getQuery(sql);
			Answer answer=new Answer();
			try{
				if(rs.next()){
					answer.setId(answer_id);
					int comment_id=rs.getInt("comment_id");
					answer.setComment_id(comment_id);
					int author_id=rs.getInt("author_id");
					answer.setAuthor_id(author_id);
					String text=rs.getString("text");
					answer.setText(text);
					Timestamp add_time=rs.getTimestamp("add_time");
					answer.setAdd_time(add_time);
					int zan=rs.getInt("zan");
					answer.setZan(zan);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return answer;
			
		}
	//更新回复点赞数
	public void updateAnswerZan(Answer answer){
			DbConMysql db=new DbConMysql();
			String sql="UPDATE t_answer SET "
					+"zan='"+answer.getZan()
					+"' WHERE id='"+answer.getId()+"'";
			db.update(sql);
		}
	
	
	
	//*************************************************************
	
	
	
	//5.对收藏表进行的操作 *************************************************
	
	
	
	//添加用户收藏记录
	public int addCollectRecord(Collect collect){
		int flag;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_collect(user_id,article_id,collectdate)"
				+ " values ('"+collect.getUser_id()+"','"+collect.getArticle_id()+"','"+collect.getCollectdate() +"')";
		
		flag=db.insert(sql);
		
		return flag;
	}
	//删除用户收藏记录
	public void deleteCollectRecord(Collect collect){
		
		DbConMysql db=new DbConMysql();
		String sql="DELETE FROM t_collect where user_id='"
				+collect.getUser_id()+"' and article_id='"+collect.getArticle_id()+"'";
		
		db.delete(sql);

	}
	//删除用户收藏记录2
	public void deleteCollectRecord(int id){
		
		DbConMysql db=new DbConMysql();
		String sql="DELETE FROM t_collect where id='"
				+id+"'";
		
		db.delete(sql);

	}
	//通过用户唯一id获取所有收藏
	public ArrayList<Collect> getCollectFromUser_id(int user_id){
		DbConMysql db=new DbConMysql();
		String sql="select * from t_collect where user_id='"+user_id+"'";
		ResultSet rs=db.getQuery(sql);
		ArrayList<Collect> collects=new ArrayList<Collect>();
		try{
			while(rs.next()){
				Collect collect=new Collect();
				collect.setUser_id(user_id);
				int id=rs.getInt("id");
				collect.setId(id);
				int article_id=rs.getInt("article_id");
				collect.setArticle_id(article_id);
				Date collectdate=rs.getDate("collectdate");
				collect.setCollectdate(collectdate);
				collects.add(collect);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return collects;
	}
	//通过用户id和文章id获取收藏
	public Collect getCollectFromUser_idArticle_id(int user_id,int article_id){
		DbConMysql db=new DbConMysql();
		String sql="select * from t_collect where user_id='"+user_id+"' and article_id='"+article_id+"'";
		ResultSet rs=db.getQuery(sql);
		Collect collect=new Collect();
		try{
			if(rs.next()){
				int id=rs.getInt("id");
				collect.setId(id);
				int user_id1=rs.getInt("user_id");
				collect.setUser_id(user_id1);
				int article_id1=rs.getInt("article_id");
				collect.setArticle_id(article_id1);
				Date collectdate=rs.getDate("collectdate");
				collect.setCollectdate(collectdate);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return collect;
	}
		
	
	//*************************************************************
	
	
	
	
	//6.对消息表进行的操作 *************************************************
	
	
	
	
	//添加推送消息
	public void addMessage(Message message){
		DbConMysql db=new DbConMysql();
		String sql="insert into t_message(type,receiver_id,answer_id,article_id,text1,text2,add_time)"
				+ " values ('" 
				+message.getType()+ "','" 
				+message.getReceiver_id()+ "','" 
				+message.getAnswer_id()+ "','" 
				+message.getArticle_id()+ "','" 
				+message.getText1()+ "','" 
				+message.getText2()+ "','" 
				+message.getAdd_time()
				+ "')" ;
		db.insert(sql);
	}
	//通过用户id获取他的未读消息
	public ArrayList<Message> getMessagesFromReceiver_id(int receiver_id){
		DbConMysql db=new DbConMysql();
		String sql="select * from t_message where receiver_id='"+receiver_id+"'";
		ResultSet rs=db.getQuery(sql);
		ArrayList<Message> messages=new ArrayList<>();
		try{
			while(rs.next()){
				Message message=new Message();
				int id=rs.getInt("id");
				message.setId(id);
				String type=rs.getString("type");
				message.setType(type);
				message.setReceiver_id(receiver_id);
				int answer_id=rs.getInt("answer_id");
				message.setAnswer_id(answer_id);
				int article_id=rs.getInt("article_id");
				message.setArticle_id(article_id);
				String text1=rs.getString("text1");
				message.setText1(text1);
				String text2=rs.getString("text2");
				message.setText2(text2);
				Timestamp add_time=rs.getTimestamp("add_time");
				message.setAdd_time(add_time);
				messages.add(message);
			}
				
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return messages;
		
	}
	//通过用id获取他的未读消息数目
	public int getMessagesNumFromReceiver_id(int receiver_id){
		int n=0;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_message where receiver_id='"+receiver_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				n++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return n;
		
	}
	//根据消息id删除推送消息
	public void deleteMessageFromId(int message_id){
		DbConMysql db=new DbConMysql();
		String sql="delete from t_message where id='"+message_id+"'";
		db.delete(sql);
		
	}
	
	
	
	//*************************************************************	
	
	
	//7.其他操作 *************************************************
	
	
	
	//通过第三方发送验证码
	public void ranks(String mobile,int mobile_code){
		
			String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

			String account = "C75701268"; //查看用户名是登录用户中心->验证码短信->产品总览->APIID
			String password = "c6c07ee61458f5de07edb63e61a4f302";  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
			String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");

			try {

				URL url = new URL(postUrl);
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setDoOutput(true);//允许连接提交信息
				connection.setRequestMethod("POST");//网页提交方式“GET”、“POST”
				connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				connection.setRequestProperty("Connection", "Keep-Alive");
				StringBuffer sb = new StringBuffer();
				sb.append("account="+account);
				sb.append("&password="+password);
				sb.append("&mobile="+mobile);
				sb.append("&content="+content);
				OutputStream os = connection.getOutputStream();
				os.write(sb.toString().getBytes());
				os.close();

				String line, result = "";
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				while ((line = in.readLine()) != null) {
					result += line + "\n";
				}
				in.close();
				System.out.println(result);

			} catch (IOException e) {
				e.printStackTrace(System.out);
			}
		}
	
	
	
	//*************************************************************	

	
	
	//8.对举报表进行操作 *************************************************
	
	
	
	//添加举报信息
	public int addReport(Report report){
		int n;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_report(username,type,content,simple_reason,all_reason,url)"
				+ " values ('" 
				+report.getUsername()+ "','" 
				+report.getType()+ "','" 
				+report.getContent()+ "','"
				+report.getSimple_reason()+ "','"
				+report.getAll_reason()+ "','"
				+report.getUrl()
				+ "')" ;
		n=db.insert(sql);
		return n;
	}
	//根据举报类型返回举报信息
	public ArrayList<Report> getReportFromType(String type){
		DbConMysql db=new DbConMysql();
		ArrayList<Report> reports=new ArrayList<>();
		String sql="select * from t_report where type='"+type+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				Report report=new Report();
				int id=rs.getInt("id");
				report.setId(id);
				String username=rs.getString("username");
				report.setUsername(username);
				report.setType(type);
				String content=rs.getString("content");
				report.setContent(content);
				String simple_reason=rs.getString("simple_reason");
				report.setSimple_reason(simple_reason);
				String all_reason=rs.getString("all_reason");
				report.setAll_reason(all_reason);
				String url=rs.getString("url");
				report.setUrl(url);
				reports.add(report);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reports;
	}
	
	
	
	//*************************************************************	

}

