package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.FileVO;

public interface FileDAO {
	// 그룹코드 증가시켜 가져오기
	public int selectGroupCode();
	// 파일 등록
	public void insertFile(FileVO file);
	// 파일 조회
	public List<FileVO> selectFileList(int reviewNo);
	

}
