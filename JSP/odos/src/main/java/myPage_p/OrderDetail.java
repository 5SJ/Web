package myPage_p;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import dao.FranchiseeDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import dto.FranchiseeDTO;
import dto.MemberDTO;
import dto.OrderDTO;

public class OrderDetail implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = session.getAttribute("id")+"";
		String oi_num = (String) request.getParameter("num");
		OrderDTO odto = new OrderDAO().detail(oi_num);
		FranchiseeDTO fdto = new FranchiseeDAO().detailForNum(odto.getOi_fid());
		
		MemberDTO mdto = new MemberDAO().detail(id);

		if(odto.getOi_info().matches("[imp].*")) {
			try {
				IamportClient ic = new IamportClient("6801043410407341", "NTknoebHso7pbzuSuxtCiQeKYZAIuLFDQ4nBM0Z6IZOEbyVrYV71D30u3fZGuDhBZGCO15liKBOh8CUN");
				IamportResponse<Payment> i = ic.paymentByImpUid(odto.getOi_info());
				Payment pay = i.getResponse();
				request.setAttribute("pay", pay);
			} catch (IamportResponseException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.setAttribute("mdto", mdto);
		request.setAttribute("odto", odto);
		request.setAttribute("fdto", fdto);
		request.setAttribute("mainUrl", "../member/myPageForm.jsp");
		request.setAttribute("myPageUrl", "../member/myPage/orderDetail.jsp");
	}
}
