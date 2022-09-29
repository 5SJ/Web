package admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CartDAO;
import dao.ProductDAO;
import dao.WishlistDAO;
import dto.ProductDTO;

public class ProdDeleteReg implements AdminService {
	
	// 상품 삭제 Reg
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		int index = Integer.parseInt(request.getParameter("index"));
		String path = request.getRealPath("/image/img_Product");

		ProductDTO dto = new ProductDAO().detail(index);
		
		if(dto.s_image!=null) {
			new File(path+"\\"+dto.getS_image()).delete();
		}
		
		new CartDAO().deleteAll(index);
		new WishlistDAO().deleteAll(index);
		new ProductDAO().delete(dto);
		
		request.setAttribute("content", "../alert.jsp");
		request.setAttribute("msg", "삭제되었습니다.");
		request.setAttribute("goUrl", "ProdList?page=1");
	}
}