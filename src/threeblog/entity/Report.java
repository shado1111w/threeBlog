package threeblog.entity;

public class Report {
	int id;
	String url;
	String username;
	String type;
	String content;
	String simple_reason;
	String all_reason;
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
