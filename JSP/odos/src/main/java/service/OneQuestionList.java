package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User_inquiryDAO;
import dto.User_inquiryDTO;

public class OneQuestionList implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id")!=null) {
			String id = (String)session.getAttribute("id");
			int state = (int) session.getAttribute("state");
			ArrayList<User_inquiryDTO> list;
			User_inquiryDTO udto = new User_inquiryDTO();
			
			if(state == 9) {
				list = new User_inquiryDAO().listAll();
			} else {
				list = new User_inquiryDAO().list(id);
			}
			request.setAttribute("list", list);
			request.setAttribute("udto", udto);
			request.setAttribute("mainUrl", "../oneQuestion/oneQuestionList.jsp");
		} else {
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "로그인 후 이용해주세요");
			request.setAttribute("goUrl", "../main/MainPage");
		}
		
		
	}

}
