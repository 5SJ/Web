package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Admin_boardDAO;
import dao.User_inquiryDAO;
import dto.User_inquiryDTO;

public class OneQuestionListFilterReg implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int u_type = Integer.parseInt(request.getParameter("u_type"));
		ArrayList<User_inquiryDTO> list = new User_inquiryDAO().listFilter(u_type);
		User_inquiryDTO udto = new User_inquiryDTO();
		
		request.setAttribute("list", list);
		request.setAttribute("udto", udto);
		request.setAttribute("mainUrl", "../oneQuestion/oneQuestionList.jsp");
		
	}

}
