package ajaxService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class IdEmailChk implements AjaxService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("@@@아이디 이메일 매칭 오셨어요");
		
		String email = request.getParameter("m_email");
		MemberDAO mdao = new MemberDAO();
		
		MemberDTO dto = mdao.EmailChkForfindId(email);
		
		request.setAttribute("dto", dto);
		
		System.out.println("입력받은 아이디 : "+email);
	    System.out.println("중복확인검사 : "+dto);
		try {	
			String getId = dto.m_id;
			response.getWriter().print(getId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
