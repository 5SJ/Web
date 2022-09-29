package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.CategoryDTO;
import dto.ProductDTO;

public class ProdModify implements AdminService {

	// 상품 수정
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		ProductDTO dto = new ProductDAO().detail(index);
		ArrayList<CategoryDTO> list = new CategoryDAO().list();
		
		request.setAttribute("dto", dto);
		request.setAttribute("category", list);
		request.setAttribute("content", "../adminPage/productModify.jsp");
	}
}