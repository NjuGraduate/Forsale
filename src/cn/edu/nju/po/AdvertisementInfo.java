package cn.edu.nju.po;

import java.io.Serializable;

public class AdvertisementInfo implements Serializable{
	
	private String title;


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

}
