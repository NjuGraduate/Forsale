package cn.edu.nju.po;

import java.io.Serializable;

public class GoodsInfo implements Serializable{
	private int id;
	private String name;
	private String des;
	private String desiredgoods; 
	private String desdg;//期望物品的描述
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
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getDesiredgoods() {
		return desiredgoods;
	}
	public void setDesiredgoods(String desiredgoods) {
		this.desiredgoods = desiredgoods;
	}
	public String getDesdg() {
		return desdg;
	}
	public void setDesdg(String desdg) {
		this.desdg = desdg;
	}
	@Override
	public String toString() {
		return "GoodsInfo [id=" + id + ", name=" + name + ", des=" + des + ", desiredgoods=" + desiredgoods + ", desdg="
				+ desdg + ", user_account=" + user_account + "]";
	}
	
}
