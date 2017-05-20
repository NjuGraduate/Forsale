package cn.edu.nju.controller;

import java.io.File;
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

import cn.edu.nju.mapper.GoodsInfoMapper;
import cn.edu.nju.po.GoodsInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/postInfo/")
public class PostInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="goodsInfoMapper")
	private GoodsInfoMapper goodsInfoMapper;
	
	@RequestMapping("post.do")
	public String post(@RequestParam(value="formGoodsLogoPic",required=false) MultipartFile exchangePic,String exchangeDesc,String needDesc,String connect,HttpServletRequest request,Model model){
		String path= request.getSession().getServletContext().getRealPath("/upload/post");
		String fileName=exchangePic.getOriginalFilename();
		String extfileName = fileName.substring(Math.max(fileName.lastIndexOf("."), 0));
		String systime=System.currentTimeMillis()+"";
		Random r=new Random();
		int rnum=r.nextInt(10000);
		systime+=rnum;
		systime+=extfileName;
		
		File targetFile=new File(path,systime);
		try {
			exchangePic.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url=request.getContextPath()+"/upload/post/"+systime;
		UserInfo user = (UserInfo)session.getAttribute("user_info");
		GoodsInfo goods = new GoodsInfo();
		goods.setUser_account(user.getAccount());
		goods.setContactInf(connect);
		goods.setDes(exchangeDesc);
		goods.setDesiregoods(needDesc);
		goods.setPic(url);
		goodsInfoMapper.addGoods(goods);
		return "exchangeReq";
	}
	@RequestMapping("getPost.do")
	@ResponseBody
	public String post(Model model){
		ObjectMapper mapper = new ObjectMapper();
		List<GoodsInfo> list = goodsInfoMapper.getGoods();
		try {
			return mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	
	@RequestMapping("remove.do")
	public String remove(String info){
		//TODO
		return null;
	}
	
	@RequestMapping("retrieve.do")
	public String retrieve(){
		//TODO
		return null;
	}
}
