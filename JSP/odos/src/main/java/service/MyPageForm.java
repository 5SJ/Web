package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

public class MyPageForm implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		MemberDTO mdto = new MemberDAO().detail(id);
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("mainUrl", "../member/myPageForm.jsp");
	}

}
