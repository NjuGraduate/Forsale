package cn.edu.nju.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import cn.edu.nju.mapper.AdvertisementInfoMapper;
import cn.edu.nju.mapper.CommentInfoMapper;
import cn.edu.nju.mapper.CommodityInfoMapper;
import cn.edu.nju.mapper.GoodsInfoMapper;
import cn.edu.nju.mapper.RecordInfoMapper;
import cn.edu.nju.mapper.ShopInfoMapper;
import cn.edu.nju.mapper.UserInfoMapper;
import cn.edu.nju.po.AdvertisementInfo;
import cn.edu.nju.po.CommentInfo;
import cn.edu.nju.po.CommodityInfo;
import cn.edu.nju.po.GoodsInfo;
import cn.edu.nju.po.RecordInfo;
import cn.edu.nju.po.ShopInfo;
import cn.edu.nju.po.UserInfo;

@Controller
@RequestMapping("/managerActionInfo/")
public class ManagerActionInfoController {
	@Autowired
    private HttpSession session;
	
	@Resource(name="userInfoMapper")
	private UserInfoMapper userInfoMapper;
	
	@Resource(name="advertisementInfoMapper")
	private AdvertisementInfoMapper advertisementInfoMapper;
	
	@Resource(name="commodityInfoMapper")
	private CommodityInfoMapper commodityInfoMapper;
	
	@Resource(name="commentInfoMapper")
	private CommentInfoMapper commentInfoMapper;
	
	@Resource(name="shopInfoMapper")
	private ShopInfoMapper shopInfoMapper;
	
	@Resource(name="goodsInfoMapper")
	private GoodsInfoMapper goodsInfoMapper;
	
	@Resource(name="recordInfoMapper")
	private RecordInfoMapper recordInfoMapper;
	
	
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
	
