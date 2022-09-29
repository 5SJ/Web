package myPage_p;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

// 비밀번호 체크 후 개인정보를 수정하게 만드는 Reg class
public class MyPagePwCheckReg implements MyPageService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String check_id = request.getParameter("check_id");
		String check_pw = request.getParameter("check_pw");
	
		MemberDAO mdao = new MemberDAO();
		String res = mdao.MyPageCheck(check_id, check_pw);
		
		if (check_pw.equals(res) && !check_pw.equals("")) {
			try {
				response.sendRedirect("UserInfoChangeModify");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			/*
			 * request.setAttribute("mainUrl", "../alert.jsp"); request.setAttribute("msg",
			 * "비밀번호 맞습니다."); request.setAttribute("goUrl", "UserInfoChangeModify");
			 */
		} else {
			
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "비밀번호가 다릅니다.");
			request.setAttribute("goUrl", "UserInfoChange");
		}
		
		
		
	}
}
