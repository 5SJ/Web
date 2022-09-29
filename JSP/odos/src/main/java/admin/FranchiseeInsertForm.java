package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeInsertForm implements AdminService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("f_id", new FranchiseeDAO().getId());
		request.setAttribute("content", "../adminPage/franchiseeInsertForm.jsp");
	}
}
