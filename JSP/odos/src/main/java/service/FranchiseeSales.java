package service;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SalesDAO;

public class FranchiseeSales implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		LocalDate now = LocalDate.now();
		String dd = now.toString().substring(0, 7);
		
		ArrayList<String> monthList = new SalesDAO().monthList(dd);
		int res = new SalesDAO().fList(id, dd);

		request.setAttribute("monthList", monthList);
		request.setAttribute("total", new DecimalFormat("###,###").format(res)+"원");
		request.setAttribute("res", new DecimalFormat("###,###").format(res/10)+"원");
		request.setAttribute("mainUrl", "../franchisee/franchiseePage.jsp");
		request.setAttribute("myPageUrl", "../franchisee/franchiseeSales.jsp");
	}
}