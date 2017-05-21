package cn.edu.nju.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.mapper.ShopInfoMapper;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.ShopInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/shopInfo/")
public class ShopInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="shopInfoMapper")
	private ShopInfoMapper shopInfoMapper;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	@RequestMapping("addShop.do")
	public String addShop(HttpServletRequest request){
		ShopInfo shop = new ShopInfo();
		shop.setDes(request.getParameter("need"));
		shop.setName(request.getParameter("name"));
		shop.setRank("0");
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		shop.setUser_account(user.getAccount());
		shopInfoMapper.addShop(shop);
		return "Seller";
	}
	
	@RequestMapping("getShop.do")
	@ResponseBody
	public String getShop(){
		ObjectMapper mapper = new ObjectMapper();
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		ShopInfo shop = shopInfoMapper.getShopByUserAccount(user);
		try {
			return mapper.writeValueAsString(shop);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping("getIntoShop.do")
	public String getIntoShop(@RequestParam("id") int id){
		CommodityInfo com = new CommodityInfo();
		com.setId(id);
		CommodityInfo coms = commodityInfoMapper.getCommodityById(com);
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		ShopInfo shop = shopInfoMapper.getShopByUserAccount(user);
		coms.setShopId(shop.getId());
		commodityInfoMapper.updateCommodity(coms);
		return "Seller";
	}
	
	@RequestMapping("getShopContent.do")
	public String getShopContent(@RequestParam("id") int id,Model model){
		ObjectMapper mapper = new ObjectMapper();
		ShopInfo shop = new ShopInfo();
		shop.setId(id);
		List<CommodityInfo> list = commodityInfoMapper.getCommoditiesByShopId(shop);
		try {
			model.addAttribute("list",mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
		return "SearchGoods";
	}
	
	@RequestMapping("updateCommodity.do")
	public String updateCommodity(@RequestBody ShopInfo shop){
		shopInfoMapper.updateShop(shop);
		//TODO
		return null;
	}
	
	@RequestMapping("retrieveShop.do")
	public String retrieveShop(@RequestParam("input") String str,Model model){
		ObjectMapper mapper = new ObjectMapper();
		ShopInfo shop = new ShopInfo();
		shop.setDes(str);
		List<ShopInfo> list = shopInfoMapper.getShopsLike(shop);
		try {
			model.addAttribute("list",mapper.writeValueAsString(list));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
		return "SearchShop";
	}
}
