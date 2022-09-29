package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InventoryDAO;
import dao.ProductDAO;
import dto.ProductDTO;

public class ProdSetCntReg implements AdminService {
	
	// 재고 수정 Reg
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int s_index = Integer.parseInt(request.getParameter("index"));
		int s_cnt = Integer.parseInt(request.getParameter("cnt"));
		
		String i_type = "i";
		if(new ProductDAO().addCnt(s_index, s_cnt) > 0) {
			if(s_cnt < 0) {
				i_type = "o";
				s_cnt = s_cnt*-1;
			}
			new InventoryDAO().update(s_index, s_cnt, i_type);
		}
		
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		list = new ProductDAO().list();
		
		request.setAttribute("list", list);
		request.setAttribute("content", "../alert.jsp");
		request.setAttribute("msg", "수정되었습니다.");
		request.setAttribute("goUrl", "Inventory");
	}
}