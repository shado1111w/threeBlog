package threeblog.entity;

public class Report {
	int id;
	String url;
	String username;
	String type;
	String content;
	String simple_reason;
	String all_reason;
	int user_id;
	int author_id;
	String status;
	int content_id;
	String status2;
	String status3;
	String feedback_reason;
	
	
	public String getFeedback_reason() {
		return feedback_reason;
	}
	public void setFeedback_reason(String feedback_reason) {
		this.feedback_reason = feedback_reason;
	}
	public String getStatus3() {
		return status3;
	}
	public void setStatus3(String status3) {
		this.status3 = status3;
	}
	public String getStatus2() {
		return status2;
	}
	public void setStatus2(String status2) {
		this.status2 = status2;
	}
	public int getContent_id() {
		return content_id;
	}
	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAuthor_id() {
		return author_id;
	}
	public void setAuthor_id(int author_id) {
		this.author_id = author_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSimple_reason() {
		return simple_reason;
	}
	public void setSimple_reason(String simple_reason) {
		this.simple_reason = simple_reason;
	}
	public String getAll_reason() {
		return all_reason;
	}
	public void setAll_reason(String all_reason) {
		this.all_reason = all_reason;
	}
	
}
