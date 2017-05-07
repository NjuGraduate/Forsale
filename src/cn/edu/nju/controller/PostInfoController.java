package cn.edu.nju.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.PostInfoMapper;
import cn.edu.nju.po.PostInfo;

@Controller
@RequestMapping("/postInfo/")
public class PostInfoController {
	
	@Resource(name="postInfoMapper")
	private PostInfoMapper postInfoMapper;
	
	@RequestMapping("post.do")
	public String post(HttpServletRequest request){
//		PostInfo post = new PostInfo();
//		request.getParameter("form-email"), request.getParameter("form-password")
//		postInfoMapper.addPost(post);
//		return "post";
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
