package cn.edu.nju.controller;

import java.util.ArrayList;
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

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;


@Controller
@RequestMapping("/advertisementInfo/")
public class AdvertisementInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="advertisementInfoMapper")
	private AdvertisementInfoMapper advertisementInfoMapper;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	
	@RequestMapping("showAdvertisement.do")
	public String showAdvertisement(Model model){
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		List<AdvertisementInfo> list = advertisementInfoMapper.getAdvertisementByUserAccount(user);
		model.addAttribute("allads", list);
		return "";
	}
	
	@RequestMapping("addAdvertisement.do")
	public String addAdvertisement(@RequestParam("id") int id,Model model){
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		AdvertisementInfo adif = new AdvertisementInfo();
		adif.setCommodity_id(id);
		adif.setUser_account(user.getAccount());
		adif.setState("wait");
		String msg = "";
		if(advertisementInfoMapper.getAdvertisementByCommodityId(adif)==null){
			advertisementInfoMapper.addAdvertisement(adif);
			msg="success";
		}else{
			msg="fail";
		}
		try {
			ObjectMapper mapper = new ObjectMapper();
			model.addAttribute("msg",mapper.writeValueAsString(msg));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	

	
	
	@RequestMapping("getAllAds.do")
	@ResponseBody
	public String getAllAds(){
		ObjectMapper mapper = new ObjectMapper();
		List<AdvertisementInfo> ads = advertisementInfoMapper.getAdvertisements();
		List<CommodityInfo> colist = new ArrayList<>();
		for(AdvertisementInfo ad:ads){
			System.out.println(ad.getId()+ad.getState()+"                                                    1");
			if(ad.getState().equals("success")){
				System.out.println(ad.getId()+ad.getState()+"                                                    2");
				CommodityInfo co = new CommodityInfo();
				co.setId(ad.getCommodity_id());
				colist.add(commodityInfoMapper.getCommodityById(co));
			}
		}
		try {
			return mapper.writeValueAsString(colist);
			
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping("manageAds.do")
	@ResponseBody
	public String manageAds(){
		ObjectMapper mapper = new ObjectMapper();
		List<AdvertisementInfo> ads = advertisementInfoMapper.getAdvertisements();
		List<CommodityInfo> colist = new ArrayList<>();
		for(AdvertisementInfo ad:ads){
			if(ad.getState().equals("wait")){
				CommodityInfo co = new CommodityInfo();
				co.setId(ad.getCommodity_id());
				colist.add(commodityInfoMapper.getCommodityById(co));
			}
		}
		try {
			return mapper.writeValueAsString(colist);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "";
	}
}
