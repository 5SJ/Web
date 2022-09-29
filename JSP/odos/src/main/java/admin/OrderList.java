package admin;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dto.OrderDTO;

public class OrderList implements AdminService {

	// 주문관리 페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<OrderDTO> list = new OrderDAO().listAll();
		Collections.reverse(list);
		OrderDTO odto = new OrderDTO();
		
		request.setAttribute("odto", odto);
		request.setAttribute("list", list);
		request.setAttribute("content", "../adminPage/orderList.jsp");
	}
}