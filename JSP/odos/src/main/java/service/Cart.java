package service;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dto.CartDTO;
import dto.ProductDTO;

public class Cart implements MainService {

	// 장바구니
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		LinkedHashMap<CartDTO, ProductDTO> list = new CartDAO().list(id);
		
		request.setAttribute("list", list);
		request.setAttribute("mainUrl", "../member/cart.jsp");
	}

}
