package com.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mapper.UserInfoMapper;
import com.po.UserInfo;

@Controller
@RequestMapping("/userinfo/")
public class UserInfoController {
    
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@RequestMapping("login.do")
	public String login(String username,String password,Model model){
		
		UserInfo user=new UserInfo();
		user.setUserName(username);
		user.setPwd(password);
		UserInfo u = userInfoMapper.getUserByNameAndPwd(user);
		if(u!=null)	
		{
		    
			List<UserInfo>   list = userInfoMapper.getAllUser();

			
			model.addAttribute("alluser", list);
			return "index";
		}
		else
		{
			model.addAttribute("msg", "用户名或密码错误");
			return "login";
		}
	}
}
