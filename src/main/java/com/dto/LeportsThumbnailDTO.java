package com.dto;

public class LeportsThumbnailDTO {
	private String leports_id;
	private String leports_title;
	private String leports_main_img;
	private String leports_loc;
	private String leports_summary;
	private int leports_price;
	
	public LeportsThumbnailDTO() {
		// TODO Auto-generated constructor stub
	}

	public LeportsThumbnailDTO(String leports_id, String leports_title, String leports_main_img, String leports_loc,
			String leports_summary, int leports_price) {
		super();
		this.leports_id = leports_id;
		this.leports_title = leports_title;
		this.leports_main_img = leports_main_img;
		this.leports_loc = leports_loc;
		this.leports_summary = leports_summary;
		this.leports_price = leports_price;
	}

	public String getLeports_id() {
		return leports_id;
	}

	public void setLeports_id(String leports_id) {
		this.leports_id = leports_id;
	}

	public String getLeports_title() {
		return leports_title;
	}

	public void setLeports_title(String leports_title) {
		this.leports_title = leports_title;
	}

	public String getLeports_main_img() {
		return leports_main_img;
	}

	public void setLeports_main_img(String leports_main_img) {
		this.leports_main_img = leports_main_img;
	}

	public String getLeports_loc() {
		return leports_loc;
	}

	public void setLeports_loc(String leports_loc) {
		this.leports_loc = leports_loc;
	}

	public String getLeports_summary() {
		return leports_summary;
	}

	public void setLeports_summary(String leports_summary) {
		this.leports_summary = leports_summary;
	}

	public int getLeports_price() {
		return leports_price;
	}

	public void setLeports_price(int leports_price) {
		this.leports_price = leports_price;
	}

	@Override
	public String toString() {
		return "LeportsThumbnailDTO [leports_id=" + leports_id + ", leports_title=" + leports_title
				+ ", leports_main_img=" + leports_main_img + ", leports_loc=" + leports_loc + ", leports_summary="
				+ leports_summary + ", leports_price=" + leports_price + "]";
	}

	
	
	

	
	
}
