package cn.edu.nju.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.po.CommodityInfo;

@Controller
@RequestMapping("/commodityInfo/")
public class CommodityInfoController {
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	List<CommodityInfo> list = new ArrayList<CommodityInfo>();
	
	@RequestMapping("addCommodity.do")
	public String addCommodity(HttpServletRequest request){
		CommodityInfo com = new CommodityInfo();
		com.setDes(request.getParameter("form-goodsDesc"));
		com.setPrice(Double.valueOf(request.getParameter("form-goodsPrice")).doubleValue());
		com.setColor(request.getParameter("form-goodsColor"));
		com.setSize(request.getParameter("form-goodsSize"));
		System.out.println(com.getDes()+" "+com.getPic());
		commodityInfoMapper.addCommodity(com);
		System.out.println("---------------------");
		return "seller";
	}
	
	@RequestMapping("getCommodities.do")
	public String getCommodities(Model model){
		String str = "1";
		ObjectMapper mapper = new ObjectMapper();
		String jsonInstring;
		try {
			jsonInstring = mapper.writeValueAsString(str);
			model.addAttribute("list",jsonInstring);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("removeCommodity.do")
	public String removeCommodity(HttpServletRequest request){
		CommodityInfo com = new CommodityInfo();
		com.setId(Integer.parseInt(request.getParameter("form-id")));
		commodityInfoMapper.removeCommodity(com);
		return null;
	}
	
	@RequestMapping("updateCommodity.do")
	public String updateCommodity(HttpServletRequest request){
		String name = request.getParameter("form-name");
		String des = request.getParameter("form-des");
		double price = Double.valueOf(request.getParameter("form-price")).doubleValue();
		CommodityInfo com = new CommodityInfo();
		com.setId(Integer.parseInt(request.getParameter("form-id")));
		com.setName(name);
		com.setDes(des);
		com.setPrice(price);
		commodityInfoMapper.updateCommodity(com);
		return null;
	}
	
	@RequestMapping("retrieveCommodity.do")
	public String retrieveCommodity(String str,Model model){
		list = commodityInfoMapper.getCommoditiesByDes(str);
		model.addAttribute("list", list);
		return null;
	}
	
	@RequestMapping("evaluateCommodity.do")
	public String evaluateCommodity(HttpServletRequest request){
		//TODO
		return null;
	}
	
	@RequestMapping("buyCommodity.do")
	public String buyCommodity(@RequestBody ArrayList<CommodityInfo> list){
		//TODO
		return null;
	}
}
