package com.myweb.home.upload.contoller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

//@Controller
//@RequestMapping(value="/upload")
public class PhotoUploadController {
	
	
	
	
	
	
	
	
	
//	@PostMapping(value="/image", produces="application/json; charset=utf-8")
//	@ResponseBody
//	public String image(HttpServletRequest request
//			, @RequestParam("upload") MultipartFile[] files) throws Exception {
//		
//		String realPath = request.getServletContext().getRealPath("/resources");
//		JSONObject json = new JSONObject();
//		
//		for(MultipartFile file: files) {
//			System.out.println("getName() : " + file.getName());
//			System.out.println("getOriginalFilename() : " + file.getOriginalFilename());
//			System.out.println("getSize() : " + file.getSize());
//			System.out.println("getContentType() : " + file.getContentType());
//			
//			json.put("filename", file.getOriginalFilename());
//			json.put("url", request.getContextPath() + "/resources/img/member/" + file.getOriginalFilename());
//			
//			file.transferTo(new File(realPath + "/img/member/" + file.getOriginalFilename()));
//		}
//		
//		return json.toJSONString();
//		
//	}
	
	
}
