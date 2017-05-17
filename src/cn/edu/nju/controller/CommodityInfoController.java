package cn.edu.nju.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/commodityInfo/")
public class CommodityInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	@RequestMapping("addCommodity.do")
	public String addCommodity(@RequestParam(value="formGoodsLogoPic",required=false) MultipartFile formGoodsLogoPic,String formGoodsDesc,
			String formGoodsPrice,String formGoodsColor,String formGoodsSize,String formGoodsClasses,
			String formGoodsClassesDetail,HttpServletRequest request,Model model){
		String path= request.getSession().getServletContext().getRealPath("/upload/commodity");
		String fileName=formGoodsLogoPic.getOriginalFilename();
		String extfileName = fileName.substring(Math.max(fileName.lastIndexOf("."), 0));
		String systime=System.currentTimeMillis()+"";
		Random r=new Random();
		int rnum=r.nextInt(10000);
		systime+=rnum;
		systime+=extfileName;
		
		File targetFile=new File(path,systime);
		try {
			formGoodsLogoPic.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url=request.getContextPath()+"/upload/commodity/"+systime;
		
		String u = (String)session.getAttribute("user");
		CommodityInfo com = new CommodityInfo();
		com.setSellerId(Integer.parseInt(u.split(":")[1].split(",")[0]));
		com.setDes(formGoodsDesc);
		com.setPrice(Double.valueOf(formGoodsPrice).doubleValue());
		com.setColor(formGoodsColor);
		com.setSize(formGoodsSize);
		com.setClassifiction1(formGoodsClasses);
		com.setClassifiction2(formGoodsClassesDetail);
		com.setPic(url);
		com.setState("0");
		commodityInfoMapper.addCommodity(com);
		return "Seller";
	}
	
	@RequestMapping("getCommodities.do")
	@ResponseBody
	public String getCommodities(Model model){
		UserInfo info = (UserInfo)session.getAttribute("user_info");
		ObjectMapper mapper = new ObjectMapper();
		List<CommodityInfo> commodities = commodityInfoMapper.getCommodityByUserId(info);
		try {
			return mapper.writeValueAsString(commodities);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	@RequestMapping("getAllCommodities.do")
	@ResponseBody
	public String getAllCommodities(Model model){
		ObjectMapper mapper = new ObjectMapper();
		List<CommodityInfo> commodities = commodityInfoMapper.getCommodities();
		try {
			return mapper.writeValueAsString(commodities);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
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
		return null;
	}
	
	@RequestMapping("evaluateCommodity.do")
	public String evaluateCommodity(HttpServletRequest request){
		//TODO
		return null;
	}
	
	@RequestMapping("buyCommodity.do")
	public String buyCommodity(HttpServletRequest request,Model model){
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		CommodityInfo com = new CommodityInfo();
		com.setId(Integer.parseInt(request.getParameter("id")));
		CommodityInfo co = commodityInfoMapper.getCommodityById(com);
		if(co.getState()=="0"){
			co.setState("1");
			commodityInfoMapper.addOrder(co,user);
		}
		return "";
	}
	
	@RequestMapping("showOrder.do")
	public String showOrder(Model model){
		ObjectMapper mapper = new ObjectMapper();
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		List<CommodityInfo> list = commodityInfoMapper.getCommodityByUserId(user);
		try {
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	@RequestMapping("collectCommodity.do")
	public String collectCommodity(HttpServletRequest request,Model model){
		//TODO
		return "";
	}
	
	@RequestMapping("goodsDetail.do")
	public String goodsDetail(@RequestParam("id") int id, Model model) {
		CommodityInfo com = new CommodityInfo();
		ObjectMapper mapper = new ObjectMapper();
		com.setId(id);
		CommodityInfo commodity = commodityInfoMapper.getCommodityById(com);
		try {
			model.addAttribute("detail", mapper.writeValueAsString(commodity));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "GoodsDetail";
	}
}
