package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Admin_boardDAO;
import dao.ProductDAO;
import dto.Admin_boardDTO;
import dto.ProductDTO;

public class LogoutReg implements MainService {

	// 로그아웃
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("state");
		
		ArrayList<Admin_boardDTO> banner = new Admin_boardDAO().Banner();
		ArrayList<ProductDTO> best = new ProductDAO().bestList();
		
		request.setAttribute("banner", banner);
		request.setAttribute("best", best);
		request.setAttribute("mainUrl", "main_body.jsp");
	}

}
