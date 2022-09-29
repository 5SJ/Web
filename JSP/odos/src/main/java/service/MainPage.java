package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_boardDAO;
import dao.ProductDAO;
import dto.Admin_boardDTO;
import dto.ProductDTO;

public class MainPage implements MainService {

	// 메인페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		ArrayList<Admin_boardDTO> banner = new Admin_boardDAO().Banner();
		ArrayList<ProductDTO> best = new ProductDAO().bestList();
		
		request.setAttribute("best", best);
		request.setAttribute("banner", banner);
		request.setAttribute("mainUrl", "main_body.jsp");
	}

}
