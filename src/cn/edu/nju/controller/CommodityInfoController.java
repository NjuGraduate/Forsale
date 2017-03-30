package cn.edu.nju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commodityInfo/")
public class CommodityInfoController {
	
	@RequestMapping("addCommodity.do")
	public String addCommodity(){
		//TODO
		return null;
	}
	
	@RequestMapping("removeCommodity.do")
	public String removeCommodity(){
		//TODO
		return null;
	}
	
	@RequestMapping("updateCommodity.do")
	public String updateCommodity(){
		//TODO
		return null;
	}
	
	@RequestMapping("retrieveCommodity.do")
	public String retrieveCommodity(){
		//TODO
		return null;
	}
}
