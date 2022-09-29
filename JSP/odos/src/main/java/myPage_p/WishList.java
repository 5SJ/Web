package myPage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.WishlistDAO;
import dto.MemberDTO;
import dto.WishlistDTO;

public class WishList implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		WishlistDTO dto = new WishlistDAO().detail(id);
		MemberDTO mdto = new MemberDAO().detail(id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("mdto", mdto);
		request.setAttribute("mainUrl", "../member/myPageForm.jsp");
		request.setAttribute("myPageUrl", "myPage/wishList.jsp");
	}

}
