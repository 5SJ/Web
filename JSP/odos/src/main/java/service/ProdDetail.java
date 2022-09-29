package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import dao.WishlistDAO;
import dto.ProductDTO;
import dto.WishlistDTO;

public class ProdDetail implements MainService {

	// 상품 상세보기
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		int index = Integer.parseInt(request.getParameter("index"));
		ProductDTO dto = new ProductDAO().detail(index);
		
		WishlistDTO wdto = new WishlistDAO().detail(id);
		
		String wish = "n";
		if(wdto.getWl_item().containsKey(index)) {
			wish = "y";
		}

		request.setAttribute("wish", wish);
		request.setAttribute("dto", dto);
		request.setAttribute("mainUrl", "../product/productDetail.jsp");
	}
}
