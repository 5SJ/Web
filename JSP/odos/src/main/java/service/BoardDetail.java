package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_boardDAO;
import dto.Admin_boardDTO;

public class BoardDetail implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int a_index = Integer.parseInt(request.getParameter("a_index"));
		
		Admin_boardDAO dao = new Admin_boardDAO();
		if(dao.addCnt(a_index) != 0) {
			Admin_boardDTO dto = dao.detail(a_index);
			System.out.println("DetailPageForm : "+dto);
			
			request.setAttribute("dto", dto);
			request.setAttribute("mainUrl", "../board/boardDetail.jsp");
		}else {
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "존재하지않는 게시물입니다.");
			request.setAttribute("goUrl", "BoardList?type="+request.getParameter("type"));
		}
	}
}