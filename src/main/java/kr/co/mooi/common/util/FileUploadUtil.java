package kr.co.mooi.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileUploadUtil {

	static public final String UPLOAD_DIRECTORY = "/home/jaehyun/git/Mooi/src/main/webapp/resources/upload/";
	
	public static Map<String, String> saveFile(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		Map<String, MultipartFile> fileMap = request.getFileMap();
		Map<String, String> returnMap = new HashMap<String, String>();
		Iterator<String> fileNames = fileMap.keySet().iterator();
		
		while(fileNames.hasNext()) {
			String key = fileNames.next();
			MultipartFile multipartFile = fileMap.get(key);
			if(multipartFile.getSize() < 2) continue;
			
			UUID uuid = UUID.randomUUID();
			String fileName = uuid.toString() + multipartFile.getOriginalFilename();
			returnMap.put(key, fileName);
			
			File newFile = new File(UPLOAD_DIRECTORY + fileName);
			
			try(OutputStream out = new FileOutputStream(newFile)) {
				out.write(multipartFile.getBytes());
			} catch(Exception e) {
				
			} 
		}
		
		return returnMap;
	}
}
