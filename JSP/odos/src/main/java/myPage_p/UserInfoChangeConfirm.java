package myPage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

public class UserInfoChangeConfirm implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		MemberDTO dto = new MemberDAO().detail(id);
		
		request.setAttribute("mdto", dto);
		request.setAttribute("mainUrl", "../member/myPageForm.jsp"); 
		request.setAttribute("myPageUrl", "myPage/userInfoChangeConfirm.jsp");
	}

}
