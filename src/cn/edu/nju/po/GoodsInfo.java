package cn.edu.nju.po;

import java.io.Serializable;

public class GoodsInfo implements Serializable{
	
	@Override
	public String toString() {
		return "GoodsInfo [id=" + id + ", pic=" + pic + ", des=" + des + ", desiregoods=" + desiregoods
				+ ", contactInf=" + contactInf + ", user_account=" + user_account + "]";
	}
	private int id;
	private String pic;
	private String des;//描述
	private String desiregoods; //期望物品描述
	private String contactInf;//联系方式
	private String user_account;
	
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getDesiregoods() {
		return desiregoods;
	}
	public void setDesiregoods(String desiregoods) {
		this.desiregoods = desiregoods;
	}
	public String getContactInf() {
		return contactInf;
	}
	public void setContactInf(String contactInf) {
		this.contactInf = contactInf;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
}
