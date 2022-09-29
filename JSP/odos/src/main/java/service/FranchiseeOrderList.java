package service;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FranchiseeDAO;
import dao.OrderDAO;
import dto.FranchiseeDTO;
import dto.OrderDTO;

public class FranchiseeOrderList implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		FranchiseeDTO fdto = new FranchiseeDAO().detail(id);
		
		LocalDate now = LocalDate.now();
		String dd = now.toString();
		ArrayList<OrderDTO> odto = new OrderDAO().franList(fdto.getF_index(), dd);
		
		request.setAttribute("odto", odto);
		request.setAttribute("mainUrl", "../franchisee/franchiseePage.jsp");
		request.setAttribute("myPageUrl", "../franchisee/franchiseeOrderList.jsp");
		
	}

}
