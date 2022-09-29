package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductDTO;

public class ProdSearch implements MainService {

	// 상품리스트 보기
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String where = request.getParameter("where");
		ArrayList<ProductDTO> list = new ProductDAO().searchList(where); 
		
		request.setAttribute("where", where);
		request.setAttribute("list", list);
		request.setAttribute("mainUrl", "../product/productSch.jsp");
	}

}
