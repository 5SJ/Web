package admin;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.CategoryDTO;
import dto.ProductDTO;

public class ImageDeleteReg implements AdminService {

	// 상품정보 - 사진 삭제 Reg
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int index = Integer.parseInt(request.getParameter("index"));
		ProductDTO dto = new ProductDAO().detail(index);
		String path = request.getRealPath("/image/img_Product");
		
		new File(path+"\\"+dto.getS_image()).delete();
		new ProductDAO().imageDelete(dto);
		
		ArrayList<CategoryDTO> list = new CategoryDAO().list();
		
		request.setAttribute("dto", dto);
		request.setAttribute("category", list);
		request.setAttribute("content", "../adminPage/productModify.jsp");
	}

}
