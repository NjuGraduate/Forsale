package cn.edu.nju.po;

public class CartInfo {
	private int id;
	private String buyer_account;
	private int commodity_id;
	public String getBuyer_account() {
		return buyer_account;
	}
	public void setBuyer_account(String buyer_account) {
		this.buyer_account = buyer_account;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public int getCommodity_id() {
		return commodity_id;
	}
	public void setCommodity_id(int commodity_id) {
		this.commodity_id = commodity_id;
	}
	
	@Override
	public String toString() {
		return "CartInfo [id=" + id + ", buyer_account=" + buyer_account + ", commodity_id=" + commodity_id + "]";
	}
	
}
