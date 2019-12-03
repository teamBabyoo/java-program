package kr.co.nff.repository.dao;

import kr.co.nff.repository.vo.File;

public interface FileDAO {

	public int selectGroupCode();

	public void insertFile(File file);

	public File selectOneFile(int fno);

}
