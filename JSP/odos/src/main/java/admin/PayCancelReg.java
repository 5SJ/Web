package admin;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

public class PayCancelReg implements AdminService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			String oi_num = new OrderDAO().getNumber(request.getParameter("imp_uid"));
			new OrderDAO().sortUpdate(oi_num, 9);
			
			IamportClient ic = new IamportClient("6801043410407341", 
					"NTknoebHso7pbzuSuxtCiQeKYZAIuLFDQ4nBM0Z6IZOEbyVrYV71D30u3fZGuDhBZGCO15liKBOh8CUN");
			int amount;
			String msg = "";
			CancelData cdata;
			
			if(request.getParameter("amount") != null) {
				amount = Integer.parseInt(request.getParameter("amount"));
				cdata = new CancelData(request.getParameter("imp_uid"), true, BigDecimal.valueOf(amount));
				msg = "미수령으로 인한 환불";
			}else {
				cdata = new CancelData(request.getParameter("imp_uid"), true);
				msg = request.getParameter("msg");
			}
			cdata.setReason(msg);
			IamportResponse<Payment> ir = ic.cancelPaymentByImpUid(cdata);
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("msg", "환불이 완료되었습니다.");
			request.setAttribute("goUrl", "PayManagement");
		} catch (Exception e) {
			e.printStackTrace();
        }
	}
}