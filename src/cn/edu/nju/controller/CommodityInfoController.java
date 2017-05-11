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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.po.CommodityInfo;

@Controller
@RequestMapping("/commodityInfo/")
public class CommodityInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	List<CommodityInfo> list = new ArrayList<CommodityInfo>();
	
	@RequestMapping("addCommodity.do")
	public String addCommodity(@RequestParam(value="formGoodsLogoPic",required=false) MultipartFile formGoodsLogoPic,String formGoodsDesc,
			String formGoodsPrice,String formGoodsColor,String formGoodsSize,String formGoodsClasses,
			String formGoodsClassesDetail,HttpServletRequest request,Model model){
		String path= request.getSession().getServletContext().getRealPath("/upload/commodity");
		String fileName=formGoodsLogoPic.getOriginalFilename();
		String extfileName = fileName.substring(fileName.indexOf("."));
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
		return "1";
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
