package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PwChk implements MainService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("mainUrl", "../franchisee/franchiseePage.jsp");
		request.setAttribute("myPageUrl", "../franchisee/pwChk.jsp");
	}
}