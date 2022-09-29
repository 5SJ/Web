package ajaxService;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.FranchiseeDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dto.FranchiseeDTO;
import dto.OrderDTO;

public class GetList implements AjaxService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		FranchiseeDTO fdto = new FranchiseeDAO().detail(id);
		ArrayList<OrderDTO> odto = new OrderDAO().franList(fdto.getF_index(), request.getParameter("date"));
		String res = "";
		if(odto.size() != 0) {
			for(OrderDTO dto : odto) {
				res += "<tr class='css-141m64i'>"
						+ "<td class='css-44wg63'>"+dto.getOi_num()+"</td>"
						+ "<td class='css-44wg63'>"+dto.getOi_date()+"</td>"
						+ "<td class='css-44wg63'>"+dto.getOi_mid()+"</td>"
						+ "<td class='css-44wg63'>"+dto.getM_name()+"</td>"
						+ "<td class='css-44wg63'>";
						for(int key : dto.getOi_list().keySet()) {
							res += new ProductDAO().detail(key).s_name + " " + dto.getOi_list().get(key) + "ea<br/>";
						}
						res += "</td>"
						+ "<td class='css-44wg63'>"+new DecimalFormat("###,###").format(dto.getOi_total())+"원</td>"
						+ "<td class='css-44wg63'>";
				res += dto.getOi_sortStr();
				if(dto.getOi_sort() == 3) {
					res += "<br><input type='button' value='상품 수령' onclick='chk(\""+dto.getOi_num()+"\",\"4\")'>";
				}else if(dto.getOi_sort() == 4) {
					res += "<br><input type='button' value='수령 확인' onclick='chk(\""+dto.getOi_num()+"\",\"5\")'>";
				}else {}
			}
			res += "</td></tr>";
		}else {
			res += "<tr><td colspan='5' style='text-align: center;'>주문내역이 없습니다.</td></tr>";
		}
		
		try {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(res);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}