package cn.edu.nju.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.nju.mapper.UserInfoMapper;
import cn.edu.nju.po.UserInfo;
import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;


@Controller
@RequestMapping("/userinfo/")
public class UserInfoController {
    @Autowired
    private HttpSession session;
    
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request,Model model){
		String u = (String)session.getAttribute("user");
		if (u == null) {
			String account = request.getParameter("form-email");
			String password = request.getParameter("form-password");
			UserInfo user=new UserInfo();
			user.setAccount(account);
			user.setPassword(password);
			UserInfo info = userInfoMapper.getUserByAccountAndPwd(user);
			session.setAttribute("user_info", info);
			try{
				ObjectMapper mapper = new ObjectMapper();
				u = mapper.writeValueAsString(info);			
				session.setAttribute("user", u);
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		if(u!=null){
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
		UserInfo u = userInfoMapper.getUserByAccount(user);
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
		return "UserInfoDetail";
	}
	
	@RequestMapping("forget.do")
	public String forget(HttpServletRequest request,Model model){
		//TODO
		return null;
	}
	
	@RequestMapping("logout.do")
	public String logout() {
		session.removeAttribute("user");
		session.removeAttribute("user_info");
		return "login";
	}
	
}
