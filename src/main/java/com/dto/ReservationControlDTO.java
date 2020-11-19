package com.dto;

public class ReservationControlDTO {

	private String leports_id;
	private String partner_id;	
	private String leports_title;
	private String leports_main_img;
	private String rs_name;
	private String rs_phone;
	private String rs_persons;
	private String rs_date;
	private String rs_price;
	public ReservationControlDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationControlDTO(String leports_id, String partner_id, String leports_title, String leports_main_img,
			String rs_name, String rs_phone, String rs_persons, String rs_date, String rs_price) {
		super();
		this.leports_id = leports_id;
		this.partner_id = partner_id;
		this.leports_title = leports_title;
		this.leports_main_img = leports_main_img;
		this.rs_name = rs_name;
		this.rs_phone = rs_phone;
		this.rs_persons = rs_persons;
		this.rs_date = rs_date;
		this.rs_price = rs_price;
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
	public String getLeports_main_img() {
		return leports_main_img;
	}
	public void setLeports_main_img(String leports_main_img) {
		this.leports_main_img = leports_main_img;
	}
	public String getRs_name() {
		return rs_name;
	}
	public void setRs_name(String rs_name) {
		this.rs_name = rs_name;
	}
	public String getRs_phone() {
		return rs_phone;
	}
	public void setRs_phone(String rs_phone) {
		this.rs_phone = rs_phone;
	}
	public String getRs_persons() {
		return rs_persons;
	}
	public void setRs_persons(String rs_persons) {
		this.rs_persons = rs_persons;
	}
	public String getRs_date() {
		return rs_date;
	}
	public void setRs_date(String rs_date) {
		this.rs_date = rs_date;
	}
	public String getRs_price() {
		return rs_price;
	}
	public void setRs_price(String rs_price) {
		this.rs_price = rs_price;
	}
	@Override
	public String toString() {
		return "ReservationControlDTO [leports_id=" + leports_id + ", partner_id=" + partner_id + ", leports_title="
				+ leports_title + ", leports_main_img=" + leports_main_img + ", rs_name=" + rs_name + ", rs_phone="
				+ rs_phone + ", rs_persons=" + rs_persons + ", rs_date=" + rs_date + ", rs_price=" + rs_price + "]";
	}
	
	
}
