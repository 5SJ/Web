package service;


import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_boardDAO;
import dao.User_inquiryDAO;
import dto.Admin_boardDTO;
import dto.User_inquiryDTO;

public class OneQuestionDeleteReg implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("/image/img_oneQue");
		
		User_inquiryDTO dto = new User_inquiryDTO();
	      
		System.out.println("index 1 : "+request.getParameter("u_index"));
		
		dto.setU_index(Integer.parseInt(request.getParameter("u_index")));
		
		String goUrl = "OneQuestionDeleteReg?page=1&u_index="+dto.getU_index();
		
		// 파일 지울 때 쓸거
		User_inquiryDTO fileDto = new User_inquiryDAO().detail(dto.getU_index());
		int cnt = new User_inquiryDAO().delete(dto);

		if(cnt>0) {
			goUrl = "OneQuestionList?page=1";
			if(fileDto.getU_file() != null) {
				new File(path + "\\" + fileDto.getU_file()).delete();
			}
			
		}
		
		request.setAttribute("mainUrl", "../alert.jsp");
		request.setAttribute("msg", "삭제되었습니다.");
		request.setAttribute("goUrl", goUrl);
		

	}

}
