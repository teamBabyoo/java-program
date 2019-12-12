package kr.co.nff.util;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class NffFileRenamePolicy implements FileRenamePolicy {
	
	public File rename(File f) {		
		String name = f.getName();
		int index = name.lastIndexOf(".");
		String extName = "";
		if (index != -1) extName = name.substring(index);
		return new File(f.getParent(), UUID.randomUUID().toString() + extName);
	}
}
