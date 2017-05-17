package cn.edu.nju.controller;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.nju.mapper.UserInfoMapper;
import cn.edu.nju.po.UserInfo;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
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
			try {
				ObjectMapper mapper = new ObjectMapper();
				model.addAttribute("msg",mapper.writeValueAsString(new String("fail")));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "login";
		}
	}
	
	@RequestMapping("register.do")
	public String register(HttpServletRequest request,Model model){
		String account = request.getParameter("form-email");
		ObjectMapper mapper = new ObjectMapper();
		if(account.endsWith("edu.cn")){
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
				sendEmail(account,password);
				return "login";
			}else{
				try {
					model.addAttribute("msg",mapper.writeValueAsString(new String("fail")));
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "register";
			}
		}else{
			try {
				model.addAttribute("msg",mapper.writeValueAsString(new String("fail")));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "register";
		}
		
	}
	

	@RequestMapping("update.do")
	public String update(HttpServletRequest request,Model model){
		UserInfo info = (UserInfo)session.getAttribute("user_info");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		info.setPassword(oldPassword);
		UserInfo u = userInfoMapper.getUserByAccountAndPwd(info);
		if(u!=null){
			u.setPassword(newPassword);
			userInfoMapper.updateUser(u);
			model.addAttribute("success", "msg");
		}else{
			model.addAttribute("fail", "msg");
		}
		return "UserInfoDetail";
	}
	
	@RequestMapping("complete.do")
	public String complete(HttpServletRequest request,Model model){
		UserInfo info = (UserInfo)session.getAttribute("user_info");
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		info.setPassword(oldPassword);
		UserInfo u = userInfoMapper.getUserByAccountAndPwd(info);
		if(u!=null){
			u.setPassword(newPassword);
			userInfoMapper.updateUser(u);
			model.addAttribute("success", "msg");
		}else{
			model.addAttribute("fail", "msg");
		}
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
	
	private static void sendEmail(String receiveMailAccount,String password) {
	    String myEmailAccount = "18795979720@163.com";
	    String myEmailPassword = "18795979720xy";

	    String myEmailSMTPHost = "smtp.163.com";
		
        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp"); 
        props.setProperty("mail.smtp.host", myEmailSMTPHost);
        props.setProperty("mail.smtp.auth", "true");
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
        
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);

        MimeMessage message;
		try {
			message = createMimeMessage(session, myEmailAccount, receiveMailAccount, password);
	        Transport transport = session.getTransport();
	        transport.connect(myEmailAccount, myEmailPassword);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String password) throws Exception {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(sendMail, "Forsale网", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "Forsal用户", "UTF-8"));
        message.setSubject("Welcome to Forsale", "UTF-8");
        String url = "http://localhost:8080/forsale/index.jsp";
        message.setContent("Thank you for resgitering "+url+" You new password: "+ password, "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();

        return message;
    }
}
