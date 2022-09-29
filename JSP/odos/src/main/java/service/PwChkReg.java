package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FranchiseeDAO;

public class PwChkReg implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String pw = request.getParameter("check_pw");
		if(pw.equals(new FranchiseeDAO().pwChk((String)session.getAttribute("id")))) {
			try {
				response.sendRedirect("FranchiseeModify");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			request.setAttribute("msg", "비밀번호가 틀렸습니다.");
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("goUrl", "PwChk");
		}
	}
}