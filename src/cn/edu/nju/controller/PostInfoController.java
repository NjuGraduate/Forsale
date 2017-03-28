package cn.edu.nju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/postInfo/")
public class PostInfoController {
	@RequestMapping("post.do")
	public String post(){
		return null;
	}
	
	@RequestMapping("reply.do")
	public String reply(){
		return null;
	}
}
