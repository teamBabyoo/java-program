package kr.co.nff.util;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface FileUpload {
	public int upload(List<MultipartFile> attach) throws Exception;
}
