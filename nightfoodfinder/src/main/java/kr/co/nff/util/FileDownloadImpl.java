package kr.co.nff.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.FileDAO;
import kr.co.nff.repository.vo.FileVO;

@Service
public class FileDownloadImpl implements FileDownload {

	@Autowired
	private  FileDAO fileDao;
	
	@Override
	public List<FileVO> selectFileList(int reviewNo) {
		List<FileVO> fList = fileDao.selectFileList(reviewNo);
		return fList;
	}
	
	/**
	 * 아직 쓸 계획 없음
	 */
	@Override
	public void download() {
//		Map<String, Object> map = commonService.selectFileInfo(commandMap.getMap());
//		String storedFileName = (String)map.get("STORED_FILE_NAME");
//		String originalFileName = (String)map.get("ORIGINAL_FILE_NAME");
//		 
//		byte fileByte[] = FileUtils.readFileToByteArray(new File("c:\\dev\\file\\" + storedFileName));
//		 
//		response.setContentType("application/octet-stream");
//		response.setContentLength(fileByte.length);
//		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
//		response.setHeader("Content-Transfer-Encoding", "binary");
//		response.getOutputStream().write(fileByte);
//		  
//		response.getOutputStream().flush();
//		response.getOutputStream().close();
	}

}
