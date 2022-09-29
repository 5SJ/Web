package myPage_p;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.OrderDAO;
import dto.MemberDTO;
import dto.OrderDTO;

public class OrderList implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		
		ArrayList<OrderDTO> odto = new OrderDAO().list(id);
		Collections.reverse(odto);
		MemberDTO mdto = new MemberDAO().detail(id);
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("odto", odto);
		request.setAttribute("mainUrl", "../member/myPageForm.jsp");
		request.setAttribute("myPageUrl", "../member/myPage/orderList.jsp");
		
	}

}
