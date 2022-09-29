package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Admin_boardDAO;
import dto.Admin_boardDTO;

public class BoardModifyReg implements MainService {
	
	//수정 Reg
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("/image/img_Board");
		int size = 1024*1024 *10;
		
		try {
			MultipartRequest mr = new MultipartRequest(
					request, 
					path, 
					size, 
					"UTF-8",
					new DefaultFileRenamePolicy());

			Admin_boardDTO dto = new Admin_boardDTO();
			dto.setA_title(mr.getParameter("title"));
			dto.setA_type(Integer.parseInt(mr.getParameter("a_type")));
			
			// 08-17
			if(mr.getParameter("a_file") != null) {
				dto.setA_file(mr.getParameter("a_file"));				
			} else {
				dto.setA_file(mr.getFilesystemName("a_file"));
			}
			
			dto.setA_content(mr.getParameter("contentArea"));
			dto.setA_fix(mr.getParameter("check"));
			dto.setA_index(Integer.parseInt(mr.getParameter("a_index")));
			
			
			int res = new Admin_boardDAO().modify(dto);
			
			String goUrl = "BoardModifyReg?page="+mr.getParameter("page")+"&a_index="+dto.getA_index();

			if(res > 0){
				goUrl = "BoardDetail?page="+mr.getParameter("page")+"&a_index="+dto.getA_index();
			}
			
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "수정완료");
			request.setAttribute("goUrl", goUrl);
			request.setAttribute("dto", dto);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}