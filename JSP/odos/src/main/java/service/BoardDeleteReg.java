package service;


import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_boardDAO;
import dto.Admin_boardDTO;

public class BoardDeleteReg implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("/image/img_Board");
		
		Admin_boardDTO dto = new Admin_boardDTO();
		int a_index = Integer.parseInt(request.getParameter("a_index"));
		dto.setA_index(a_index);
		// 파일 지울 때 쓸거
		Admin_boardDTO fileDto = new Admin_boardDAO().detail(dto.getA_index());
		int cnt = new Admin_boardDAO().delete(dto);
		
		if(cnt>0) {
			if(fileDto.getA_file() != null) {
				new File(path + "\\" + fileDto.getA_file()).delete();
			}
		}
		
		request.setAttribute("mainUrl", "../alert.jsp");
		request.setAttribute("msg", "삭제되었습니다.");
		request.setAttribute("goUrl", "BoardList?type="+request.getParameter("type")+"&page=1");

	}

}
