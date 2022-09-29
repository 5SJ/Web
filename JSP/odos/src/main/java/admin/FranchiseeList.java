package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeList implements AdminService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<FranchiseeDTO> list = new ArrayList<FranchiseeDTO>();
		int page = 1;
		if(request.getParameter("page") != null && request.getParameter("page").equals("")) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		list = new FranchiseeDAO().list();
		
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.setAttribute("content", "../adminPage/franchiseeList.jsp");
	}
}
