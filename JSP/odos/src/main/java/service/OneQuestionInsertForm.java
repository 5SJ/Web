package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

public class OneQuestionInsertForm implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		int state = (int)session.getAttribute("state");
		
		request.setAttribute("state", state);
		request.setAttribute("mainUrl", "../oneQuestion/oneQuestionInsertForm.jsp");
	}
}
