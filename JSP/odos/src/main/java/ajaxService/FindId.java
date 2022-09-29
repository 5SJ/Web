package ajaxService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class FindId implements AjaxService{
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("FindId 자바파일에 오신 걸 환영합니다.");
		String email = request.getParameter("m_email");
		
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO dto = mdao.EmailChkForfindId(email);
		
		request.setAttribute("mdto", dto);
	
		
		try {	
			String c = dto.m_id;
			response.getWriter().print(c);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
