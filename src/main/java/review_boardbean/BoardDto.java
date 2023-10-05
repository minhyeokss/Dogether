package review_boardbean;

import java.sql.Date;

public class BoardDto {
	private int post_id;
	private int post_board_id;
	private String post_user_id;
	private String post_nickname;
	private String post_title;
	private String post_content;
	private Date post_create_date;
	private Date post_update_date;
	private int post_views;
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public int getPost_board_id() {
		return post_board_id;
	}
	public void setPost_board_id(int post_board_id) {
		this.post_board_id = post_board_id;
	}
	public String getPost_user_id() {
		return post_user_id;
	}
	public void setPost_user_id(String post_user_id) {
		this.post_user_id = post_user_id;
	}
	public String getPost_nickname() {
		return post_nickname;
	}
	public void setPost_nickname(String post_nickname) {
		this.post_nickname = post_nickname;
	}
	public String getPost_title() {
		return post_title;
	}
	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}
	public String getPost_content() {
		return post_content;
	}
	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}
	public Date getPost_create_date() {
		return post_create_date;
	}
	public void setPost_create_date(Date post_create_date) {
		this.post_create_date = post_create_date;
	}
	public Date getPost_update_date() {
		return post_update_date;
	}
	public void setPost_update_date(Date post_update_date) {
		this.post_update_date = post_update_date;
	}
	public int getPost_views() {
		return post_views;
	}
	public void setPost_views(int post_views) {
		this.post_views = post_views;
	}
	
	

}