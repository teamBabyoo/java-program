package kr.co.nff.util;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.nff.repository.vo.FileVO;

public interface FileUpload {
	// 이미지 업로드하는 리뷰등록
	public int upload(List<MultipartFile> attach) throws Exception;
	
	// 이미지 다운로드 하지 않으면서 그냥 경로로 가져오기
	public FileVO selectOnefile(int reviewNo);
}
