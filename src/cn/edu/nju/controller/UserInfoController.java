package cn.edu.nju.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
			model.addAttribute("user", u);
			return "index";
		}
		else
		{
			model.addAttribute("msg", "用户名或密码错误");
			return "login";
		}
	}
	
	@RequestMapping("register.do")
	public String register(@RequestBody UserInfo info,Model model){
		UserInfo u = userInfoMapper.getUserByNameAndPwd(info);
		if(u!=null)	
		{
			model.addAttribute("msg", "用户已存在");
			//TODO
			return "index";
		}
		else
		{
			userInfoMapper.addUser(info);
			return "login";
		}
		//TODO
	}
	
	@RequestMapping("update.do")
	public String update(@RequestBody UserInfo user){
		userInfoMapper.updateUser(user);
		//TODO
		return null;
	}
}
