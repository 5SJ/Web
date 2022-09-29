package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductDTO;

public class ProdList implements MainService {

	// 상품리스트 보기
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String category = request.getParameter("cate");
		ArrayList<ProductDTO> list = new ProductDAO().cateList(category); 
		
		request.setAttribute("list", list);
		request.setAttribute("nowCate", category);
		request.setAttribute("mainUrl", "../product/productList.jsp");
	}

}
