package com.dto;

public class LeportsDetailDTO {
	private String leports_title;
	private String leports_main_img;
	private String leports_sub_img1;
	private String leports_sub_img2;
	private String leports_sub_img3;
	private String leports_sub_img4;
	private String leports_regidate;
	private String leports_item_title;
	private String leports_summary;
	private String leports_price;
	private String leports_max_capacity;
	private String c_address;
	private String c_detail_address;
	private String c_phone;
	private String leports_content;
	
	public LeportsDetailDTO() {
		// TODO Auto-generated constructor stub
	}

	public LeportsDetailDTO(String leports_title, String leports_main_img, String leports_sub_img1,
			String leports_sub_img2, String leports_sub_img3, String leports_sub_img4, String leports_regidate,
			String leports_item_title, String leports_summary, String leports_price, String leports_max_capacity,
			String c_address, String c_detail_address, String c_phone, String leports_content) {
		super();
		this.leports_title = leports_title;
		this.leports_main_img = leports_main_img;
		this.leports_sub_img1 = leports_sub_img1;
		this.leports_sub_img2 = leports_sub_img2;
		this.leports_sub_img3 = leports_sub_img3;
		this.leports_sub_img4 = leports_sub_img4;
		this.leports_regidate = leports_regidate;
		this.leports_item_title = leports_item_title;
		this.leports_summary = leports_summary;
		this.leports_price = leports_price;
		this.leports_max_capacity = leports_max_capacity;
		this.c_address = c_address;
		this.c_detail_address = c_detail_address;
		this.c_phone = c_phone;
		this.leports_content = leports_content;
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

	public String getLeports_sub_img1() {
		return leports_sub_img1;
	}

	public void setLeports_sub_img1(String leports_sub_img1) {
		this.leports_sub_img1 = leports_sub_img1;
	}

	public String getLeports_sub_img2() {
		return leports_sub_img2;
	}

	public void setLeports_sub_img2(String leports_sub_img2) {
		this.leports_sub_img2 = leports_sub_img2;
	}

	public String getLeports_sub_img3() {
		return leports_sub_img3;
	}

	public void setLeports_sub_img3(String leports_sub_img3) {
		this.leports_sub_img3 = leports_sub_img3;
	}

	public String getLeports_sub_img4() {
		return leports_sub_img4;
	}

	public void setLeports_sub_img4(String leports_sub_img4) {
		this.leports_sub_img4 = leports_sub_img4;
	}

	public String getLeports_regidate() {
		return leports_regidate;
	}

	public void setLeports_regidate(String leports_regidate) {
		this.leports_regidate = leports_regidate;
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

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_detail_address() {
		return c_detail_address;
	}

	public void setC_detail_address(String c_detail_address) {
		this.c_detail_address = c_detail_address;
	}

	public String getC_phone() {
		return c_phone;
	}

	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}

	public String getLeports_content() {
		return leports_content;
	}

	public void setLeports_content(String leports_content) {
		this.leports_content = leports_content;
	}

	@Override
	public String toString() {
		return "LeportsDetailDTO [leports_title=" + leports_title + ", leports_main_img=" + leports_main_img
				+ ", leports_sub_img1=" + leports_sub_img1 + ", leports_sub_img2=" + leports_sub_img2
				+ ", leports_sub_img3=" + leports_sub_img3 + ", leports_sub_img4=" + leports_sub_img4
				+ ", leports_regidate=" + leports_regidate + ", leports_item_title=" + leports_item_title
				+ ", leports_summary=" + leports_summary + ", leports_price=" + leports_price
				+ ", leports_max_capacity=" + leports_max_capacity + ", c_address=" + c_address + ", c_detail_address="
				+ c_detail_address + ", c_phone=" + c_phone + ", leports_content=" + leports_content + "]";
	}
	
}	
