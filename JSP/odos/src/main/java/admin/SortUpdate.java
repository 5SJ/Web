package admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDAO;

public class SortUpdate implements AdminService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String oi_num = request.getParameter("oi_num");
		
		int oi_sort = Integer.parseInt(request.getParameter("oi_sort"));
		new OrderDAO().sortUpdate(oi_num, oi_sort);
		
		String goUrl = "OrderDetail?page="+page+"&num="+oi_num;
		if(request.getParameter("sort")!=null) {
			goUrl = "OrderDetail?sort="+request.getParameter("sort")+"&page="+page+"&num="+oi_num;
		}
		
		String msg = "접수 완료되었습니다.";
		if(oi_sort == 3) {
			msg = "상품 배송처리되었습니다.";
		}
		
		request.setAttribute("content", "../alert.jsp");
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
	}
}