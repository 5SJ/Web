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

public class UserPoint implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		MemberDTO mdto = new MemberDAO().detail(id);
		
		ArrayList<OrderDTO> list = new OrderDAO().list(id);
		Collections.reverse(list);
		
		request.setAttribute("list", list);
		request.setAttribute("mdto", mdto);
		request.setAttribute("mainUrl", "../member/myPageForm.jsp");
		request.setAttribute("myPageUrl", "myPage/userPoint.jsp");
	}

}
