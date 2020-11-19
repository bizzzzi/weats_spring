package com.dto;

public class TradeDTO {
	private String trade_id;
	private String user_id;
	private String trade_main_img;
	private String trade_sub_img1;
	private String trade_sub_img2;
	private String trade_sub_img3;
	private String trade_sub_img4;
	private String trade_title;
	private String trade_contents;
	private String trade_type;
	private String trade_loc;
	private String trade_phone;
	private String trade_user_name;
	private int trade_price;
	private String trade_regidate;
	private int trade_hit;
	
	public TradeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TradeDTO(String trade_id, String user_id, String trade_main_img, String trade_sub_img1,
			String trade_sub_img2, String trade_sub_img3, String trade_sub_img4, String trade_title,
			String trade_contents, String trade_type, String trade_loc, String trade_phone, String trade_user_name,
			int trade_price, String trade_regidate, int trade_hit) {
		super();
		this.trade_id = trade_id;
		this.user_id = user_id;
		this.trade_main_img = trade_main_img;
		this.trade_sub_img1 = trade_sub_img1;
		this.trade_sub_img2 = trade_sub_img2;
		this.trade_sub_img3 = trade_sub_img3;
		this.trade_sub_img4 = trade_sub_img4;
		this.trade_title = trade_title;
		this.trade_contents = trade_contents;
		this.trade_type = trade_type;
		this.trade_loc = trade_loc;
		this.trade_phone = trade_phone;
		this.trade_user_name = trade_user_name;
		this.trade_price = trade_price;
		this.trade_regidate = trade_regidate;
		this.trade_hit = trade_hit;
	}

	public String getTrade_id() {
		return trade_id;
	}

	public void setTrade_id(String trade_id) {
		this.trade_id = trade_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTrade_main_img() {
		return trade_main_img;
	}

	public void setTrade_main_img(String trade_main_img) {
		this.trade_main_img = trade_main_img;
	}

	public String getTrade_sub_img1() {
		return trade_sub_img1;
	}

	public void setTrade_sub_img1(String trade_sub_img1) {
		this.trade_sub_img1 = trade_sub_img1;
	}

	public String getTrade_sub_img2() {
		return trade_sub_img2;
	}

	public void setTrade_sub_img2(String trade_sub_img2) {
		this.trade_sub_img2 = trade_sub_img2;
	}

	public String getTrade_sub_img3() {
		return trade_sub_img3;
	}

	public void setTrade_sub_img3(String trade_sub_img3) {
		this.trade_sub_img3 = trade_sub_img3;
	}

	public String getTrade_sub_img4() {
		return trade_sub_img4;
	}

	public void setTrade_sub_img4(String trade_sub_img4) {
		this.trade_sub_img4 = trade_sub_img4;
	}

	public String getTrade_title() {
		return trade_title;
	}

	public void setTrade_title(String trade_title) {
		this.trade_title = trade_title;
	}

	public String getTrade_contents() {
		return trade_contents;
	}

	public void setTrade_contents(String trade_contents) {
		this.trade_contents = trade_contents;
	}

	public String getTrade_type() {
		return trade_type;
	}

	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	public String getTrade_loc() {
		return trade_loc;
	}

	public void setTrade_loc(String trade_loc) {
		this.trade_loc = trade_loc;
	}

	public String getTrade_phone() {
		return trade_phone;
	}

	public void setTrade_phone(String trade_phone) {
		this.trade_phone = trade_phone;
	}

	public String getTrade_user_name() {
		return trade_user_name;
	}

	public void setTrade_user_name(String trade_user_name) {
		this.trade_user_name = trade_user_name;
	}

	public int getTrade_price() {
		return trade_price;
	}

	public void setTrade_price(int trade_price) {
		this.trade_price = trade_price;
	}

	public String getTrade_regidate() {
		return trade_regidate;
	}

	public void setTrade_regidate(String trade_regidate) {
		this.trade_regidate = trade_regidate;
	}

	public int getTrade_hit() {
		return trade_hit;
	}

	public void setTrade_hit(int trade_hit) {
		this.trade_hit = trade_hit;
	}

	@Override
	public String toString() {
		return "TradeDTO [trade_id=" + trade_id + ", user_id=" + user_id + ", trade_main_img=" + trade_main_img
				+ ", trade_sub_img1=" + trade_sub_img1 + ", trade_sub_img2=" + trade_sub_img2 + ", trade_sub_img3="
				+ trade_sub_img3 + ", trade_sub_img4=" + trade_sub_img4 + ", trade_title=" + trade_title
				+ ", trade_contents=" + trade_contents + ", trade_type=" + trade_type + ", trade_loc=" + trade_loc
				+ ", trade_phone=" + trade_phone + ", trade_user_name=" + trade_user_name + ", trade_price="
				+ trade_price + ", trade_hit=" + trade_hit + "]";
	}
	
	
}
