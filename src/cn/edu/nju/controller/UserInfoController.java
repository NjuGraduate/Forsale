package cn.edu.nju.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.UserInfoMapper;
import cn.edu.nju.po.UserInfo;


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
			model.addAttribute("user", user);
			return "index";
		}
		else
		{
			model.addAttribute("msg", "�û������������");
			return "login";
		}
	}
	
	@RequestMapping("register.do")
	public String register(String username,String password,Model model){
		
		UserInfo user=new UserInfo();
		user.setUserName(username);
		user.setPwd(password);
		UserInfo u = userInfoMapper.getUserByNameAndPwd(user);
		if(u!=null)	
			//already exist
		{
			return "register";
		}
		else
			//register success
		{
			return "index";
		}
	}
	
	@RequestMapping("update.do")
	public String update(String username,String password,Model model){
		
		UserInfo user=new UserInfo();
		user.setUserName(username);
		user.setPwd(password);
		return null;
	}
}
