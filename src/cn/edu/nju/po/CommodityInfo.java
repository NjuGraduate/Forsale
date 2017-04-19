package cn.edu.nju.po;

import java.io.Serializable;

public class CommodityInfo implements Serializable{
	private String name; 
	private double price;
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
	@Override
	public String toString() {
		return "CommodityInfo [name=" + name + ", price=" + price + "]";
	}
	
	
}
