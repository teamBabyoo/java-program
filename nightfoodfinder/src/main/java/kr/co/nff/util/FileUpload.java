package kr.co.nff.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.nff.repository.vo.FileVO;

public class FileUpload {
	private Integer groupCode;

	public static List<MultipartFile> upload(List<MultipartFile> attach) {
		List<MultipartFile> list = new ArrayList<>();
		
		//
		for (MultipartFile file : attach) {
        	if (file.isEmpty()) continue;
        	
        	FileVO f = new FileVO();
        	String orgName = file.getOriginalFilename();
        	long size = file.getSize();
        	System.out.println("파일명 : " + orgName);
        	System.out.println("파일크기 : " + size);
        	f.setOrgName(orgName);
        	try {
				file.transferTo(new File("c:/java/nffresources/" + orgName));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	list.add(file);
        }
		// 
		System.out.println("성공");
		return list;
	}
}
