package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dto.CategoryDTO;

public class CateList implements AdminService {

	// 카테고리 관리페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<CategoryDTO> list = new CategoryDAO().list();
		
		request.setAttribute("list", list);
		request.setAttribute("content", "../adminPage/categoryList.jsp");
	}
}