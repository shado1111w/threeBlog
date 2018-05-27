package threeblog.entity;

import java.sql.Date;

public class Collect {
	private int id;
	private int user_id;
	private int article_id;
	private Date collectdate;
	public Date getCollectdate() {
		return collectdate;
	}
	public void setCollectdate(Date collectdate) {
		this.collectdate = collectdate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	
}
