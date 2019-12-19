package kr.co.nff.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.FileDAO;
import kr.co.nff.repository.vo.FileVO;
import kr.co.nff.repository.vo.Review;

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
	public void download(HttpServletRequest req, HttpServletResponse res, Review review) throws ServletException, IOException {
		//사용자가  요청한 파일이 어느날짜 어느 시간에 있는지 모른다.
		String path = req.getParameter("path"); // 사용자 요청 파일이 저장된 경로 
		String name = req.getParameter("name"); // 사용자 요청 파일명
		String dname = req.getParameter("dname"); // 다운로드할 파일명
		
		//파일의 읽기 위한 파일 객체 생성
		File f = new File(path, name);
		
		//전송하는 내용에 대한 설정
		if(dname == null) {
			res.setHeader("Content-Type", "image/jpg");
		} //다운로드 시킬 때
		   else {
			 //브라우저가 타입을 모르면 다운시켜주는게 있었다..
			res.setHeader("Content-Type", "application/octet-stream"); 
			//한글이름일 경우 처리
			dname = new String(dname.getBytes("utf-8"), "8859_1");
			//다운로드할 이름을 지정
			res.setHeader("Content-Disposition", "attachment;filename=" + dname);
		}
		
		//브라우저로 전송
		//읽어서 사용자에게 전송 reader가 아닌 InputStream. 이미지 일 수 있으니.. 텍스트를 바이트로 보내도 된다. 반대는 X
		FileInputStream fis = new FileInputStream(f);
		//속도향상
		BufferedInputStream bis = new BufferedInputStream(fis);
		//byte 단위를 파일로 보내기 위해
		OutputStream out = res.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while(true) {
			int ch = bis.read();
			if(ch == -1) break;
			//파일읽을 내용이 있으면
			bos.write(ch);
		}
		bis.close();fis.close();
		bos.close();out.close();
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
