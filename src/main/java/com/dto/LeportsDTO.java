package com.dto;


public class LeportsDTO {
	private String leports_id;
	private String partner_id;
	private String leports_title;
	private String leports_type;
	private String leports_loc;
	private String leports_regidate;
	private String leports_main_img;
	private String leports_sub_img1;
	private String leports_sub_img2;
	private String leports_sub_img3;
	private String leports_sub_img4;
	private String leports_content;
	
	public LeportsDTO() {
		// TODO Auto-generated constructor stub
	}

	public LeportsDTO(String leports_id, String partner_id, String leports_title, String leports_type,
			String leports_loc, String leports_regidate, String leports_main_img, String leports_sub_img1,
			String leports_sub_img2, String leports_sub_img3, String leports_sub_img4, String leports_content) {
		super();
		this.leports_id = leports_id;
		this.partner_id = partner_id;
		this.leports_title = leports_title;
		this.leports_type = leports_type;
		this.leports_loc = leports_loc;
		this.leports_regidate = leports_regidate;
		this.leports_main_img = leports_main_img;
		this.leports_sub_img1 = leports_sub_img1;
		this.leports_sub_img2 = leports_sub_img2;
		this.leports_sub_img3 = leports_sub_img3;
		this.leports_sub_img4 = leports_sub_img4;
		this.leports_content = leports_content;
	}
	
	

	public String getLeports_id() {
		return leports_id;
	}

	public void setLeports_id(String leports_id) {
		this.leports_id = leports_id;
	}

	public String getPartner_id() {
		return partner_id;
	}

	public void setPartner_id(String partner_id) {
		this.partner_id = partner_id;
	}

	public String getLeports_title() {
		return leports_title;
	}

	public void setLeports_title(String leports_title) {
		this.leports_title = leports_title;
	}

	public String getLeports_type() {
		return leports_type;
	}

	public void setLeports_type(String leports_type) {
		this.leports_type = leports_type;
	}

	public String getLeports_loc() {
		return leports_loc;
	}

	public void setLeports_loc(String leports_loc) {
		this.leports_loc = leports_loc;
	}

	public String getLeports_regidate() {
		return leports_regidate;
	}

	public void setLeports_regidate(String leports_regidate) {
		this.leports_regidate = leports_regidate;
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

	public String getLeports_content() {
		return leports_content;
	}

	public void setLeports_content(String leports_content) {
		this.leports_content = leports_content;
	}

	@Override
	public String toString() {
		return "LeportsDTO [leports_id=" + leports_id + ", partner_id=" + partner_id + ", leports_title="
				+ leports_title + ", leports_type=" + leports_type + ", leports_loc=" + leports_loc
				+ ", leports_regidate=" + leports_regidate + ", leports_main_img=" + leports_main_img
				+ ", leports_sub_img1=" + leports_sub_img1 + ", leports_sub_img2=" + leports_sub_img2
				+ ", leports_sub_img3=" + leports_sub_img3 + ", leports_sub_img4=" + leports_sub_img4
				+ ", leports_content=" + leports_content + "]";
	}
	
	
}
