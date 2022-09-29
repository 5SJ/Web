package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemModifyReg implements AdminService {

	// 회원정보 수정 Reg
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String status = "";
		if(request.getParameter("status")!=null) {
			status = "status="+request.getParameter("status")+"&";
		}
		
		try {
			MemberDTO dto = new MemberDTO();
			dto.setM_id(request.getParameter("m_id"));
			dto.setM_pw(request.getParameter("m_pw"));
			dto.setM_name(request.getParameter("m_name"));
			dto.setM_email(request.getParameter("m_email"));
			dto.setM_addr(request.getParameter("m_addr"));
			dto.setM_point(Integer.parseInt(request.getParameter("m_point")));
			dto.setM_state(Integer.parseInt(request.getParameter("m_state")));
			
			new MemberDAO().modify(dto);
			
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "수정되었습니다.");
			request.setAttribute("goUrl", "MemDetail?"+status+"type="+request.getParameter("type")+"&page="+request.getParameter("page")+"&m_id="+dto.m_id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}