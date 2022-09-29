package ajaxService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDAO;
import dto.CartDTO;

public class Cart implements AjaxService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		int index = Integer.parseInt(request.getParameter("index"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));

		CartDTO dto = new CartDTO();
		dto.setCl_id(id);
		dto.setCl_item(index);
		dto.setCl_cnt(cnt);
		
		if(new CartDAO().detail(id, index) == null) {
			new CartDAO().insert(dto);
		} else {
			new CartDAO().addCnt(dto);
		}
		
	}
}