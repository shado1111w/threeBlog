package threeblog.entity;

import java.sql.Date;

public class Follow {
	private int id;
	private int following_id;
	private int follower_id;
	private Date follow_date;
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getFollow_date() {
		return follow_date;
	}
	public void setFollow_date(Date follow_date) {
		this.follow_date = follow_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getFollowing_id() {
		return following_id;
	}
	public void setFollowing_id(int following_id) {
		this.following_id = following_id;
	}
	public int getFollower_id() {
		return follower_id;
	}
	public void setFollower_id(int follower_id) {
		this.follower_id = follower_id;
	}
	
}
