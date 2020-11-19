package com.dto;

public class ReservationDTO {
	
	String reservation_id;
	String user_id;
	String leports_id;
	String rs_name;
	String rs_phone;
	String rs_persons;
	String rs_paymethod;
	String rs_date;
	String rs_payment_date;
	String rs_price;
	public ReservationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReservationDTO(String reservation_id, String user_id, String leports_id, String rs_name, String rs_phone,
			String rs_persons, String rs_paymethod, String rs_date, String rs_payment_date, String rs_price) {
		super();
		this.reservation_id = reservation_id;
		this.user_id = user_id;
		this.leports_id = leports_id;
		this.rs_name = rs_name;
		this.rs_phone = rs_phone;
		this.rs_persons = rs_persons;
		this.rs_paymethod = rs_paymethod;
		this.rs_date = rs_date;
		this.rs_payment_date = rs_payment_date;
		this.rs_price = rs_price;
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
	public String getLeports_id() {
		return leports_id;
	}
	public void setLeports_id(String leports_id) {
		this.leports_id = leports_id;
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
	public String getRs_paymethod() {
		return rs_paymethod;
	}
	public void setRs_paymethod(String rs_paymethod) {
		this.rs_paymethod = rs_paymethod;
	}
	public String getRs_date() {
		return rs_date;
	}
	public void setRs_date(String rs_date) {
		this.rs_date = rs_date;
	}
	public String getRs_payment_date() {
		return rs_payment_date;
	}
	public void setRs_payment_date(String rs_payment_date) {
		this.rs_payment_date = rs_payment_date;
	}
	public String getRs_price() {
		return rs_price;
	}
	public void setRs_price(String rs_price) {
		this.rs_price = rs_price;
	}
	@Override
	public String toString() {
		return "ReservationDTO [reservation_id=" + reservation_id + ", user_id=" + user_id + ", leports_id="
				+ leports_id + ", rs_name=" + rs_name + ", rs_phone=" + rs_phone + ", rs_persons=" + rs_persons
				+ ", rs_paymethod=" + rs_paymethod + ", rs_date=" + rs_date + ", rs_payment_date=" + rs_payment_date
				+ ", rs_price=" + rs_price + "]";
	}
	
	
}
