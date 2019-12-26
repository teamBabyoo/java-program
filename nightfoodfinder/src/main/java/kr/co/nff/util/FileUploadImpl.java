package kr.co.nff.util;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nff.repository.dao.FileDAO;
import kr.co.nff.repository.vo.FileVO;
import kr.co.nff.repository.vo.Review;

@Service
public class FileUploadImpl implements FileUpload {
//	private Integer groupCode;

	@Autowired
	private  FileDAO fileDao;
	
//	public int upload(List<MultipartFile> attach) throws Exception {
	public int upload(Review review) throws Exception {
		
		int fileGroupCode = fileDao.selectGroupCode();
		
		List<MultipartFile> attach = review.getAttach();
		
		for (MultipartFile file : attach) {
			
        	if (file.isEmpty()) continue;
        	
        	FileVO fileVO = new FileVO();
        	fileVO.setFileGroupCode(fileGroupCode);
        	String orgName = file.getOriginalFilename();
        	fileVO.setOrgName(orgName);
        	String extension = orgName.substring(orgName.lastIndexOf(".") + 1);
        	fileVO.setExtension(extension);
        	fileVO.setSysName(UUID.randomUUID() + "." + extension);
        	fileVO.setPath("c:/java/nffresources/upload");
        	fileVO.setStoreNo(review.getStoreNo());
        	File f = new File("c:/java/nffresources/upload");
        	if (!f.exists()) {
        		f.mkdirs();
        	}
			file.transferTo(new File(fileVO.getPath(), fileVO.getSysName()));
        	
			fileDao.insertFile(fileVO);
        }
		return fileGroupCode;
	}

}
