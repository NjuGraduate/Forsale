package cn.edu.nju.po;

public class CartInfo {
	private int id;
	private int buyer_id;
	private int commodity_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(int buyer_id) {
		this.buyer_id = buyer_id;
	}
	public int getCommodity_id() {
		return commodity_id;
	}
	public void setCommodity_id(int commodity_id) {
		this.commodity_id = commodity_id;
	}
	
	@Override
	public String toString() {
		return "CartInfo [id=" + id + ", buyer_id=" + buyer_id + ", commodity_id=" + commodity_id + "]";
	}
	
}
