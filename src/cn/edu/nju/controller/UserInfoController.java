package cn.edu.nju.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	public String login(HttpServletRequest request,Model model){
		String email = request.getParameter("form-email");
		String password = request.getParameter("form-password");
		UserInfo user=new UserInfo();
		user.setEmail(email);
		user.setPwd(password);
		model.addAttribute("user",user);
		//TODO
		return "index";
	}
	
	@RequestMapping("register.do")
	public String register(HttpServletRequest request,Model model){
		String email = request.getParameter("form-email");
		String password = request.getParameter("form-password");
		String name = request.getParameter("form-first-name")+request.getParameter("form-last-name");
		String description = request.getParameter("form-about-yourself");
		UserInfo user = new UserInfo();
		user.setEmail(email);
		user.setPwd(password);
		user.setUserName(name);
		user.setDescription(description);
		System.out.println(user);
		//TODO
		return "index";
	}
	
	@RequestMapping("update.do")
	public String update(@RequestBody UserInfo user){
		userInfoMapper.updateUser(user);
		//TODO
		return null;
	}
}