package cn.edu.nju.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.PostInfoMapper;
import cn.edu.nju.po.PostInfo;
import cn.edu.nju.po.ReplyInfo;

@Controller
@RequestMapping("/postInfo/")
public class PostInfoController {
	
	@Resource(name="postInfoMapper")
	private PostInfoMapper postInfoMapper;
	
	@RequestMapping("post.do")
	public String post(@RequestBody PostInfo post){
		//TODO
		return null;
	}
	
	@RequestMapping("reply.do")
	public String reply(@RequestBody ReplyInfo reply){
		//TODO
		return null;
	}
	
	@RequestMapping("remove.do")
	public String remove(String info){
		//TODO
		return null;
	}
	
	@RequestMapping("retrieve.do")
	public String retrieve(){
		//TODO
		return null;
	}
}
