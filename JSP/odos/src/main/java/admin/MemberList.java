package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberList implements AdminService {

	// 회원관리 페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		String status = request.getParameter("status");
		String sort = request.getParameter("sort");
		String keyword = request.getParameter("keyword");
		ArrayList<MemberDTO> list = null;
		String sql = null;
		if(type == null) {
			type = "1";
		}
		if(status == null || status.equals("")) {
			switch (type) {
			case "1": {
				sql = "select * from member_management where (m_state = 1 || m_state = 3 || m_state = 4)";
				if(sort != null && keyword != null) {
					sql += " && "+sort+" like '%"+keyword+"%'";
				}
				break;
			}
			case "2": {
				sql = "select * from member_management where (m_state = 2 || m_state = 5)";
				if(sort != null && keyword != null) {
					sql += " && "+sort+" like '%"+keyword+"%'";
				}
				break;
			}
			default:
				break;
			}
		}else {
			sql = "select * from member_management where m_state = "+status;
			if(sort != null && keyword != null) {
				sql += " && "+sort+" like '%"+keyword+"%'";
			}
		}
		System.out.println("sql : "+sql);
		sql += " order by m_date desc";
		list = new MemberDAO().list(sql);
		request.setAttribute("list", list);
		request.setAttribute("type", type);
		request.setAttribute("status", status);
		request.setAttribute("content", "../adminPage/memberList.jsp");
	}
}