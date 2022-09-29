package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemDetail implements AdminService {

	// 회원 상세정보
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String m_id = request.getParameter("m_id");
		MemberDTO dto = new MemberDAO().detail(m_id);
		String type = request.getParameter("type");
		if(request.getParameter("type").equals("") || request.getParameter("type") == null) {
			type = "1";
		}
		request.setAttribute("type", type);
		request.setAttribute("dto", dto);
		request.setAttribute("content", "../adminPage/memberDetail.jsp");
	}
}