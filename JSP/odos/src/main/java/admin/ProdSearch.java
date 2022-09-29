package admin;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.CategoryDTO;
import dto.ProductDTO;

public class ProdSearch implements AdminService {

	// 상품 목록
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<ProductDTO> list;
		if(request.getParameter("search")!=null) {
			String s_name = request.getParameter("search");
			list = new ProductDAO().searchList(s_name);
			request.setAttribute("search", s_name);
		} else {
			String cate = request.getParameter("cate");
			if(cate.equals("all")) {
				list = new ProductDAO().list();
			} else {
				list = new ProductDAO().cateList(cate);
				request.setAttribute("cate", cate);
			}
		}
		
		Collections.reverse(list);
		ArrayList<CategoryDTO> category = new CategoryDAO().list();
		
		request.setAttribute("category", category);
		request.setAttribute("list", list);
		request.setAttribute("content", "../adminPage/productList.jsp");
	}
}