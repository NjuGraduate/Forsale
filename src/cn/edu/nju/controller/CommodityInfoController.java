package cn.edu.nju.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.po.CommodityInfo;

@Controller
@RequestMapping("/commodityInfo/")
public class CommodityInfoController {
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	ArrayList<CommodityInfo> list = new ArrayList<CommodityInfo>();
	
	@RequestMapping("addCommodity.do")
	public String addCommodity(CommodityInfo com){
		//TODO
		return null;
	}
	
	@RequestMapping("removeCommodity.do")
	public String removeCommodity(CommodityInfo com){
		//TODO
		return null;
	}
	
	@RequestMapping("updateCommodity.do")
	public String updateCommodity(CommodityInfo com){
		//TODO
		return null;
	}
	
	@RequestMapping("retrieveCommodity.do")
	public String retrieveCommodity(String info){
		//TODO
		return null;
	}
	
	@RequestMapping("evaluateCommodity.do")
	public String evaluateCommodity(String commodityId,String evaluation,String buyer){
		//TODO
		return null;
	}
	
	@RequestMapping("buyCommodity.do")
	public String buyCommodity(@RequestBody ArrayList<CommodityInfo> list){
		//TODO
		return null;
	}
}
