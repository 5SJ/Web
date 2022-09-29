package admin;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dto.OrderDTO;

public class OrderSearch implements AdminService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<OrderDTO> list = null;
		OrderDTO odto = new OrderDTO();

		if(request.getParameter("sort")!=null) {
			String sort = request.getParameter("sort");
			if(sort.equals("all")) {
				list = new OrderDAO().listAll();
			} else {
				list = new OrderDAO().sortList(Integer.parseInt(sort));
			};
			
		} else if(request.getParameter("sch")!=null) {
			String input = request.getParameter("input");
			switch(request.getParameter("sch")) {
			case "num":
				list = new ArrayList<OrderDTO>();
				list.add(new OrderDAO().detail(input));
				break;
			case "id":
				list = new OrderDAO().list(input);
				break;
			}
		}
		
		
		Collections.reverse(list);
		
		request.setAttribute("odto", odto);
		request.setAttribute("list", list);
		request.setAttribute("content", "../adminPage/orderList.jsp");
	}
}