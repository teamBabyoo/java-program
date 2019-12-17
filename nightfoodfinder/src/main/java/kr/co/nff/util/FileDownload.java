package kr.co.nff.util;

import java.util.List;

import kr.co.nff.repository.vo.FileVO;

public interface FileDownload {
	// 이미지 다운로드
	public void download();

	// 이미지 다운로드 하지 않으면서 그냥 경로로 가져오기
	List<FileVO> selectFileList(int reviewNo); 
}
