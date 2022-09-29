package myPage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import dao.InventoryDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dto.MemberDTO;
import dto.OrderDTO;
import service.MainService;

public class OrderCancelReg implements MyPageService {

	// 주문취소Reg
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String oi_num = (String)request.getParameter("oi_num");
		new OrderDAO().sortUpdate(oi_num, 9);
		
		// 재고 리필
		OrderDTO dto = new OrderDAO().detail(oi_num);
		for(int s_index : dto.getOi_list().keySet()) {
			new ProductDAO().addCnt(s_index, dto.getOi_list().get(s_index));
		}
		
		// 환불
		try {
			IamportClient ic = new IamportClient("6801043410407341", "NTknoebHso7pbzuSuxtCiQeKYZAIuLFDQ4nBM0Z6IZOEbyVrYV71D30u3fZGuDhBZGCO15liKBOh8CUN");
			CancelData cdata;
			cdata = new CancelData(new OrderDAO().getOrderNumber(request.getParameter("oi_num")), true);
			cdata.setReason("고객 자진 취소");
			IamportResponse<Payment> ir = ic.cancelPaymentByImpUid(cdata);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 포인트 원상복귀(적립포인트는 없음)
		if(dto.getOi_point()>0) {
			MemberDTO mdto = new MemberDTO();
			mdto.setM_id(dto.getOi_mid());
			mdto.setM_point(dto.getOi_point());
			new MemberDAO().pointModify(mdto);
		}
		// 재고 입출고 리스트 입력
		new InventoryDAO().update(new OrderDAO().getOrderNumber(request.getParameter("oi_num")));
		request.setAttribute("mainUrl", "../alert.jsp");
		request.setAttribute("msg", "주문이 취소되었습니다.");
		request.setAttribute("goUrl", "OrderDetail?page="+request.getParameter("page")+"&num="+oi_num);
	}

}
