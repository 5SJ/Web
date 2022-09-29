package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_inquiryDAO;
import dto.User_inquiryDTO;


public class OneQuestionAnswerForm implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {	
		int u_index = Integer.parseInt(request.getParameter("u_index"));
		
		User_inquiryDAO dao = new User_inquiryDAO();
		User_inquiryDTO dto = dao.detail(u_index);
		
		request.setAttribute("mainUrl", "../oneQuestion/oneQuestionAnswerForm.jsp");
		request.setAttribute("dto", dto);
	}
}
