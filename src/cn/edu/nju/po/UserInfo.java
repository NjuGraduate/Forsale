package cn.edu.nju.po;

import java.io.Serializable;



public class UserInfo implements Serializable{
    private String name;
    
	private String account;
    private String password;
    private Double balance;
    private int rank;
    private String des;
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
		return "UserInfo [name=" + name + ", account=" + account
				+ ", password=" + password + ", balance=" + balance + ", rank="
				+ rank + ", des="
				+ des + "]";
	}
}