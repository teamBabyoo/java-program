package kr.co.nff.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.nff.repository.dao.FileDAO;
import kr.co.nff.repository.vo.FileVO;


@WebServlet("/util/download.do")
public class FIleDownloadController extends HttpServlet{
	FileDAO dao;

	public FIleDownloadController() {	
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(FileDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int fgno = Integer.parseInt(req.getParameter("fgno"));
		
		FileVO file = dao.selectOneFile(fgno);
		
		
		String path = file.getPath();
		String fName = file.getSystemName(); 
		String dName = file.getOrgName();  
		

		File f  = new File(path, fName);
		

		if(dName == null) {res.setHeader("Content-type", "image/jpg");
		
		}
	
		else {	
			res.setHeader("Content-type", "application/octet-stream");
			dName = new String(dName.getBytes("utf-8"), "8859_1");
			res.setHeader("Content-Disposition", "attchment;filename=" + dName);
		}
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = res.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while(true) {
			int ch = bis.read();
			if(ch == -1) break;
			bos.write(ch);
		}
		bis.close(); fis.close();
		bos.close(); out.close();
	}
	
}
