package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemDeleteReg implements AdminService {

	// 관리자 회원 삭제 Reg
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("m_id");
		new MemberDAO().adminDelete(id);
		
		request.setAttribute("content", "../alert.jsp");
		request.setAttribute("msg", "삭제 되었습니다.");
		request.setAttribute("goUrl", "MemberList?type=1&page=1");
	}
}