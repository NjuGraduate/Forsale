package cn.edu.nju.po;

import java.io.Serializable;
import java.util.Date;

public class RecordInfo implements Serializable{
	
	private int id;
	private int buyerId;
	private int commodityId;
	private String date;
	private int sellerId;

	public RecordInfo(CommodityInfo co,UserInfo user,Date date){
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(int buyerId) {
		this.buyerId = buyerId;
	}
	public int getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "RecordInfo [id=" + id + ", buyerId=" + buyerId + ", commodityId=" + commodityId + ", date=" + date
				+ "]";
	}
}
