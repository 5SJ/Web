package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dto.CategoryDTO;

public class CateInsertReg implements AdminService {

	// 카테고리 추가 Reg
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String cate = request.getParameter("name");
		CategoryDTO dto = new CategoryDTO();
		boolean exist = false;
		dto.setC_name(cate);
		
		ArrayList<CategoryDTO> list = new CategoryDAO().list();	// 카테고리 존재여부 확인
		for(CategoryDTO cdto : list) {
			if(cdto.getC_name().equals(cate)) {
				exist = true;
			}
		}
		
		if(!exist) {
			new CategoryDAO().insert(dto);
			
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "입력되었습니다.");
			request.setAttribute("goUrl", "CateList");
		} else {
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "카테고리가 이미 존재합니다.");
			request.setAttribute("goUrl", "CateList");
		}
	}

}
