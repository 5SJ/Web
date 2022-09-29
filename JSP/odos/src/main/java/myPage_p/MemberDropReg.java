package myPage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dao.MemberDAO;
import dao.WishlistDAO;

public class MemberDropReg implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("회원탈퇴Reg");
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		String pw = request.getParameter("pwInput");
	
		System.out.println("회원 id :  "+ id);
		System.out.println("입력한PW : "+ pw);
		
		MemberDAO mdao = new MemberDAO();
		
		int res = mdao.login(id, pw);
		
		if(res==0) {//비밀번호 오류시
			System.out.println("비회원 로그인");
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "존재하지 않는 회원입니다.");
			request.setAttribute("goUrl", "../myPage/UserDropOut");
		}
		else {//비밀번호 일치시
			System.out.println("회원식별 성공");
			new CartDAO().deleteAll(id);
			new WishlistDAO().deleteAll(id);
			new MemberDAO().memberDrop(id);
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "탈퇴 되었습니다.");
			request.setAttribute("goUrl", "../main/LogoutReg");
		}
		
		
		
	}

}
