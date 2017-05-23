package cn.edu.nju.po;

public class CommentInfo {
	@Override
	public String toString() {
		return "CommentInfo [id=" + id + ", content=" + content + ", seller_account=" + seller_account
				+ ", buyer_account=" + buyer_account + ", commodity_id=" + commodity_id + ", time=" + time + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCommodity_id() {
		return commodity_id;
	}
	public void setCommodity_id(int commodity_id) {
		this.commodity_id = commodity_id;
	}
	
	public String getSeller_account() {
		return seller_account;
	}
	public void setSeller_account(String seller_account) {
		this.seller_account = seller_account;
	}
	public String getBuyer_account() {
		return buyer_account;
	}
	public void setBuyer_account(String buyer_account) {
		this.buyer_account = buyer_account;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	private int id;
	private String content;
	private String seller_account;
	private String buyer_account;
	private int commodity_id;
	private String time;
}
