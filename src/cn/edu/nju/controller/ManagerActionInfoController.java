package cn.edu.nju.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.UserInfoMapper;

@Controller
@RequestMapping("/managerActionInfo/")
public class ManagerActionInfoController {
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
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
	
	@RequestMapping("removeUser.do")
	public String removeUser(String username){
		//TODO
		return null;
	}
}
