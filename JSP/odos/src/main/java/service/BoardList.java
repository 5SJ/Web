package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_boardDAO;
import dto.Admin_boardDTO;

public class BoardList implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int type = Integer.parseInt(request.getParameter("type"));
		ArrayList<Admin_boardDTO> mainData = new Admin_boardDAO().list(type);
		
		request.setAttribute("type", type);
		request.setAttribute("mainData", mainData);
		request.setAttribute("mainUrl", "../board/boardList.jsp");
	}
}