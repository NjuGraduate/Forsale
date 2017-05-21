package cn.edu.nju.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.mapper.CartInfoMapper;
import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.mapper.RecordInfoMapper;
import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.CartInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.RecordInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/commodityInfo/")
public class CommodityInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;

	@Resource(name="recordInfoMapper")
	private RecordInfoMapper recordInfoMapper;
	
	@Resource(name="advertisementInfoMapper")
	private AdvertisementInfoMapper advertisementInfoMapper;
	
	@Resource(name="cartInfoMapper")
	private CartInfoMapper cartInfoMapper;
	
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
		
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		CommodityInfo com = new CommodityInfo();
		com.setSeller_account(user.getAccount());
		com.setDes(formGoodsDesc);
		com.setPrice(Double.valueOf(formGoodsPrice).doubleValue());
		com.setColor(formGoodsColor);
		com.setSize(formGoodsSize);
		com.setClassifiction1(formGoodsClasses);
		com.setClassifiction2(formGoodsClassesDetail);
		com.setPic(url);
		commodityInfoMapper.addCommodity(com);
		return "Seller";
	}
	
	@RequestMapping("getCommodities.do")
	@ResponseBody
	public String getCommodities(Model model){
		UserInfo info = (UserInfo)session.getAttribute("user_info");
		ObjectMapper mapper = new ObjectMapper();
		List<CommodityInfo> commodities = commodityInfoMapper.getCommodityByUserAccount(info);
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
	public String removeCommodity(@RequestParam("id") int id){
		CommodityInfo com = new CommodityInfo();
		com.setId(id);
		commodityInfoMapper.removeCommodity(com);
		CartInfo cart = new CartInfo();
		cart.setCommodity_id(id);
		List<CartInfo> clist = cartInfoMapper.getCartByCommodityId(cart);
		if(clist!=null){
			for(CartInfo c:clist){
				cartInfoMapper.removeCart(c);
			}
		}
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setCommodity_id(id);
		ad= advertisementInfoMapper.getAdvertisementByCommodityId(ad);
		if(ad!=null){
			advertisementInfoMapper.removeAdvertisement(ad);
		}
		return "Seller";
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
	public String retrieveCommodity(@RequestParam("str") String str,Model model){
		ObjectMapper mapper = new ObjectMapper();
		CommodityInfo c = new CommodityInfo();
		c.setDes(str);
		List<CommodityInfo> commodities = commodityInfoMapper.getCommoditiesLike(c);
		try {
			model.addAttribute("list",mapper.writeValueAsString(commodities));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
		return "";
	}
	
	@RequestMapping("evaluateCommodity.do")
	public String evaluateCommodity(HttpServletRequest request){
		//TODO
		return null;
	}
	
	@RequestMapping("buyCommodity.do")
	public String buyCommodity(HttpServletRequest request,Model model){
		ObjectMapper mapper = new ObjectMapper();
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		CommodityInfo com = new CommodityInfo();
		String str = request.getParameter("commodity");
		int commodityId = Integer.parseInt(str.split(",")[0].split(":")[1]);
		com.setId(commodityId);
		CommodityInfo co = commodityInfoMapper.getCommodityById(com);
		if(co!=null){
			Calendar now = Calendar.getInstance(); 
			String time = now.get(Calendar.YEAR)+"/"+(now.get(Calendar.MONTH)+1)+"/"+now.get(Calendar.DAY_OF_MONTH);
			RecordInfo rec = new RecordInfo(user,co,time);
			recordInfoMapper.addRecord(rec);
			commodityInfoMapper.removeCommodity(co);
			CartInfo cart = new CartInfo();
			cart.setCommodity_id(commodityId);
			if(cartInfoMapper.getCartByCommodityId(cart)!=null){
				cartInfoMapper.removeCart(cart);
			}
			return "Cart";
		}else{
			return "index";
		}
	}
	
	@RequestMapping("showbuyerOrder.do")
	@ResponseBody
	public String showbuyerOrder(Model model){
		ObjectMapper mapper = new ObjectMapper();
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		List<RecordInfo> list = recordInfoMapper.getRecordByBuyerAccount(user);
		try {
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	@RequestMapping("showSellerOrder.do")
	@ResponseBody
	public String showSellerOrder(Model model){
		ObjectMapper mapper = new ObjectMapper();
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		List<RecordInfo> list = recordInfoMapper.getRecordBySellerAccount(user);
		try {
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	@RequestMapping("collectCommodity.do")
	public String collectCommodity(HttpServletRequest request){
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		CartInfo cart = new CartInfo();
		cart.setBuyer_account(user.getAccount());
		String str = request.getParameter("commodity");
		cart.setCommodity_id(Integer.parseInt(str.split(",")[0].split(":")[1]));
		cartInfoMapper.addCart(cart);
		return "Cart";
	}
	
	@RequestMapping("removeCollectCommodity.do")
	public String removeCollectCommodity(HttpServletRequest request){
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		CartInfo cart = new CartInfo();
		cart.setBuyer_account(user.getAccount());
		String str = request.getParameter("commodity");
		cart.setCommodity_id(Integer.parseInt(str.split(",")[0].split(":")[1]));
		cartInfoMapper.addCart(cart);
		return "index";
	}
	
	@RequestMapping("showCollectCommodity.do")
	@ResponseBody
	public String showCollectCommodity(){
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		ObjectMapper mapper = new ObjectMapper();
		List<CartInfo> listcart = cartInfoMapper.getCartByUserAccount(user);
		List<CommodityInfo> list = new ArrayList<>();
		for(CartInfo c:listcart){
			CommodityInfo co = new CommodityInfo();
			co.setId(c.getCommodity_id());
			list.add(commodityInfoMapper.getCommodityById(co));
		}
		try {
			System.out.println(mapper.writeValueAsString(list));
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
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
