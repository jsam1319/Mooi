package kr.co.mooi.image.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.mooi.image.service.ImageService;

@Controller
public class ImageController {

	@Inject
	ImageService imageService;
	
	@RequestMapping(value="/image/body", method=RequestMethod.POST)
	@ResponseBody
	public String uploadImage(MultipartFile file, HttpServletRequest request) throws Exception {
		return imageService.uploadImage(request, file);
	}
	
}
