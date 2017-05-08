package cn.edu.nju.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.mapper.UserInfoMapper;
import cn.edu.nju.po.AdState;
import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/managerActionInfo/")
public class ManagerActionInfoController {
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@Resource(name="advertisementInfoMapper")
	private AdvertisementInfoMapper advertisementInfoMapper;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	@RequestMapping("updateShop.do")
	public String update(String username,String password,Model model){
		//TODO
		return null;
	}
	
	@RequestMapping("updateCommodity.do")
	public String updateCommodity(String username,String password,Model model){
		//TODO
		return null;
	}
	
	@RequestMapping("updateUser.do")
	public String updateUser(String username,String password,Model model){
		//TODO
		return null;
	}
	
	@RequestMapping("banUser.do")
	public String banUser(String account){
		UserInfo user = new UserInfo();
		user.setAccount(account);
		userInfoMapper.removeUser(user);
		return "banUser";
	}
	
	@RequestMapping("removeCommodity.do")
	public String removeCommodity(String id){
		CommodityInfo com = new CommodityInfo();
		com.setId(id);
		commodityInfoMapper.removeCommodity(com);
		return "removeCommodity";
	}
	
	@RequestMapping("reviewAd.do")
	public String reviewAd(@RequestBody AdvertisementInfo ad,Boolean option,Model model){
		if(option==true){
			ad.setState(AdState.PASS);
			advertisementInfoMapper.addAdvertisement(ad);
			model.addAttribute("ad", ad);
		}else{
			ad.setState(AdState.FAIL);
			model.addAttribute("msg", "fail");
		}
		return "adManage";
	}
}
