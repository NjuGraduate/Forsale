package cn.edu.nju.po;

import java.io.Serializable;

public class ShopInfo implements Serializable{
	
	private String name;
	private String rank;
	private String des;
	private int user_id;
	
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
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	private int id;
	@Override
	public String toString() {
		return "ShopInfo [id=" + id + ", name=" + name + ", rank=" + rank + ", des=" + des + ", user_id=" + user_id
				+ "]";
	}
}
