package com.dto;

public class LeportsReviewDTO {
	private String review_id;
	private String leports_id;
	private String reservation_id;
	private String user_id;
	private String user_name;
	private String review_comments;
	private String review_regidate;
	
	public LeportsReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public LeportsReviewDTO(String review_id, String leports_id, String reservation_id, String user_id,
			String user_name, String review_comments, String review_regidate) {
		super();
		this.review_id = review_id;
		this.leports_id = leports_id;
		this.reservation_id = reservation_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.review_comments = review_comments;
		this.review_regidate = review_regidate;
	}
	
	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public String getLeports_id() {
		return leports_id;
	}

	public void setLeports_id(String leports_id) {
		this.leports_id = leports_id;
	}

	public String getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getReview_comments() {
		return review_comments;
	}

	public void setReview_comments(String review_comments) {
		this.review_comments = review_comments;
	}

	public String getReview_regidate() {
		return review_regidate;
	}

	public void setReview_regidate(String review_regidate) {
		this.review_regidate = review_regidate;
	}

	@Override
	public String toString() {
		return "LeportsReviewDTO [review_id=" + review_id + ", leports_id=" + leports_id + ", reservation_id="
				+ reservation_id + ", user_id=" + user_id + ", user_name=" + user_name + ", review_comments="
				+ review_comments + ", review_regidate=" + review_regidate + "]";
	}

	
	
	
}
