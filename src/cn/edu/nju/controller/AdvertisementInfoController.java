package cn.edu.nju.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.AdState;

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
	public String addAdvertisement(@RequestBody AdvertisementInfo ad,Model model){
		AdvertisementInfo adif =advertisementInfoMapper.getAdvertisementByUser(ad);
		if(adif==null){
			ad.setState(AdState.WAIT);
			advertisementInfoMapper.addAdvertisement(ad);
			model.addAttribute("ad", ad);
		}else{
			model.addAttribute("msg", "fail");
		}
		return "adinfo";
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
}
