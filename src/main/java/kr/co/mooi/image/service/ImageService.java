package kr.co.mooi.image.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {

	public String uploadImage(HttpServletRequest request, MultipartFile file) throws Exception;
}
