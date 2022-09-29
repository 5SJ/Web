package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.ProductDTO;

public class ProdInsertReg implements AdminService {
	
	// 상품 추가 Reg
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("/image/img_Product");
		int size = 1024*1024*10;
		
		try {
			MultipartRequest mr = new MultipartRequest(
					request, 
					path, 
					size, 
					"UTF-8",
					new DefaultFileRenamePolicy());

			ProductDTO dto = new ProductDTO();
			dto.setS_name(mr.getParameter("name"));
			dto.setS_cate(mr.getParameter("category"));
			dto.setS_price(Integer.parseInt(mr.getParameter("price")));
			dto.setS_info(mr.getParameter("info"));
			dto.setS_image(mr.getFilesystemName("image"));
			
			new ProductDAO().insert(dto);
			new CategoryDAO().addItem(dto.s_cate, dto.s_index);
			new CategoryDAO().addItem("new", dto.s_index);
			
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "입력되었습니다.");
			request.setAttribute("goUrl", "ProdDetail?page=1&index="+dto.s_index);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}