package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dto.CategoryDTO;

public class CateItemModifyReg implements AdminService {

	// 카테고리 관리페이지
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String c_name = request.getParameter("c_name");
		String [] items = request.getParameterValues("s_index");
		
		ArrayList<Integer> c_item = new ArrayList<Integer>();
		if(items!=null) {
			for(int i=0; i<items.length; i++) {
				c_item.add(Integer.parseInt(items[i]));
			}
		}
		
		CategoryDTO dto = new CategoryDTO();
		dto.setC_name(c_name);
		dto.setC_item(c_item);
		
		new CategoryDAO().modify(dto);
		
		request.setAttribute("content", "../alert.jsp");
		request.setAttribute("msg", "수정되었습니다.");
		request.setAttribute("goUrl", "CateItemModify?c_name="+c_name);
	}
}