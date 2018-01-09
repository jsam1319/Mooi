package kr.co.mooi.image.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ImageServiceImpl implements ImageService {

//	public final String UPLOAD_PATH = "/home/jaehyun/git/Mooi/src/main/webapp/resources/upload/";
//	
	@Override
	public String uploadImage(HttpServletRequest request ,MultipartFile file) throws Exception {
		UUID uuid = UUID.randomUUID();
		String fileName = uuid.toString();
		String uploadPath = request.getSession().getServletContext().getRealPath("/");
		String attachPath = "resources/upload/";
		
		File newFile = new File(uploadPath + attachPath + fileName);
		
		try(OutputStream out = new FileOutputStream(newFile)) {
			out.write(file.getBytes());
		} 
		
		return fileName;
	}

	
}
