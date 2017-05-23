package cn.edu.nju.controller;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nju.mapper.CommentInfoMapper;
import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.po.CommentInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/boardInfoController/")
public class BoardInfoController {
	@Autowired
	private HttpSession session;
	
	@Resource(name="commentInfoMapper")
	private CommentInfoMapper commentInfoMapper;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	@RequestMapping("board.do")
	public String board(String message,@RequestParam("id") int id,Model model){
		CommentInfo c = new CommentInfo();
		c.setCommodity_id(id);
		c.setContent(message);
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		c.setBuyer_account(user.getAccount());
		Calendar now = Calendar.getInstance(); 
		String time = now.get(Calendar.YEAR)+"/"+(now.get(Calendar.MONTH)+1)+"/"+now.get(Calendar.DAY_OF_MONTH);
		c.setTime(time);
		
		CommodityInfo com = new CommodityInfo();
		ObjectMapper mapper = new ObjectMapper();
		com.setId(id);
		CommodityInfo commodity = commodityInfoMapper.getCommodityById(com);
		c.setSeller_account(commodity.getSeller_account());
		commentInfoMapper.addComment(c);
		try {
			model.addAttribute("detail", mapper.writeValueAsString(commodity));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "GoodsDetail";
	}
	
	@RequestMapping("getBoard.do")
	@ResponseBody
	public String replymessage(@RequestParam("id") int id){
		System.out.println(id);
		CommodityInfo com = new CommodityInfo();
		ObjectMapper mapper = new ObjectMapper();
		com.setId(id);
		CommodityInfo commodity = commodityInfoMapper.getCommodityById(com);
		List<CommentInfo> list = commentInfoMapper.getCommentByCommodityUserAccount(commodity);
		try {
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
}
