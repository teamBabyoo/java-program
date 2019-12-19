package kr.co.nff.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.nff.repository.vo.FileVO;
import kr.co.nff.repository.vo.Review;

public interface FileDownload {

	// 이미지 다운로드 하지 않으면서 그냥 경로로 가져오기
	List<FileVO> selectFileList(int reviewNo);

	// 이미지 다운로드
	void download(HttpServletRequest req, HttpServletResponse res, Review review) throws ServletException, IOException; 
}
