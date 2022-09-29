package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeModify implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		FranchiseeDTO fdto = new FranchiseeDAO().detail((String)session.getAttribute("id"));
		
		request.setAttribute("dto", fdto);
		request.setAttribute("mainUrl", "../franchisee/franchiseePage.jsp");
		request.setAttribute("myPageUrl", "../franchisee/franchiseeModify.jsp");
	}

}
