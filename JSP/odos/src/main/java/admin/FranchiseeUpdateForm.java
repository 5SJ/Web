package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeUpdateForm implements AdminService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String f_id = request.getParameter("f_id");
		FranchiseeDTO fdto = new FranchiseeDAO().detail(f_id);
		request.setAttribute("dto", fdto);
		request.setAttribute("content", "../adminPage/franchiseeUpdateForm.jsp");
	}
}
