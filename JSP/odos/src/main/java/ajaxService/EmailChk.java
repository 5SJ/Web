package ajaxService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class EmailChk implements AjaxService{
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {

		String m_email = request.getParameter("m_email");   // userInfohangeModify에서 새로 작성한 email 주소입니다.
		String hidde_email = request.getParameter("hidden_email");   // hidden_email = 원래 작성되어있던 이메일
		MemberDAO mdao = new MemberDAO();

		String email_res = mdao.emailChk(m_email);

		try {
			// 내가 입력한 이메일과 똑같은 이메일이라면
			if (m_email.equals(hidde_email)) {
				email_res = "emailEmpty";
				// email의 결과와 email을 보냈다.
				response.getWriter().append(email_res);
			} else {
				response.getWriter().append(email_res);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}