	@RequestMapping("commentMax.do")
	@ResponseBody
	//获得最活跃评论用户名:评论数量;被评论最多用户:被评论数量；格式{131250037@smail.nju.edu.cn:100;131250@smail.nju.edu.cn:200}
	public String commentMax(){
		ObjectMapper mapper = new ObjectMapper();
		List<CommentInfo> list = commentInfoMapper.getComments();
		List<String> listBuyer = new ArrayList<>();
		List<String> listSeller = new ArrayList<>();
		for(CommentInfo c:list){
			listBuyer.add(c.getBuyer_account());
			listSeller.add(c.getSeller_account());
		}
		String result = rankMax(listBuyer)+";"+rankMax(listSeller);
		try {
			return mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	@RequestMapping("commentEveryMonth.do")
	@ResponseBody
	//获得当年1月，2月，3月。。。12月评论数量,返回格式{0;0;0;0;0;0;0;0;0;0;0;0}
	public String commentEveryMonth(){
		int momth1=0;
		int momth2=0;
		int momth3=0;
		int momth4=0;
		int momth5=0;
		int momth6=0;
		int momth7=0;
		int momth8=0;
		int momth9=0;
		int momth10=0;
		int momth11=0;
		int momth12=0;
		ObjectMapper mapper = new ObjectMapper();
		List<CommentInfo> list = commentInfoMapper.getComments();
		String time = "";
		Calendar now = Calendar.getInstance(); 
		String NowYear = now.get(Calendar.YEAR)+"";
		for(CommentInfo c:list){
			time = c.getTime();
			if(time.contains(NowYear)){
				if(time.contains("/1/"))momth1++;
				if(time.contains("/2/"))momth2++;
				if(time.contains("/3/"))momth3++;
				if(time.contains("/4/"))momth4++;
				if(time.contains("/5/"))momth5++;
				if(time.contains("/6/"))momth6++;
				if(time.contains("/7/"))momth7++;
				if(time.contains("/8/"))momth8++;
				if(time.contains("/9/"))momth9++;
				if(time.contains("/10/"))momth10++;
				if(time.contains("/11/"))momth11++;
				if(time.contains("/12/"))momth12++;
			}
		}
		try {
			return mapper.writeValueAsString(momth1+";"+momth2+";"+momth3+";"+momth4+";"+momth5+";"+momth6+";"+momth7+";"+momth8+";"+momth9+";"+momth10+";"+momth11+";"+momth12);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	@RequestMapping("recordMax.do")
	@ResponseBody
	//获得买最多用户名:数量;卖最多用户:数量；格式{131250037@smail.nju.edu.cn:100;131250@smail.nju.edu.cn:200}
	public String recordMax(){
		ObjectMapper mapper = new ObjectMapper();
		List<RecordInfo> list = recordInfoMapper.getRecords();
		List<String> listBuyer = new ArrayList<>();
		List<String> listSeller = new ArrayList<>();
		for(RecordInfo c:list){
			listBuyer.add(c.getBuyer_account());
			listSeller.add(c.getSeller_account());
		}
		String result = rankMax(listBuyer)+";"+rankMax(listSeller);
		try {
			return mapper.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "[]";
		}
	}
	
	@RequestMapping("recordEveryMonth.do")
	@ResponseBody
	//获得当年1月，2月，3月。。。12月评论数量,返回格式{0;0;0;0;0;0;0;0;0;0;0;0}
	public String recordEveryMonth(){
		int momth1=0;
		int momth2=0;
		int momth3=0;
		int momth4=0;
		int momth5=0;
		int momth6=0;
		int momth7=0;
		int momth8=0;
		int momth9=0;
		int momth10=0;
		int momth11=0;
		int momth12=0;
		ObjectMapper mapper = new ObjectMapper();
		List<RecordInfo> list = recordInfoMapper.getRecords();
		String time = "";
		Calendar now = Calendar.getInstance(); 
		String NowYear = now.get(Calendar.YEAR)+"";
		for(RecordInfo c:list){
			time = c.getDate();
			if(time.contains(NowYear)){
				if(time.contains("/1/"))momth1++;
				if(time.contains("/2/"))momth2++;
				if(time.contains("/3/"))momth3++;
				if(time.contains("/4/"))momth4++;
				if(time.contains("/5/"))momth5++;
				if(time.contains("/6/"))momth6++;
				if(time.contains("/7/"))momth7++;
				if(time.contains("/8/"))momth8++;
				if(time.contains("/9/"))momth9++;
				if(time.contains("/10/"))momth10++;
				if(time.contains("/11/"))momth11++;
				if(time.contains("/12/"))momth12++;
			}
		}
		try {
			return mapper.writeValueAsString(momth1+";"+momth2+";"+momth3+";"+momth4+";"+momth5+";"+momth6+";"+momth7+";"+momth8+";"+momth9+";"+momth10+";"+momth11+";"+momth12);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	private String rankMax(List<String> list){
		String regex;  
        Pattern p;  
        Matcher m;  
        String tmp = "";          
        String tot_str = list.toString();  
        int max_cnt = 0;  
        String max_str = "";  
        for(String str : list) {  
            if (tmp.equals(str)) continue;            
            tmp = str;  
            regex = str;  
            p = Pattern.compile(regex);  
            m = p.matcher(tot_str);  
            int cnt = 0;  
            while(m.find()) {  
                cnt++;  
            }  
            //System.out.println(str + ":" + cnt);  
            if (cnt > max_cnt) {  
                max_cnt = cnt;  
                max_str = str;  
            }  
        }
		return max_str+":"+max_cnt; 
	}
	
	@RequestMapping("banUser.do")
	public String banUser(@RequestParam("account") String account){
		UserInfo adminuser = (UserInfo)session.getAttribute("user_info");
		if(adminuser.getAccount().equals("admin@smail.nju.edu.cn")){
			UserInfo user = new UserInfo();
			user.setAccount(account);
			if(userInfoMapper.getUserByAccount(user)!=null){
				userInfoMapper.removeUser(user);
			}
			List<CommodityInfo> commodities = commodityInfoMapper.getCommodityByUserAccount(user);
			for(CommodityInfo c:commodities){
				commodityInfoMapper.removeCommodity(c);
			}
			ShopInfo shop = shopInfoMapper.getShopByUserAccount(user);
			if(shop!=null){
				shopInfoMapper.removeShop(shop);
			}
			List<GoodsInfo> goods= goodsInfoMapper.getGoodsByUserAccount(user);
			for(GoodsInfo c:goods){
				goodsInfoMapper.removeGoods(c);
			}
			List<AdvertisementInfo> ads = advertisementInfoMapper.getAdvertisementByUserAccount(user);
			for(AdvertisementInfo a:ads){
				advertisementInfoMapper.removeAdvertisement(a);
			}
		}
		return "Master";
	}
	
	@RequestMapping("reviewAdSuccess.do")
	public String reviewAdSuccess(@RequestParam("id") int id){
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setCommodity_id(id);
		AdvertisementInfo adr = advertisementInfoMapper.getAdvertisementByCommodityId(ad);
		CommodityInfo com = new CommodityInfo();
		com.setId(adr.getCommodity_id());
		CommodityInfo comr = commodityInfoMapper.getCommodityById(com);
		if(adr!=null){
			adr.setState("success");
			System.out.println(adr);
			advertisementInfoMapper.updateAdvertisement(adr);
			sendEmail(adr.getUser_account(),"congratulation for passing your advertisement"+comr.getId()+"Description:"+comr.getDes());
		}
		return "Master";
	}
	
	@RequestMapping("reviewAdFail.do")
	public String reviewAdFail(@RequestParam("id") int id){
		AdvertisementInfo ad = new AdvertisementInfo();
		ad.setCommodity_id(id);
		AdvertisementInfo adr = advertisementInfoMapper.getAdvertisementByCommodityId(ad);
		CommodityInfo com = new CommodityInfo();
		com.setId(adr.getCommodity_id());
		CommodityInfo comr = commodityInfoMapper.getCommodityById(com);
		if(adr!=null){
			advertisementInfoMapper.removeAdvertisement(adr);
			sendEmail(adr.getUser_account(),"sorry for rejecting your advertisement about:Id"+comr.getId()+"Description:"+comr.getDes());
		}
		return "Master";
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
        message.setFrom(new InternetAddress(sendMail, "Forsale缃�", "UTF-8"));
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, "Forsal鐢ㄦ埛", "UTF-8"));
        message.setSubject("Welcome to Forsale", "UTF-8");
        String url = "http://localhost:8080/forsale/index.jsp";
        message.setContent("Thank you for using "+url+" "+ description, "text/html;charset=UTF-8");
        message.setSentDate(new Date());
        message.saveChanges();

        return message;
    }
}
