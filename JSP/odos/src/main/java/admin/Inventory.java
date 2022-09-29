package admin;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InventoryDAO;
import dao.ProductDAO;
import dto.InventoryDTO;
import dto.ProductDTO;

public class Inventory implements AdminService {

	// 재고관리 페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<ProductDTO> list = new ProductDAO().list();
		String page = "1";
		String historyPage = "1";
		LocalDate now = LocalDate.now();
		String dd = now.toString();
		if(request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			page = request.getParameter("page");
		}
		
		if(request.getParameter("historyPage") != null && !request.getParameter("historyPage").equals("")) {
			historyPage = request.getParameter("historyPage");
		}
		
		if(request.getParameter("date") != null && !request.getParameter("date").equals("")) {
			dd = request.getParameter("date");
		}
		ArrayList<InventoryDTO> history = new InventoryDAO().history(dd);
		
		request.setAttribute("list", list);
		request.setAttribute("history", history);
		request.setAttribute("page", page);
		request.setAttribute("historyPage", historyPage);
		request.setAttribute("date", dd);
		request.setAttribute("content", "../adminPage/inventory.jsp");
	}
}