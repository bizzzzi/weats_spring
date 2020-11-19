package com.dto;

public class LeportsItemDTO {
	private String leports_id;
	private String leports_item_title;
	private String leports_summary;
	private String leports_price;
	private String leports_max_capacity;
	
	public LeportsItemDTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public LeportsItemDTO(String leports_id, String leports_item_title, String leports_summary, String leports_price,
			String leports_max_capacity) {
		super();
		this.leports_id = leports_id;
		this.leports_item_title = leports_item_title;
		this.leports_summary = leports_summary;
		this.leports_price = leports_price;
		this.leports_max_capacity = leports_max_capacity;
	}

	public String getLeports_id() {
		return leports_id;
	}

	public void setLeports_id(String leports_id) {
		this.leports_id = leports_id;
	}

	public String getLeports_item_title() {
		return leports_item_title;
	}

	public void setLeports_item_title(String leports_item_title) {
		this.leports_item_title = leports_item_title;
	}

	public String getLeports_summary() {
		return leports_summary;
	}

	public void setLeports_summary(String leports_summary) {
		this.leports_summary = leports_summary;
	}

	public String getLeports_price() {
		return leports_price;
	}

	public void setLeports_price(String leports_price) {
		this.leports_price = leports_price;
	}

	public String getLeports_max_capacity() {
		return leports_max_capacity;
	}

	public void setLeports_max_capacity(String leports_max_capacity) {
		this.leports_max_capacity = leports_max_capacity;
	}



	@Override
	public String toString() {
		return "LeportsItemDTO [leports_id=" + leports_id + ", leports_item_title=" + leports_item_title
				+ ", leports_summary=" + leports_summary + ", leports_price=" + leports_price
				+ ", leports_max_capacity=" + leports_max_capacity + "]";
	}
	
	
	
	
}
