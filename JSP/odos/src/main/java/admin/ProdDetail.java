package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import dto.ProductDTO;

public class ProdDetail implements AdminService {

	// 상품 상세보기
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		ProductDTO dto = new ProductDAO().detail(index);
		
		request.setAttribute("dto", dto);
		request.setAttribute("content", "../adminPage/productDetail.jsp");
	}
}