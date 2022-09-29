package service;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.FranchiseeDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dto.CartDTO;
import dto.FranchiseeDTO;
import dto.MemberDTO;
import dto.OrderDTO;
import dto.ProductDTO;

public class OrderComp implements MainService {

	// 주문완료화면
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String f_name = request.getParameter("name");
		String oi_info = request.getParameter("info");
		int point = Integer.parseInt(request.getParameter("point"));
		LinkedHashMap<Integer, Integer> oi_list = new LinkedHashMap<Integer, Integer>();
		
		for(Object key : new CartDAO().list(id).keySet()) {
			CartDTO cart = (CartDTO)key;
			oi_list.put(cart.getCl_item(), cart.getCl_cnt());
			new ProductDAO().addCnt(cart.getCl_item(), -cart.getCl_cnt());
		}
		
		FranchiseeDTO fdto = new FranchiseeDAO().detail(f_name);
		
		OrderDTO dto = new OrderDTO();
		dto.setOi_mid(id);
		dto.setOi_info(oi_info);
		dto.setOi_fid(fdto.getF_index());
		dto.setOi_list(oi_list);
		dto.setOi_point(point);

		new OrderDAO().insert(dto);
		new CartDAO().deleteAll(id);
		
		MemberDTO mdto = new MemberDTO();
		mdto.setM_id(id);
		if(point>0) {
			mdto.setM_point(-point);
			new MemberDAO().pointModify(mdto);
		}
		
		request.setAttribute("fdto", fdto);
		request.setAttribute("dto", new OrderDAO().detail(dto.getOi_num()));
		request.setAttribute("mainUrl", "../member/orderComplete.jsp");
	}

}
