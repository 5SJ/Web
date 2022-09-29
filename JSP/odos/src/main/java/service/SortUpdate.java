package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.OrderDAO;
import dto.MemberDTO;
import dto.OrderDTO;

public class SortUpdate implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String oi_num = request.getParameter("oi_num");
		int oi_sort = Integer.parseInt(request.getParameter("oi_sort"));
		
		new OrderDAO().sortUpdate(oi_num, oi_sort);
		
		if(oi_sort == 5) {
			OrderDTO odto = new OrderDAO().detail(oi_num);
			MemberDTO mdto = new MemberDTO();
			mdto.setM_id(odto.getOi_mid());
			int getPoint = (int) ((odto.getOi_total()-odto.getOi_point())*0.05);
			mdto.setM_point(getPoint);
			new MemberDAO().pointModify(mdto);
		}
		
		try {
			response.sendRedirect("FranchiseeOrderList");
		} catch (IOException e) {
		}
	}
}