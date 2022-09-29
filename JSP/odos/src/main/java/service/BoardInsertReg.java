package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Admin_boardDAO;
import dto.Admin_boardDTO;

public class BoardInsertReg implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("/image/img_Board");
		int size = 1024 * 1024 * 10;
		
		try {
			MultipartRequest mr = new MultipartRequest(
					  request,
					  path,
					  size,
					  "UTF-8",
			           new DefaultFileRenamePolicy()
					);

			Admin_boardDTO dto = new Admin_boardDTO();
			
			dto.setA_content(mr.getParameter("contentArea"));
			dto.setA_file(mr.getFilesystemName("a_file"));
			dto.setA_type(Integer.parseInt(mr.getParameter("a_type")));
			dto.setA_title(mr.getParameter("title"));
			dto.setA_fix(mr.getParameter("check"));
			
			System.out.println("NoticeReg : "+dto);
			
			int res = new Admin_boardDAO().insert(dto);
            System.out.println("res : "+res);
            
           //dto = new admin_boardDAO().detail(res);
		
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "입력되었습니다.");
			request.setAttribute("goUrl", "BoardDetail?page=1&a_index="+res);
			request.setAttribute("dto", dto);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
