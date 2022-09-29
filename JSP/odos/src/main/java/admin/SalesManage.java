package admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FranchiseeDAO;
import dao.ProductDAO;
import dto.FranchiseeDTO;
import dto.ProductDTO;

public class SalesManage implements AdminService {

	// 매출 관리
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<ProductDTO> plist = new ProductDAO().list();
		ArrayList<FranchiseeDTO> flist = new FranchiseeDAO().list();
		
		request.setAttribute("plist", plist);
		request.setAttribute("flist", flist);
		request.setAttribute("content", "../adminPage/salesManage.jsp");
	}
}