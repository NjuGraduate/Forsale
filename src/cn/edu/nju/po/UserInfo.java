package cn.edu.nju.po;

import java.io.Serializable;



public class UserInfo implements Serializable{
    private String name;
    private String account;
    private String password;
    private Double balance;
    private int point;
    private int rank;
    private String des;
    private String logo;
    private String gender;
    private String phonenumber;
    private String dateofbirth;
    
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public void setDes(String des) {
		this.des = des;
	}
	
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getDes() {
		return des;
	}
	public void setDescription(String des) {
		this.des = des;
	}
	@Override
	public String toString() {
		return "UserInfo [name=" + name + ", account=" + account + ", password=" + password
				+ ", balance=" + balance + ", point=" + point + ", rank=" + rank + ", des=" + des + ", logo=" + logo
				+ ", gender=" + gender + ", phonenumber=" + phonenumber + ", dateofbirth=" + dateofbirth + "]";
	}
}