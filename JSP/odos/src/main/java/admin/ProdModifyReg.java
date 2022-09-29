package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.CategoryDAO;
import dao.ProductDAO;
import dto.ProductDTO;

public class ProdModifyReg implements AdminService {
	
	// 상품 수정 Reg
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
			dto.setS_index(Integer.parseInt(mr.getParameter("index")));
			dto.setS_name(mr.getParameter("name"));
			dto.setS_cate(mr.getParameter("category"));
			dto.setS_price(Integer.parseInt(mr.getParameter("price")));
			dto.setS_info(mr.getParameter("info"));
			if(mr.getFilesystemName("image")==null) {
				dto.setS_image(mr.getParameter("image"));
			} else {
				dto.setS_image(mr.getFilesystemName("image"));
			}
			new ProductDAO().modify(dto);
			
			if(!mr.getParameter("before").equals(dto.s_cate)) {
				System.out.println("원래카테고리 : "+mr.getParameter("before"));
				System.out.println("바꾼카테고리 : " + dto.s_cate);
				new CategoryDAO().addItem(dto.s_cate, dto.s_index);
				new CategoryDAO().delItem(mr.getParameter("before"), dto.s_index);
			}
			
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "수정되었습니다.");
			if(mr.getParameter("cate")!=null) {
				System.out.println("카테잇다");
				request.setAttribute("goUrl", "ProdDetail?cate="+mr.getParameter("cate")+"&page="+mr.getParameter("page")+"&index="+dto.s_index);
			} else if(mr.getParameter("search")!=null) {
				System.out.println("검색이따");
				request.setAttribute("goUrl", "ProdDetail?search="+mr.getParameter("search")+"&page="+mr.getParameter("page")+"&index="+dto.s_index);
			} else {
				System.out.println("암것도없다");
				request.setAttribute("goUrl", "ProdDetail?page="+mr.getParameter("page")+"&index="+dto.s_index);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}