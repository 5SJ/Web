package service;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.FranchiseeDAO;
import dao.MemberDAO;
import dto.CartDTO;
import dto.FranchiseeDTO;
import dto.MemberDTO;
import dto.ProductDTO;

public class Order implements MainService {

	// 주문하기
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		LinkedHashMap<CartDTO, ProductDTO> clist = new CartDAO().list(id);
		
		MemberDTO dto = new MemberDAO().detail(id);
		ArrayList<FranchiseeDTO> flist = new FranchiseeDAO().list();
		
		request.setAttribute("clist", clist);
		request.setAttribute("dto", dto);
		request.setAttribute("flist", flist);
		request.setAttribute("mainUrl", "../member/order.jsp");
		
		// 재고부족시
		for(CartDTO key : clist.keySet()) {
			if(key.getCl_cnt() > clist.get(key).s_cnt) {
				request.setAttribute("mainUrl", "../alert.jsp");
				request.setAttribute("msg", clist.get(key).s_name + "의 주문수량이 재고보다 많습니다.\\n" + clist.get(key).s_cnt + "개 까지 주문이 가능합니다.");
				request.setAttribute("goUrl", "../main/Cart");
				if(clist.get(key).s_cnt <= 0) {
					request.setAttribute("msg", clist.get(key).s_name + "은(는) 품절된 상품입니다.");	
				}
			}
		}
		
	}

}
