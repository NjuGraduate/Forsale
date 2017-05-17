package cn.edu.nju.controller;

import java.util.List;

import javax.annotation.Resource;
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

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.UserInfo;


@Controller
@RequestMapping("/advertisementInfo/")
public class AdvertisementInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="advertisementInfoMapper")
	private AdvertisementInfoMapper advertisementInfoMapper;
	
	@RequestMapping("showAdvertisement.do")
	public String showAdvertisement(Model model){
		List<AdvertisementInfo> list = advertisementInfoMapper.getAdvertisements();
		model.addAttribute("allads", list);
		//TODO
		return null;
	}
	
	@RequestMapping("addAdvertisement.do")
	public String addAdvertisement(@RequestParam("id") int id,Model model){
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		AdvertisementInfo adif = new AdvertisementInfo();
		adif.setCommodity_id(id);
		adif.setUser_account(user.getAccount());
		String msg = "";
		if(advertisementInfoMapper.getAdvertisementByCommodityId(adif)==null){
			advertisementInfoMapper.addAdvertisement(adif);
			msg="success post";
		}else{
			msg="fail post";
		}
		try {
			ObjectMapper mapper = new ObjectMapper();
			model.addAttribute("msg",msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("removeAdvertisement.do")
	public String removeAdvertisement(String title){
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setTitle(title);;
		advertisementInfoMapper.removeAdvertisement(ad);
		return null;
	}
	
	@RequestMapping("updateAdvertisement.do")
	public String updateAdvertisement(@RequestBody AdvertisementInfo ad){
		advertisementInfoMapper.updateAdvertisement(ad);
		//TODO
		return null;
	}
	
	@RequestMapping("retrieveAdvertisement.do")
	public String retrieveAdvertisement(String str){
		advertisementInfoMapper.getAdvertisementsLike(str);
		//TODO
		return null;
	}
	
	@RequestMapping("getAllAds.do")
	@ResponseBody
	public String getAllAds(Model model){
		ObjectMapper mapper = new ObjectMapper();
		List<AdvertisementInfo> ads = advertisementInfoMapper.getAdvertisements();
		try {
			return mapper.writeValueAsString(ads);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
}
