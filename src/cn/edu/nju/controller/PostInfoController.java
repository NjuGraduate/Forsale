package cn.edu.nju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/postInfo/")
public class PostInfoController {
	@RequestMapping("post.do")
	public String post(){
		//TODO
		return null;
	}
	
	@RequestMapping("reply.do")
	public String reply(){
		//TODO
		return null;
	}
	
	@RequestMapping("remove.do")
	public String remove(){
		//TODO
		return null;
	}
	
	@RequestMapping("retrieve.do")
	public String retrieve(){
		//TODO
		return null;
	}
}
