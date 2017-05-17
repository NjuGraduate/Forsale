package cn.edu.nju.po;

import java.io.Serializable;

public class AdvertisementInfo implements Serializable{
	
	private String title;
	private String id;
	private String state;
	private String user_account;
	private int commodity_id;
	private int shop_id;
	
	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getCommodity_id() {
		return commodity_id;
	}

	public void setCommodity_id(int commodity_id) {
		this.commodity_id = commodity_id;
	}

	public int getShop_id() {
		return shop_id;
	}

	public void setShop_id(int shop_id) {
		this.shop_id = shop_id;
	}
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "AdvertisementInfo [title=" + title + ", id=" + id + ", state=" + state + ", user_account="
				+ user_account + ", commodity_id=" + commodity_id + ", shop_id=" + shop_id + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
