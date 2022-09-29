package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.CategoryDTO;
import dto.ProductDTO;

public class CateItemModify implements AdminService {

	// 카테고리 관리페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String c_name = request.getParameter("c_name");
		ArrayList<Integer> c_item = new CategoryDAO().detail(c_name);
		ArrayList<ProductDTO> p_list = new ProductDAO().list();
		
		request.setAttribute("c_name", c_name);
		request.setAttribute("c_item", c_item);
		request.setAttribute("p_list", p_list);
		request.setAttribute("content", "../adminPage/categoryItemModify.jsp");
	}
}