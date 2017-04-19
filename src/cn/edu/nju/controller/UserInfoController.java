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
		String account = request.getParameter("form-email");
		String password = request.getParameter("form-password");
		UserInfo user=new UserInfo();
		user.setAccount(account);
		user.setPassword(password);
		System.out.println(user);
		UserInfo u = userInfoMapper.getUserByAccountAndPwd(user);
		System.out.println(u);
		if(u!=null){
			model.addAttribute("user",user);
			return "index";
		}else{
			model.addAttribute("msg","fail");
			return "login";
		}
	}
	
	@RequestMapping("register.do")
	public String register(HttpServletRequest request,Model model){
		String account = request.getParameter("form-email");
		String password = request.getParameter("form-password");
		String name = request.getParameter("form-first-name")+request.getParameter("form-last-name");
		String des = request.getParameter("form-about-yourself");
		UserInfo user = new UserInfo();
		user.setAccount(account);
		user.setPassword(password);
		user.setName(name);
		user.setDescription(des);
		user.setBalance(0.0);
		user.setRank(1);
		System.out.println(user);
		UserInfo u = userInfoMapper.getUserByAccount(user);
		System.out.println(u);
		if(u==null){
			userInfoMapper.addUser(user);
			model.addAttribute("user",user);
			return "login";
		}else{
			model.addAttribute("msg","fail");
			return "register";
		}
	}
	
	@RequestMapping("update.do")
	public String update(HttpServletRequest request,Model model){
		String account = request.getParameter("form-email");
		String password = request.getParameter("form-password");
		String name = request.getParameter("form-first-name")+request.getParameter("form-last-name");
		String des = request.getParameter("form-about-yourself");
		UserInfo user = new UserInfo();
		user.setAccount(account);
		user.setPassword(password);
		user.setName(name);
		user.setDescription(des);
//		userInfoMapper.updateUser(user);
		//TODO
		return null;
	}
	
	@RequestMapping("forget.do")
	public String forget(HttpServletRequest request,Model model){
		//TODO
		return null;
	}
}