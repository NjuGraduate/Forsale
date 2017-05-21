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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.nju.mapper.UserInfoMapper;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.GoodsInfo;
import cn.edu.nju.po.UserInfo;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;


@Controller
@RequestMapping("/userinfo/")
public class UserInfoController {
	UserInfo usertemp = new UserInfo();
	
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
			if (info != null) {				
				session.setAttribute("user_info", info);
				try{
					ObjectMapper mapper = new ObjectMapper();
					u = mapper.writeValueAsString(info);			
					session.setAttribute("user", u);
					if(account.equals("131250037@smail.nju.edu.cn")){
						return "Master";
					}
				}catch(IOException e) {
					e.printStackTrace();
				}
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
	
	@RequestMapping("validate.do")
	public String validate(HttpServletRequest request,Model model){
		String account = request.getParameter("form-email");
		String password = request.getParameter("form-password");
		String name = request.getParameter("form-first-name")+request.getParameter("form-last-name");
		String des = request.getParameter("form-about-yourself");
		usertemp.setAccount(account);
		usertemp.setPassword(password);
		usertemp.setName(name);
		usertemp.setDescription(des);
		usertemp.setBalance(0.0);
		usertemp.setRank(1);
		if(account.endsWith("edu.cn")&&userInfoMapper.getUserByAccount(usertemp)==null){
			sendEmail(account,"your verification code:"+makeCode(account));
			return "code";
		}else{
			return "register";
		}
	}
	
	@RequestMapping("register.do")
	public String register(HttpServletRequest request,Model model){
		String account = usertemp.getAccount();
		String validate = request.getParameter("code");
		String validate2 = makeCode(account);
		System.out.println("zhanghu:"+account);
		System.out.println("tianxie:"+validate+"zhengque:"+validate2);
		ObjectMapper mapper = new ObjectMapper();
		if(validate.equals(validate2)&&usertemp!=null){
			UserInfo u = userInfoMapper.getUserByAccount(usertemp);
			if(u==null){
				userInfoMapper.addUser(usertemp);
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
				model.addAttribute("msg",mapper.writeValueAsString(new String("fail-email")));
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
	
	@RequestMapping("getAllUsers.do")
	@ResponseBody
	public String getAllUsers(){
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(userInfoMapper.getUsers());
		} catch (Exception e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout() {
		session.removeAttribute("user");
		session.removeAttribute("user_info");
		return "login";
	}
	
	private String makeCode(String account){
		String validate2 = "4396";
		try {
			MessageDigest md;
			md = MessageDigest.getInstance("MD5");
			md.update(account.getBytes());
			String validate1 = new BigInteger(1, md.digest()).toString(16);
			validate2 = validate1.substring(0,4);
			Calendar now = Calendar.getInstance(); 
			validate2 +=(now.get(Calendar.MONTH)+1)+now.get(Calendar.DAY_OF_MONTH);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return validate2;
	}
	
	private static void sendEmail(String receiveMailAccount,String description) {
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
			message = createMimeMessage(session, myEmailAccount, receiveMailAccount, description);
	        Transport transport = session.getTransport();
	        transport.connect(myEmailAccount, myEmailPassword);
	        transport.sendMessage(message, message.getAllRecipients());
	        transport.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail,String description) throws Exception {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(sendMail, "Forsale网", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "Forsal用户", "UTF-8"));
        message.setSubject("Welcome to Forsale", "UTF-8");
        String url = "http://localhost:8080/forsale/index.jsp";
        message.setContent("Thank you for using "+url+" "+ description, "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();

        return message;
    }
}
