package cn.edu.nju.po;

public class CommentInfo {
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
	public int getSeller_id() {
		return seller_id;
	}
	public void setSeller_id(int seller_id) {
		this.seller_id = seller_id;
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
		return "CommentInfo [id=" + id + ", content=" + content + ", seller_id=" + seller_id + ", buyer_id=" + buyer_id
				+ ", commodity_id=" + commodity_id + "]";
	}
	private int id;
	private String content;
	private int seller_id;
	private int buyer_id;
	private int commodity_id;
}
