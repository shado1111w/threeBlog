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
import java.util.List;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import threeblog.db.*;
import threeblog.tools.*;
import threeblog.entity.*;


public class Service {
	
	
	//1.���û�����еĲ��� *************************************************
	
	
	
	//�����ֻ��ź�������е�¼
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
					System.out.println("����ɹ���");
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
	//ע����棬ajax�ж��ֻ����Ƿ��Ѿ�����
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
					System.out.println("ע��ʧ�ܣ�");
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
	//ע���û�
	public int regeditUser(User user){
		int flag;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_user(phonenum,username,password,register_time)"
				+ " values ('"+user.getPhonenum()+"','"+user.getUsername()+"','"+user.getPassword()+"','"+user.getRegister_time()+"')";
		
		flag=db.insert(sql);
		
		return flag;
	}
	//��֤����
	public boolean valiatePassword(String password,int user_id){
			
			boolean b=false;
			
			DbConMysql db=new DbConMysql();
	   	 	ResultSet rs=db.getQuery("select * from t_user where id='"+user_id+"'");
			try {
				if(rs.next()){
					String aname=rs.getString("password");
					System.out.println(aname);
					
					if(aname.equals(password)){
						System.out.println("ע��ʧ�ܣ�");
						b=true;
					}
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return b;
		}
	//�޸�����
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
	//�޸�����
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
	//ͨ���ֻ��Ż�ȡ�û�Ψһid
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
	//�����û�������Ϣ
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
	//ͨ���û�Ψһid��ȡ�û�������Ϣ
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
	//ͨ���û�id��ȡ�û����
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
	//�����û����
	public void updateAlbumByUser_idAlbum(int user_id,String album){
		DbConMysql db=new DbConMysql();
		String sql="update t_user set album ='"+album+"' where id='"+user_id+"'";
		db.update(sql);
	}
	//ע����棬ajax�ж��û����Ƿ��Ѿ�����
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
					System.out.println("ע��ʧ�ܣ�");
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
	//��ȡ�����û�����
	public int getAllUserNum(){
		int allUserNum=0;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_user";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				allUserNum++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return allUserNum;
	}
	//���µ�¼ʱ��
	public void updateLastLoginTime(int user_id,Date last_login_time){
		DbConMysql db=new DbConMysql();
		String sql="update t_user set last_login_time='"+last_login_time+"'where id='"+user_id+"'";
		db.update(sql);
		
	}
	//���ؽ���ע����û�
	public int getRegisterNum1(){
		int num=0;
		DbConMysql db=new DbConMysql();
		java.util.Date now=new java.util.Date();
		Date now_time=new Date(now.getTime());
		String sql="select * from t_user where DATEDIFF('"+now_time+"',register_time) <='1'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				num++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}
	
	//����7����ע����û�
	public int getRegisterNum2(){
			int num=0;
			DbConMysql db=new DbConMysql();
			java.util.Date now=new java.util.Date();
			Date now_time=new Date(now.getTime());
			String sql="select * from t_user where DATEDIFF('"+now_time+"',register_time)<='7'";
			ResultSet rs=db.getQuery(sql);
			try{
				while(rs.next()){
					num++;
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return num;
		}
	//����30����ע����û�
	public int getRegisterNum3(){
		int num=0;
		DbConMysql db=new DbConMysql();
		java.util.Date now=new java.util.Date();
		Date now_time=new Date(now.getTime());
		String sql="select * from t_user where DATEDIFF('"+now_time+"',register_time)<='30'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				num++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}
	//���ؽ����¼���û�
	public int getRegisterNum4(){
		int num=0;
		DbConMysql db=new DbConMysql();
		java.util.Date now=new java.util.Date();
		Date now_time=new Date(now.getTime());
		String sql="select * from t_user where DATEDIFF('"+now_time+"',last_login_time) <='1'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				num++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}	
	//����7���ڵ�¼���û�
	public int getRegisterNum5(){
				int num=0;
				DbConMysql db=new DbConMysql();
				java.util.Date now=new java.util.Date();
				Date now_time=new Date(now.getTime());
				String sql="select * from t_user where DATEDIFF('"+now_time+"',last_login_time) <='7'";
				ResultSet rs=db.getQuery(sql);
				try{
					while(rs.next()){
						num++;
					}
				}catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return num;
			}	
	//����30���ڵ�¼���û�
	public int getRegisterNum6(){
		int num=0;
		DbConMysql db=new DbConMysql();
		java.util.Date now=new java.util.Date();
		Date now_time=new Date(now.getTime());
		String sql="select * from t_user where DATEDIFF('"+now_time+"',last_login_time) <='30'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				num++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}	
	
	//�Ƿ����Ƶ�¼
	public boolean isBan(int user_id){
		boolean flag=false;
		DbConMysql db=new DbConMysql();
		java.util.Date now=new java.util.Date();
		Date now_time=new Date(now.getTime());
		String sql="select * from t_user where DATEDIFF(ban_time,'"+now_time+"') >='0' and id='"+user_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			if(rs.next()){
				flag=true;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	//���ر����Ƶ�¼ʱ��
	
	public Date getBan_time(int user_id){
		Date ban_time=null;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_user where id='"+user_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			if(rs.next()){
				ban_time=rs.getDate("ban_time");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return ban_time;
	}
	//*************************************************************
	
	public boolean updateUserBan_time(String username,Date ban_time){
		boolean flag=false;
		DbConMysql db=new DbConMysql();
		String sql="update t_user set ban_time='"+ban_time+"'where username='"+username+"'";
		if(db.update(sql)>0)
			flag=true;
		return flag;
	}
	
	
	//2.�����±���еĲ��� *************************************************

	
	
	//�������� 
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
	//ͨ���û�Ψһid��ȡ�䷢�����������
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
					int liked=rs.getInt("liked");
					article.setLiked(liked);
					int collected=rs.getInt("collected");
					article.setCollected(collected);
					int comment_num=rs.getInt("comment_num");
					article.setComment_num(comment_num);
					articles.add(article);
					
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return articles;
		}
	//��ȡ�������£��������
	public ArrayList<Article> getAllArticles(){
		ArrayList<Article> articles=new ArrayList<Article>();
		
		DbConMysql db=new DbConMysql();
		String sql="select * from t_Article where status!='����' ORDER BY RAND()";
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
				int comment_num=rs.getInt("comment_num");
				article.setComment_num(comment_num);
				articles.add(article);
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articles;
	}
	//��ȡ���շ����������������
	public ArrayList<Article> getAllArticlesOrderByPublishdateDESC(){
		ArrayList<Article> articles=new ArrayList<Article>();
		
		DbConMysql db=new DbConMysql();
		String sql="select * from t_Article where status!='����' ORDER BY publishdate DESC";
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
				int comment_num=rs.getInt("comment_num");
				article.setComment_num(comment_num);
				articles.add(article);
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articles;
	}
	//��ȡ���յ�������������
	public ArrayList<Article> getAllArticlesOrderByClicknumDESC(){
		ArrayList<Article> articles=new ArrayList<Article>();
		
		DbConMysql db=new DbConMysql();
		String sql="select * from t_Article where status!='����' ORDER BY click_num DESC";
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
				int comment_num=rs.getInt("comment_num");
				article.setComment_num(comment_num);
				articles.add(article);
				
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return articles;
	}
	
	
	
	
	//��ȡ���ű�ǩ top 9
		public List getLable() throws SQLException{
			String sql="SELECT lable,count(*) FROM t_article group  BY lable order BY count(*) DESC ";
			List lable=null;
			DbConMysql db=new DbConMysql();
			ResultSet rs=db.getQuery(sql);
			if(rs!=null){
				lable=new ArrayList();
				while(rs.next()){
					String temp_lable=new String();
					temp_lable=rs.getString(1);
					lable.add(temp_lable);
				}
			}
			return lable;
		}
	
	//��ȡ��������
		public ArrayList<Article> getArticlesBySearchName(String sname){
		    ChStr chStr=new ChStr();
			ArrayList<Article> articles=new ArrayList<Article>();
			
			DbConMysql db=new DbConMysql();
			//String sql="select * from t_Article where status!='����' ORDER BY click_num DESC";
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * from t_Article where status!='����' ");
		    
		    if(sname==null){
		    	sname="";
		    }
		    sql.append("and title like '%"+chStr.chStr(sname)+"%' or introduction like '%"+chStr.chStr(sname)+"%'");
			
		    //sql.append("order by manager desc ");
			
			ResultSet rs=db.getQuery(sql.toString());
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
					int comment_num=rs.getInt("comment_num");
					article.setComment_num(comment_num);
					articles.add(article);
					
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return articles;
		}
		
		
		//��ȡ������ǩ����
				public ArrayList<Article> getArticlesByLable(String sname){
				    ChStr chStr=new ChStr();
					ArrayList<Article> articles=new ArrayList<Article>();
					
					DbConMysql db=new DbConMysql();
					//String sql="select * from t_Article where status!='����' ORDER BY click_num DESC";
					
					StringBuffer sql = new StringBuffer();
					sql.append("select * from t_Article where status!='����' ");
				    
				    if(sname==null){
				    	sname="";
				    }
				    sql.append("and lable like '%"+chStr.chStr(sname)+"%' ");
					
				    //sql.append("order by manager desc ");
					
					ResultSet rs=db.getQuery(sql.toString());
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
							int comment_num=rs.getInt("comment_num");
							article.setComment_num(comment_num);
							articles.add(article);
							
						}
							
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return articles;
				}
	
	
	
	//ͨ������id��ȡ����
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
				int comment_num=rs.getInt("comment_num");
				String status=rs.getString("status");
				article.setStatus(status);
				article.setComment_num(comment_num);
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return article;
	}
	//ˢ�µ����
	public void updateArticleClicknum(Article article){
		DbConMysql db=new DbConMysql();
		String sql="UPDATE t_article SET "
				+"click_num='"+article.getClick_num()
				+"' WHERE id='"+article.getId()+"'";
		db.update(sql);
	}
	//ˢ��ϲ������
	public void updateArticleLiked(Article article){
			DbConMysql db=new DbConMysql();
			String sql="UPDATE t_article SET "
					+"liked='"+article.getLiked()
					+"' WHERE id='"+article.getId()+"'";
			db.update(sql);
		}
	//ˢ���ղ�����
	public void updateArticleCollected(Article article){
				DbConMysql db=new DbConMysql();
				String sql="UPDATE t_article SET "
						+"collected='"+article.getCollected()
						+"' WHERE id='"+article.getId()+"'";
				db.update(sql);
			}
	//ˢ����������
	public void updateArticleComment_num(Article article){
					DbConMysql db=new DbConMysql();
					String sql="UPDATE t_article SET "
							+"comment_num='"+article.getComment_num()
							+"' WHERE id='"+article.getId()+"'";
					db.update(sql);
				}
	//ͨ���û�Ψһid��ȡ�䷢����������µ�����
	public int getMyArticleNum(int author_id){
			
			int myArticleNum=0;
			DbConMysql db=new DbConMysql();
			String sql="select * from t_Article where author_id='"+String.valueOf(author_id)+"'";
			ResultSet rs=db.getQuery(sql);
			try {
				while(rs.next()){
					myArticleNum++;
					
				}
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return myArticleNum;
		}
	//ͨ������id��ȡ������һƪ���µ�id
	public int getLastArticle_id(int now_article_id,int author_id){
		int last_article_id=-1;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_article where id<'"+now_article_id+"'and author_id='"+author_id+"'order by id DESC limit 1";
		ResultSet rs=db.getQuery(sql);
		try{
			if(rs.next()){
				last_article_id=rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return last_article_id;
	}
	//ͨ������id��ȡ������һƪ���µ�id
	public int getNextArticle_id(int now_article_id,int author_id){
		int next_article_id=-1;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_article where id>'"+now_article_id+"'and author_id='"+author_id+"'limit 1";
		ResultSet rs=db.getQuery(sql);
		try{
			if(rs.next()){
				next_article_id=rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return next_article_id;
	}
	//��������״̬
	public void updateArticleStatus(Article article){
		DbConMysql db=new DbConMysql();
		String sql="update t_article set status='"+article.getStatus()+"'where id='"+article.getId()+"'";
		db.update(sql);
		
	}
	//ɾ������
	public boolean deleteArticle(Article article){
		boolean flag=false;
		DbConMysql db=new DbConMysql();
		String sql="delete from t_article where id='"+article.getId()+"'and status='����'";
		if(0!=db.delete(sql)) flag=true;
		return flag;
	}
	
	//*************************************************************
	
	
	
	
	//3.�����۱���еĲ��� *************************************************
	
	
	
	//�������
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
	//�������۵�����
	public void updateCommentZan(Comment comment){
			DbConMysql db=new DbConMysql();
			String sql="UPDATE t_comment SET "
					+"zan='"+comment.getZan()
					+"' WHERE id='"+comment.getId()+"'";
			db.update(sql);
		}
	//ͨ������id��ȡ����
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
	//ͨ������id��ȡ��������
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
					String status=rs.getString("status");
					comment.setStatus(status);
					comments.add(comment);
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		return comments;
	}
	//��������״̬
	public void updateCommentStatus(Comment comment){
		DbConMysql db=new DbConMysql();
		String sql="update t_comment set status='"+comment.getStatus()+"'where id='"+comment.getId()+"'";
		db.update(sql);
		
	}
	//ɾ������
	public boolean deleteComment(Comment comment){
		boolean flag=false;
		DbConMysql db=new DbConMysql();
		String sql="delete from t_comment where id='"+comment.getId()+"'and status='����'";
		if(0!=db.delete(sql)) flag=true;
		return flag;
	}
	
	//*************************************************************
	
	
	
	//4.�Իظ�����еĲ��� *************************************************
	
	
	
	//��ӻظ��������ۣ� 
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
	//ͨ������id��ȡ��Ӧ���۵Ļظ�
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
						String status=rs.getString("status");
						answer.setStatus(status);
						answers.add(answer);	
					}
				}catch (SQLException e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			return answers;
		}
	//ͨ���ظ�id��ȡ�ظ�
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
	//���»ظ�������
	public void updateAnswerZan(Answer answer){
			DbConMysql db=new DbConMysql();
			String sql="UPDATE t_answer SET "
					+"zan='"+answer.getZan()
					+"' WHERE id='"+answer.getId()+"'";
			db.update(sql);
		}
	//��������״̬
	public void updateAnswerStatus(Answer answer){
		DbConMysql db=new DbConMysql();
		String sql="update t_answer set status='"+answer.getStatus()+"'where id='"+answer.getId()+"'";
		db.update(sql);
		
	}
	
	//ɾ������
	public boolean deleteAnswer(Answer answer){
		boolean flag=false;
		DbConMysql db=new DbConMysql();
		String sql="delete from t_answer where id='"+answer.getId()+"'and status='����'";
		if(0!=db.delete(sql)) flag=true;
		return flag;
	}
	
	//*************************************************************
	
	
	
	//5.���ղر���еĲ��� *************************************************
	
	
	
	//����û��ղؼ�¼
	public int addCollectRecord(Collect collect){
		int flag;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_collect(user_id,article_id,collectdate,author_id)"
				+ " values ('"+collect.getUser_id()+"','"+collect.getArticle_id()+"','"+collect.getCollectdate()+"','"+collect.getAuthor_id() +"')";
		
		flag=db.insert(sql);
		
		return flag;
	}
	//ɾ���û��ղؼ�¼
	public void deleteCollectRecord(Collect collect){
		
		DbConMysql db=new DbConMysql();
		String sql="DELETE FROM t_collect where user_id='"
				+collect.getUser_id()+"' and article_id='"+collect.getArticle_id()+"'";
		
		db.delete(sql);

	}
	//ɾ���û��ղؼ�¼2
	public void deleteCollectRecord(int id){
		
		DbConMysql db=new DbConMysql();
		String sql="DELETE FROM t_collect where id='"
				+id+"'";
		
		db.delete(sql);

	}
	//ͨ���û�Ψһid��ȡ�����ղ�
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
	//ͨ���û�id������id��ȡ�ղ�
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
	//ͨ��id��ȡ�ղ�
	public Collect getCollectFromId(int collect_id){
		DbConMysql db=new DbConMysql();
		String sql="select * from t_collect where id='"+collect_id+"'";
		ResultSet rs=db.getQuery(sql);
		Collect collect=new Collect();
		try{
			if(rs.next()){
				collect.setId(collect_id);
				int article_id=rs.getInt("article_id");
				collect.setArticle_id(article_id);
				int user_id=rs.getInt("user_id");
				collect.setUser_id(user_id);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return collect;
	}
	//ͨ�����ղ��û�id��ȡ�����ղ�
	public ArrayList<Collect> getCollectFromAuthor_id(int author_id){
		DbConMysql db=new DbConMysql();
		String sql="select * from t_collect where author_id='"+author_id+"'";
		ResultSet rs=db.getQuery(sql);
		ArrayList<Collect> collects=new ArrayList<Collect>();
		try{
			while(rs.next()){
				Collect collect=new Collect();
				collect.setAuthor_id(author_id);
				int id=rs.getInt("id");
				collect.setId(id);
				int article_id=rs.getInt("article_id");
				collect.setArticle_id(article_id);
				Date collectdate=rs.getDate("collectdate");
				collect.setCollectdate(collectdate);
				int user_id=rs.getInt("user_id");
				collect.setUser_id(user_id);
				String status=rs.getString("status");
				collect.setStatus(status);
				collects.add(collect);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return collects;
	}
	//ͨ���û�id��ȡ�ղ���Ϣ
	public int getCollectNumFromAuthor_id(int author_id){
		int num=0;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_collect where author_id='"+author_id+"'and status='δ��'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				num++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}
	//�����ղ���Ϣ״̬
	public void updateCollectStatus(Collect collect){
		DbConMysql db=new DbConMysql();
		String sql="update t_collect set status='"+collect.getStatus()+"'where id='"+collect.getId()+"'";
		db.update(sql);
	}
	
	
	//*************************************************************
	
	
	
	
	//6.����Ϣ����еĲ��� *************************************************
	
	
	
	
	//���������Ϣ
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
	//ͨ���û�id��ȡ����δ����Ϣ
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
				String status=rs.getString("status");
				message.setStatus(status);
				messages.add(message);
			}
				
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return messages;
		
	}
	//ͨ����id��ȡ����δ����Ϣ��Ŀ
	public int getMessagesNumFromReceiver_id(int receiver_id){
		int n=0;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_message where receiver_id='"+receiver_id+"'and status='δ��'";
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
	//������Ϣidɾ��������Ϣ
	public void deleteMessageFromId(int message_id){
		DbConMysql db=new DbConMysql();
		String sql="delete from t_message where id='"+message_id+"'";
		db.delete(sql);
		
	}
	//������Ϣ״̬
	public void updateMessageStatus(Message message){
		DbConMysql db=new DbConMysql();
		String sql="update t_message set status='"+message.getStatus()+"'where id='"+message.getId()+"'";
		db.update(sql);
		
	}
	
	
	
	//*************************************************************	
	
	
	//7.�������� *************************************************
	
	
	
	//ͨ��������������֤��
	public void ranks(String mobile,int mobile_code){
		
			String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";

			String account = "C75701268"; //�鿴�û����ǵ�¼�û�����->��֤�����->��Ʒ����->APIID
			String password = "c6c07ee61458f5de07edb63e61a4f302";  //�鿴�������¼�û�����->��֤�����->��Ʒ����->APIKEY
			String content = new String("������֤���ǣ�" + mobile_code + "���벻Ҫ����֤��й¶�������ˡ�");

			try {

				URL url = new URL(postUrl);
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setDoOutput(true);//���������ύ��Ϣ
				connection.setRequestMethod("POST");//��ҳ�ύ��ʽ��GET������POST��
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

	
	
	//8.�Ծٱ�����в��� *************************************************
	
	
	
	//��Ӿٱ���Ϣ
	public int addReport(Report report){
		int n;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_report(username,type,content,simple_reason,all_reason,url,author_id,user_id,content_id)"
				+ " values ('" 
				+report.getUsername()+ "','" 
				+report.getType()+ "','" 
				+report.getContent()+ "','"
				+report.getSimple_reason()+ "','"
				+report.getAll_reason()+ "','"
				+report.getUrl()+"','"
				+report.getAuthor_id()+"','"
				+report.getUser_id()+"','"
				+report.getContent_id()
				+ "')" ;
		n=db.insert(sql);
		return n;
	}
	//���ݾٱ����ͷ��ؾٱ���Ϣ
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
				int author_id=rs.getInt("author_id");
				report.setAuthor_id(author_id);
				int user_id=rs.getInt("user_id");
				report.setUser_id(user_id);
				int content_id=rs.getInt("content_id");
				report.setContent_id(content_id);
				reports.add(report);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reports;
	}
	//���ݾٱ�����id���ؾٱ���Ϣ
	public ArrayList<Report> getReportFromAuthor_id(int author_id){
		DbConMysql db=new DbConMysql();
		ArrayList<Report> reports=new ArrayList<>();
		String sql="select * from t_report where author_id='"+author_id+"' order by status DESC";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				Report report=new Report();
				int id=rs.getInt("id");
				report.setId(id);
				String username=rs.getString("username");
				report.setUsername(username);
				report.setAuthor_id(author_id);
				String content=rs.getString("content");
				report.setContent(content);
				String simple_reason=rs.getString("simple_reason");
				report.setSimple_reason(simple_reason);
				String all_reason=rs.getString("all_reason");
				report.setAll_reason(all_reason);
				String url=rs.getString("url");
				report.setUrl(url);
				String type=rs.getString("type");
				report.setType(type);
				int user_id=rs.getInt("user_id");
				report.setUser_id(user_id);
				int content_id=rs.getInt("content_id");
				report.setContent_id(content_id);
				String status=rs.getString("status");
				report.setStatus(status);
				String status2=rs.getString("status2");
				report.setStatus2(status2);
				String status3=rs.getString("status3");
				report.setStatus3(status3);
				String feedback_reason=rs.getString("feedback_reason");
				report.setFeedback_reason(feedback_reason);
				reports.add(report);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reports;
	}
	//���ݾٱ�״̬���ؾٱ���Ϣ����
	public int getReportNum(){
		int num=0;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_report where status='δ����'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				num++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return num;
	}
	//�������оٱ���Ϣ
	public ArrayList<Report> getReport(){
		ArrayList<Report> reports=new ArrayList<>();
		DbConMysql db=new DbConMysql();
		String sql="select * from t_report";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				Report report=new Report();
				int id=rs.getInt("id");
				report.setId(id);
				String username=rs.getString("username");
				report.setUsername(username);
				String type=rs.getString("type");
				report.setType(type);
				String content=rs.getString("content");
				report.setContent(content);
				String simple_reason=rs.getString("simple_reason");
				report.setSimple_reason(simple_reason);
				String all_reason=rs.getString("all_reason");
				report.setAll_reason(all_reason);
				String url=rs.getString("url");
				report.setUrl(url);
				int author_id=rs.getInt("author_id");
				report.setAuthor_id(author_id);
				int user_id=rs.getInt("user_id");
				report.setUser_id(user_id);
				String status=rs.getString("status");
				report.setStatus(status);
				String status2=rs.getString("status2");
				report.setStatus2(status2);
				int content_id=rs.getInt("content_id");
				report.setContent_id(content_id);
				String status3=rs.getString("status3");
				report.setStatus3(status3);
				String feedback_reason=rs.getString("feedback_reason");
				report.setFeedback_reason(feedback_reason);
				reports.add(report);
				
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reports;
	}
	//���¾ٱ���Ϣ״̬
	public void updateReportStatus(Report report){
		DbConMysql db=new DbConMysql();
		String sql="";
		if(report.getStatus3()!=null&&report.getFeedback_reason()!=null)
			sql="update t_report set status3='"+report.getStatus3()+"',feedback_reason='"+report.getFeedback_reason()+"'where id='"+report.getId()+"'";
		else if(report.getStatus3()!=null)
			sql="update t_report set status3='"+report.getStatus3()+"'where id='"+report.getId()+"'";
		else 
			sql="update t_report set status='"+report.getStatus()+"', status2='"+report.getStatus2()+"'where id='"+report.getId()+"'";
			
		db.update(sql);
		
	}
	
	//���ݱ��ٱ���id���ؾٱ���Ϣ
	public ArrayList<Report> getReportFromUser_id(int user_id){
		DbConMysql db=new DbConMysql();
		ArrayList<Report> reports=new ArrayList<>();
		String sql="select * from t_report where user_id='"+user_id+"' order by status DESC";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				Report report=new Report();
				int id=rs.getInt("id");
				report.setId(id);
				String username=rs.getString("username");
				report.setUsername(username);
				String content=rs.getString("content");
				report.setContent(content);
				String simple_reason=rs.getString("simple_reason");
				report.setSimple_reason(simple_reason);
				String all_reason=rs.getString("all_reason");
				report.setAll_reason(all_reason);
				String url=rs.getString("url");
				report.setUrl(url);
				String type=rs.getString("type");
				report.setType(type);
				int content_id=rs.getInt("content_id");
				report.setContent_id(content_id);
				String status=rs.getString("status");
				report.setStatus(status);
				String status2=rs.getString("status2");
				report.setStatus2(status2);
				int author_id=rs.getInt("author_id");
				report.setAuthor_id(author_id);
				report.setUser_id(user_id);
				String status3=rs.getString("status3");
				report.setStatus3(status3);
				String feedback_reason=rs.getString("feedback_reason");
				report.setFeedback_reason(feedback_reason);
				reports.add(report);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return reports;
	}
	//���ݾٱ���id���ؾٱ�
	public Report getReportFromId(int report_id){
		Report report=new Report();
		DbConMysql db=new DbConMysql();
		String sql="select * from t_report where id='"+report_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			if(rs.next()){
				report.setId(report_id);
				String username=rs.getString("username");
				report.setUsername(username);
				String type=rs.getString("type");
				report.setType(type);
				String content=rs.getString("content");
				report.setContent(content);
				String simple_reason=rs.getString("simple_reason");
				report.setSimple_reason(simple_reason);
				String all_reason=rs.getString("all_reason");
				report.setAll_reason(all_reason);
				String url=rs.getString("url");
				report.setUrl(url);
				int author_id=rs.getInt("author_id");
				report.setAuthor_id(author_id);
				int user_id=rs.getInt("user_id");
				report.setUser_id(user_id);
				String status=rs.getString("status");
				report.setStatus(status);
				String status2=rs.getString("status2");
				report.setStatus2(status2);
				int content_id=rs.getInt("content_id");
				report.setContent_id(content_id);
				String status3=rs.getString("status3");
				report.setStatus3(status3);
				String feedback_reason=rs.getString("feedback_reason");
				report.setFeedback_reason(feedback_reason);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return report;
	}
	
	//���ݷ���״̬���ؾٱ���Ϣ����
		public int getReportNumFromStatus3(){
			int num=0;
			DbConMysql db=new DbConMysql();
			String sql="select * from t_report where status='�Ѵ���' and status3='�����ȴ����'";
			ResultSet rs=db.getQuery(sql);
			try{
				while(rs.next()){
					num++;
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return num;
		}
	
	//*************************************************************	

	
	//9.�Թ�ע����в���*************************************************
	
	
	
	//��ӹ�ע��¼
	public int addFollowRecord(Follow follow){
		int flag;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_follow(following_id,follower_id,followdate)"
				+ " values ('"+follow.getFollowing_id()+"','"+follow.getFollower_id()+"','"+follow.getFollow_date() +"')";
		
		flag=db.insert(sql);
		
		return flag;
	}
	//ɾ����ע��¼
	public void deleteFollowRecord(Follow follow){
		
		DbConMysql db=new DbConMysql();
		String sql="DELETE FROM t_follow where following_id='"
				+follow.getFollowing_id()+"' and follower_id='"+follow.getFollower_id()+"'";
		
		db.delete(sql);

	}
	//���ݹ�ע��id�ͱ���ע��id��ѯ��¼
	public boolean getFollowRecord(int following_id,int follower_id){
		boolean flag=false;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_follow where following_id='"+following_id+"'and follower_id='"+follower_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			if(rs.next()){
				flag=true;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
	//���ݹ�ע��id�������й�ע
	public ArrayList<Follow> getFollowFromFollowing_id(int following_id){
		ArrayList<Follow> follows=new ArrayList<>();
		DbConMysql db=new DbConMysql();
		String sql="select * from t_follow where following_id='"+following_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				Follow follow=new Follow();
				follow.setFollowing_id(following_id);
				int follower_id=rs.getInt("follower_id");
				follow.setFollower_id(follower_id);
				int id=rs.getInt("id");
				follow.setId(id);
				Date follow_date=rs.getDate("followdate");
				follow.setFollow_date(follow_date);
				follows.add(follow);		
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return follows;
		
	}
	//���ݱ���ע��id�������й�ע
	public ArrayList<Follow> getFollowFromFollower_id(int follower_id){
			ArrayList<Follow> follows=new ArrayList<>();
			DbConMysql db=new DbConMysql();
			String sql="select * from t_follow where follower_id='"+follower_id+"'";
			ResultSet rs=db.getQuery(sql);
			try{
				while(rs.next()){
					Follow follow=new Follow();
					follow.setFollower_id(follower_id);
					int following_id=rs.getInt("following_id");
					follow.setFollowing_id(following_id);
					int id=rs.getInt("id");
					follow.setId(id);
					Date follow_date=rs.getDate("followdate");
					follow.setFollow_date(follow_date);
					String status=rs.getString("status");
					follow.setStatus(status);
					follows.add(follow);		
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return follows;
			
		}
	//���ݹ�ע��id�������й�ע����
	public int getFollowNumFromFollowing_id(int following_id){
		int followNum=0;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_follow where following_id='"+following_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				followNum++;
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return followNum;
		
	}
	//���ݱ���ע��id�������й�ע����
	public int getFollowNumFromFollower_id(int follower_id){
			int followNum=0;
			DbConMysql db=new DbConMysql();
			String sql="select * from t_follow where follower_id='"+follower_id+"'";
			ResultSet rs=db.getQuery(sql);
			try{
				while(rs.next()){
					followNum++;	
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return followNum;
			
		}
	//���ݱ���ע��id����δ����Ϣ����
	public int getFollowNumFromFollower_idStatus(int follower_id){
			int followNum=0;
			DbConMysql db=new DbConMysql();
			String sql="select * from t_follow where follower_id='"+follower_id+"'and status='δ��'";
			ResultSet rs=db.getQuery(sql);
			try{
				while(rs.next()){
					followNum++;	
				}
			}catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return followNum;
			
		}
	//���¹�ע��Ϣ״̬
	public void updateFollowStatus(Follow follow){
		DbConMysql db=new DbConMysql();
		String sql="update t_follow set status ='"+follow.getStatus()+"'where id='"+follow.getId()+"'";
		db.update(sql);
		
	}
	
	
	
	//*************************************************************	

	
	
	//10.�Ե�����Ϣ����в���*************************************************
	
	//��ӵ�����Ϣ
	public int addZanMessage(Zan zan){
		int flag;
		DbConMysql db=new DbConMysql();
		String sql="insert into t_zan(type,receiver_id,sender_id,article_id,text,add_time)"
				+" values ('"+zan.getType()+"','"+zan.getReceiver_id()+"','"+zan.getSender_id()+"','"+zan.getArticle_id()
				+"','"+zan.getText()+"','"+zan.getAdd_time() +"')";
		flag=db.insert(sql);
		return flag;
	}
	//���ݱ�������id��ȡδ��������Ϣ
	public int getZanNumFromReceiver_id(int receiver_id){
		int num=0;
		DbConMysql db=new DbConMysql();
		String sql="select * from t_zan where receiver_id='"+receiver_id+"'and status='δ��'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				num++;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return num;
	}
	//���ݱ�������id��ȡ���е���
	public ArrayList<Zan> getZanFromReceiver_id(int receiver_id){
		ArrayList<Zan> zans=new ArrayList<>();
		DbConMysql db=new DbConMysql();
		String sql="select * from t_zan where receiver_id='"+receiver_id+"'";
		ResultSet rs=db.getQuery(sql);
		try{
			while(rs.next()){
				Zan zan=new Zan();
				zan.setReceiver_id(receiver_id);
				int id=rs.getInt("id");
				zan.setId(id);
				String type=rs.getString("type");
				zan.setType(type);
				int sender_id=rs.getInt("sender_id");
				zan.setSender_id(sender_id);
				int article_id=rs.getInt("article_id");
				zan.setArticle_id(article_id);
				String text=rs.getString("text");
				zan.setText(text);
				Timestamp add_time=rs.getTimestamp("add_time");
				zan.setAdd_time(add_time);
				String status=rs.getString("status");
				zan.setStatus(status);
				zans.add(zan);
			}
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return zans;
		
	}
	//���µ�����Ϣ״̬
	public void updateZanStatus(Zan zan){
		DbConMysql db=new DbConMysql();
		String sql="update t_zan set status ='"+zan.getStatus()+"'where id='"+zan.getId()+"'";
		db.update(sql);
		
	}
	
	
	
	
	
	//*************************************************************	
}

