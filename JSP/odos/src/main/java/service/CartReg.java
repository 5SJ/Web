package service;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.ProductDAO;
import dto.CartDTO;
import dto.ProductDTO;

public class CartReg implements MainService {

	// 장바구니 수량변경
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int index = Integer.parseInt(request.getParameter("index"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));

		CartDTO dto = new CartDTO();
		dto.setCl_id(id);
		dto.setCl_item(index);
		dto.setCl_cnt(cnt);
		
		new CartDAO().addCnt(dto);
		
		LinkedHashMap<CartDTO, ProductDTO> list = new CartDAO().list(id);
		request.setAttribute("list", list);
		request.setAttribute("mainUrl", "../member/cart.jsp");
	}

}
