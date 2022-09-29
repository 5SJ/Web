package ajaxService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WishlistDAO;
import dto.WishlistDTO;

public class SetWishlist implements AjaxService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		int s_index = Integer.parseInt(request.getParameter("index"));
		
		WishlistDTO dto = new WishlistDAO().detail(id);
		String res;
		
		if(dto.getWl_item().containsKey(s_index)) {
			new WishlistDAO().delete(id, s_index);
			res = "del";
		} else {
			new WishlistDAO().insert(id, s_index);
			res = "ins";
		}
		
		try {
			response.getWriter().print(res);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}