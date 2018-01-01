package kr.co.mooi.image.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {

	public String uploadImage(MultipartFile file) throws Exception;
}
