package myPage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

public class UserDropOut implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("회원탈퇴 진입");
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		MemberDTO mdto = new MemberDAO().detail(id);
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("mainUrl", "../member/myPageForm.jsp");
		request.setAttribute("myPageUrl", "myPage/userDropOut.jsp");
	}

}
