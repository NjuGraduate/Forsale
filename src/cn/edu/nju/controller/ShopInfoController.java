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

import cn.edu.nju.mapper.ShopInfoMapper;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.ShopInfo;

@Controller
@RequestMapping("/shopInfo/")
public class ShopInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="shopInfoMapper")
	private ShopInfoMapper shopInfoMapper;
	
	@RequestMapping("addShop.do")
	public String addShop(HttpServletRequest request){
		ShopInfo shop = new ShopInfo();
		String u = (String)session.getAttribute("user");
		shop.setUser_id(Integer.parseInt(u.split(":")[1].split(",")[0]));
		shop.setDes(request.getParameter("need"));
		shop.setName(request.getParameter("name"));
		shop.setRank("0");
		shopInfoMapper.addShop(shop);
		return "Seller";
	}
	
	@RequestMapping("updateCommodity.do")
	public String updateCommodity(@RequestBody ShopInfo shop){
		shopInfoMapper.updateShop(shop);
		//TODO
		return null;
	}
	
	@RequestMapping("retrieveShop.do")
	public String retrieveShop(@RequestBody ShopInfo shop,Model model){
		List<ShopInfo> list = shopInfoMapper.getShopsLike(shop);
		model.addAttribute("shops", list);
		//TODO
		return null;
	}
}
