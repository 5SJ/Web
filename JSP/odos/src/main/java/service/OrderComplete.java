package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FranchiseeDAO;
import dao.OrderDAO;
import dto.FranchiseeDTO;
import dto.OrderDTO;

public class OrderComplete implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String oi_num = request.getParameter("num");
		OrderDTO dto = new OrderDAO().detail(oi_num);
		FranchiseeDTO fdto = new FranchiseeDAO().detailForNum(dto.getOi_fid());
		
		request.setAttribute("fdto", fdto);
		request.setAttribute("dto", new OrderDAO().detail(oi_num));
		request.setAttribute("mainUrl", "../member/orderComplete.jsp");
	}

}
