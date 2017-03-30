package cn.edu.nju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/advertisementInfo/")
public class AdvertisementInfoController {
	@RequestMapping("addAdvertisement.do")
	public String addCommodity(){
		//TODO
		return null;
	}
	
	@RequestMapping("removeAdvertisement.do")
	public String removeCommodity(){
		//TODO
		return null;
	}
	
	@RequestMapping("updateAdvertisement.do")
	public String updateCommodity(){
		//TODO
		return null;
	}
	
	@RequestMapping("retrieveAdvertisement.do")
	public String retrieveShop(){
		//TODO
		return null;
	}
}
