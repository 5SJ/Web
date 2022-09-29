package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User_inquiryDAO;
import dto.User_inquiryDTO;

public class OneQuestionModifyForm implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {	
		
		int u_index = Integer.parseInt(request.getParameter("u_index"));
		User_inquiryDTO dto = new User_inquiryDAO().detail(u_index);
		
		HttpSession session = request.getSession();
		int state = (int)session.getAttribute("state");
		
		request.setAttribute("state", state);
		request.setAttribute("mainUrl", "../oneQuestion/oneQuestionModifyForm.jsp");
		request.setAttribute("dto", dto);
		
	}
}
