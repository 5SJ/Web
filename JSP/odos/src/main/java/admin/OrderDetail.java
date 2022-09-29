package admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import dao.FranchiseeDAO;
import dao.OrderDAO;
import dto.FranchiseeDTO;
import dto.OrderDTO;

public class OrderDetail implements AdminService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String oi_num = request.getParameter("num");
		OrderDTO dto = new OrderDAO().detail(oi_num);
		FranchiseeDTO fdto = new FranchiseeDAO().detailForNum(dto.getOi_fid());
		
		if(dto.getOi_info().matches("[imp].*")) {
			IamportClient ic = new IamportClient("6801043410407341", "NTknoebHso7pbzuSuxtCiQeKYZAIuLFDQ4nBM0Z6IZOEbyVrYV71D30u3fZGuDhBZGCO15liKBOh8CUN");
			IamportResponse<Payment> i = null;
			try {
				i = ic.paymentByImpUid(dto.getOi_info());
			} catch (IamportResponseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Payment pay = i.getResponse();
			request.setAttribute("pay", pay);
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("fdto", fdto);
		request.setAttribute("content", "../adminPage/orderDetail.jsp");
	}
}