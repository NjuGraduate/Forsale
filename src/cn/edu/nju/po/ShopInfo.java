package cn.edu.nju.po;

import java.io.Serializable;

public class ShopInfo implements Serializable{
	
	private String name;
	private String rank;
	private String des;
	private String user_account;
	
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
	private int id;
	@Override
	public String toString() {
		return "ShopInfo [name=" + name + ", rank=" + rank + ", des=" + des + ", user_account=" + user_account + ", id="
				+ id + "]";
	}
}
