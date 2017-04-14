package cn.edu.nju.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUpdateController {
	@RequestMapping("/upload.do")
	public String fileupload(@RequestParam(value="file",required=false) MultipartFile file,HttpServletRequest request,Model model) {
		// TODO Auto-generated method stub
		String path = request.getSession().getServletContext().getRealPath("/upload");
		String Name = file.getOriginalFilename();
//		String extName = old.substring(old.indexOf("."));
		//requst.getServletPath()
		File newFile = new File(path,Name);
		try {
			file.transferTo(newFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
}
