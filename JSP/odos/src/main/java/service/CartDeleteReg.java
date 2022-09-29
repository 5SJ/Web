package service;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.ProductDAO;
import dto.CartDTO;
import dto.ProductDTO;

public class CartDeleteReg implements MainService {

	// 장바구니 상품삭제
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int index = Integer.parseInt(request.getParameter("index"));

		CartDTO dto = new CartDTO();
		dto.setCl_id(id);
		dto.setCl_item(index);
		new CartDAO().delete(dto);
		
		LinkedHashMap<CartDTO, ProductDTO> list = new CartDAO().list(id);
		
		request.setAttribute("list", list);
		request.setAttribute("mainUrl", "../member/cart.jsp");
	}

}
