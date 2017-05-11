package cn.edu.nju.po;

import java.io.Serializable;

public class CommodityInfo implements Serializable{
	private int id;
	private String name; 
	private double price;
	private String des;
	private String pic;
	private int shopId;
	private int sellerId;
	private int state;
	private String color;
	private String size;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}	
	@Override
	public String toString() {
		return "CommodityInfo [id=" + id + ", name=" + name + ", price=" + price + ", des=" + des + ", pic=" + pic
				+ ", shopId=" + shopId + ", sellerId=" + sellerId + ", state=" + state + ", color=" + color + ", size="
				+ size + "]";
	}
}
