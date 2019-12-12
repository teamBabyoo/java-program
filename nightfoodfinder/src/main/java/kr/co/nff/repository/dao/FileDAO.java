package kr.co.nff.repository.dao;

import kr.co.nff.repository.vo.FileVO;

public interface FileDAO {

	public int selectGroupCode();

	public void insertFile(FileVO file);

	public FileVO selectOneFile(int fno);
	

}
