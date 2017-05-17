package cn.edu.nju.po;

import java.io.Serializable;
import java.util.Date;

public class RecordInfo implements Serializable{
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBuyerAccount() {
		return buyerAccount;
	}
	public void setBuyerAccount(String buyerAccount) {
		this.buyerAccount = buyerAccount;
	}
	public int getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(int commodityId) {
		this.commodityId = commodityId;
	}
	public String getCoName() {
		return coName;
	}
	public void setCoName(String coName) {
		this.coName = coName;
	}
	public String getCoPic() {
		return coPic;
	}
	public void setCoPic(String coPic) {
		this.coPic = coPic;
	}
	public String getCoColor() {
		return coColor;
	}
	public void setCoColor(String coColor) {
		this.coColor = coColor;
	}
	public String getCoSize() {
		return coSize;
	}
	public void setCoSize(String coSize) {
		this.coSize = coSize;
	}
	public String getCoDes() {
		return coDes;
	}
	public void setCoDes(String coDes) {
		this.coDes = coDes;
	}
	public double getCoPrice() {
		return coPrice;
	}
	public void setCoPrice(double coPrice) {
		this.coPrice = coPrice;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSellerAccount() {
		return sellerAccount;
	}
	public void setSellerAccount(String sellerAccount) {
		this.sellerAccount = sellerAccount;
	}
	@Override
	public String toString() {
		return "RecordInfo [id=" + id + ", buyerAccount=" + buyerAccount + ", commodityId=" + commodityId + ", coName="
				+ coName + ", coPic=" + coPic + ", coColor=" + coColor + ", coSize=" + coSize + ", coDes=" + coDes
				+ ", coPrice=" + coPrice + ", date=" + date + ", sellerAccount=" + sellerAccount + "]";
	}
	private int id;
	private String buyerAccount;
	private int commodityId;
	private String coName;
	private String coPic;
	private String coColor;
	private String coSize;
	private String coDes;
	private double coPrice;
	private String date;
	// yyyy/mm/dd
	private String sellerAccount;
	public RecordInfo(UserInfo buyer,UserInfo seller,CommodityInfo co,String date){
		this.buyerAccount = buyer.getAccount();
		this.commodityId = co.getId();
		this.coName = co.getName();
		this.coPic = co.getPic();
		this.coColor = co.getColor();
		this.coSize = co.getSize();
		this.coDes = co.getDes();
		this.coPrice = co.getPrice();
		this.date=date;
		this.sellerAccount=co.getSellerAccount();
		
	}

}
