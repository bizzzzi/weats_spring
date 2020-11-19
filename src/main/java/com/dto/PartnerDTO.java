package com.dto;

public class PartnerDTO {
	private String partner_id;
	private String user_id;
	private String c_name;
	private String c_postnum;
	private String c_address;
	private String c_detail_address;
	private String c_phone;
	private String partner_license_num;
	private String partner_license_docs;
	public PartnerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PartnerDTO(String partner_id, String user_id, String c_name, String c_postnum, String c_address,
			String c_detail_address, String c_phone, String partner_license_num, String partner_license_docs) {
		super();
		this.partner_id = partner_id;
		this.user_id = user_id;
		this.c_name = c_name;
		this.c_postnum = c_postnum;
		this.c_address = c_address;
		this.c_detail_address = c_detail_address;
		this.c_phone = c_phone;
		this.partner_license_num = partner_license_num;
		this.partner_license_docs = partner_license_docs;
	}
	public String getPartner_id() {
		return partner_id;
	}
	public void setPartner_id(String partner_id) {
		this.partner_id = partner_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_postnum() {
		return c_postnum;
	}
	public void setC_postnum(String c_postnum) {
		this.c_postnum = c_postnum;
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
	public String getPartner_license_num() {
		return partner_license_num;
	}
	public void setPartner_license_num(String partner_license_num) {
		this.partner_license_num = partner_license_num;
	}
	public String getPartner_license_docs() {
		return partner_license_docs;
	}
	public void setPartner_license_docs(String partner_license_docs) {
		this.partner_license_docs = partner_license_docs;
	}
	@Override
	public String toString() {
		return "PartnerDTO [partner_id=" + partner_id + ", user_id=" + user_id + ", c_name=" + c_name + ", c_postnum="
				+ c_postnum + ", c_address=" + c_address + ", c_detail_address=" + c_detail_address + ", c_phone="
				+ c_phone + ", partner_license_num=" + partner_license_num + ", partner_license_docs="
				+ partner_license_docs + "]";
	}

	
}
