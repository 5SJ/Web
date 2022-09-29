package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.CategoryDTO;
import dto.ProductDTO;

public class CateDeleteReg implements AdminService {

	// 카테고리 삭제 Reg
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String cate = request.getParameter("c_name");
		boolean exist = false;
		
		ArrayList<ProductDTO> list = new ProductDAO().list();	// 카테고리 내 상품이 존재하는지 확인
		for(ProductDTO dto : list) {
			if(dto.s_cate.equals(cate)) {
				exist = true;
			}
		}
		
		if(!exist) {
			CategoryDTO dto = new CategoryDTO();
			dto.setC_name(cate);
			new CategoryDAO().delete(dto);
			
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "삭제되었습니다.");
			request.setAttribute("goUrl", "CateList");
		} else {
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "카테고리 내 상품이 존재하므로 삭제할 수 없습니다.");
			request.setAttribute("goUrl", "CateList");
		}
	}

}
