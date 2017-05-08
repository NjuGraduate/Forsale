package cn.edu.nju.po;

import java.io.Serializable;

public class AdvertisementInfo implements Serializable{
	
	private String title;
	private String id;
	private String user;
	private AdState state;

	

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "AdvertisementInfo [title=" + title + "]";
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public AdState getState() {
		return state;
	}

	public void setState(AdState state) {
		this.state = state;
	}

}
