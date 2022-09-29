package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_boardDAO;
import dto.Admin_boardDTO;

public class BoardModifyForm implements MainService {
	
	// 공지사항 수정
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int a_index = Integer.parseInt(request.getParameter("a_index"));
		
		Admin_boardDAO dao = new Admin_boardDAO();
		Admin_boardDTO dto = dao.detail(a_index);
		
		request.setAttribute("mainUrl", "../board/boardModifyForm.jsp");
		request.setAttribute("dto", dto);
	}
}
