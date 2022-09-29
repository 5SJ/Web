package admin;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.CategoryDTO;
import dto.ProductDTO;

public class ProdList implements AdminService {

	// 상품 목록
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<ProductDTO> list = new ProductDAO().list();
		Collections.reverse(list);
		ArrayList<CategoryDTO> category = new CategoryDAO().list();
		
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.setAttribute("content", "../adminPage/productList.jsp");
		
	}
}