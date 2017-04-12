package cn.edu.nju.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.po.AdvertisementInfo;

@Controller
@RequestMapping("/advertisementInfo/")
public class AdvertisementInfoController {
	
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
	public String addAdvertisement(@RequestBody AdvertisementInfo ad){
		advertisementInfoMapper.addAdvertisement(ad);
		return null;
	}
	
	@RequestMapping("removeAdvertisement.do")
	public String removeAdvertisement(String adId){
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setAdvertisementId(Integer.parseInt(adId));
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
}
