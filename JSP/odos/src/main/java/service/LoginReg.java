package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Admin_boardDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import dto.Admin_boardDTO;
import dto.ProductDTO;

public class LoginReg implements MainService {

	// 로그인 Reg
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("pid"));
		System.out.println(request.getParameter("pw"));
		
		String id = request.getParameter("pid");
		String pw = request.getParameter("pw");
		
		HttpSession session;
		
		MemberDAO mdao = new MemberDAO();
		int res = mdao.login(id, pw);
		if(res == 0) {
			System.out.println("비회원 로그인");
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "존재하지 않는 회원입니다.");
			request.setAttribute("goUrl", "Login");
		}else if(res == 3) {
			System.out.println("탈퇴 로그인");
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "탈퇴한 회원입니다.");
			request.setAttribute("goUrl", "Login");
		}else if(res == 4) {
	         System.out.println("정지 로그인");
	         
	         session = request.getSession();
	         session.setAttribute("id", id);
	         session.setAttribute("state", res);
	         
	         request.setAttribute("mainUrl", "../alert.jsp");
	         request.setAttribute("msg", "정지된 회원입니다.");
	         request.setAttribute("goUrl", "MainPage");
		}else if(res == 5) {
			System.out.println("가맹탈퇴 로그인");
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "존재하지 않는 가맹점입니다.");
			request.setAttribute("goUrl", "Login");
		} else {
			System.out.println("로그인 성공");
			session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("state", res);
			
			ArrayList<Admin_boardDTO> banner = new Admin_boardDAO().Banner();
			ArrayList<ProductDTO> best = new ProductDAO().bestList();
			
			request.setAttribute("banner", banner);
			request.setAttribute("best", best);
			request.setAttribute("mainUrl", "main_body.jsp");
		}
		
	}
}