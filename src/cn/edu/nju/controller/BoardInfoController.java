package cn.edu.nju.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.nju.mapper.BoardInfoMapper;

@Controller
@RequestMapping("/boardInfoController/")
public class BoardInfoController {
	@Resource(name="boardInfoMapper")
	private BoardInfoMapper boardInfoMapper;
	
	@RequestMapping("addmessage.do")
	public String addmessage(String str){
		//TODO
		return null;
	}
	
	@RequestMapping("replymessage.do")
	public String replymessage(String str){
		//TODO
		return null;
	}
}
