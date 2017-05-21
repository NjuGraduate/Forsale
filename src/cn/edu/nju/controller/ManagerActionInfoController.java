package cn.edu.nju.controller;

import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.mapper.UserInfoMapper;
import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/managerActionInfo/")
public class ManagerActionInfoController {
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@Resource(name="advertisementInfoMapper")
	private AdvertisementInfoMapper advertisementInfoMapper;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
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
	
	@RequestMapping("banUser.do")
	public String banUser(String account){
		UserInfo user = new UserInfo();
		user.setAccount(account);
		if(userInfoMapper.getUserByAccount(user)!=null)
		userInfoMapper.removeUser(user);
		return "banUser";
	}
	
	@RequestMapping("removeCommodity.do")
	public String removeCommodity(String id){
		CommodityInfo com = new CommodityInfo();
		commodityInfoMapper.removeCommodity(com);
		return "removeCommodity";
	}
	
	@RequestMapping("reviewAdSuccess.do")
	public String reviewAdSuccess(@RequestParam("id") String id){
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setId(id);
		AdvertisementInfo adr = advertisementInfoMapper.getAdvertisementById(ad);
		if(adr!=null){
			adr.setState("success");
			advertisementInfoMapper.updateAdvertisement(adr);
			sendEmail(adr.getUser_account(),"congratulation for passing your advertisement");
		}
		return "adManage";
	}
	
	@RequestMapping("reviewAdFail.do")
	public String reviewAdFail(@RequestParam("id") String id){
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setId(id);
		AdvertisementInfo adr = advertisementInfoMapper.getAdvertisementById(ad);
		if(adr!=null){
			adr.setState("fail");
			advertisementInfoMapper.updateAdvertisement(adr);
			sendEmail(adr.getUser_account(),"sorry for rejecting your advertisement");
		}
		return "adManage";
	}
	
	@RequestMapping("removeAd.do")
	public String removeAd(@RequestParam("id") String id){
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setId(id);
		if(advertisementInfoMapper.getAdvertisementById(ad)!=null){
			advertisementInfoMapper.removeAdvertisement(ad);
		}
		return "";
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
