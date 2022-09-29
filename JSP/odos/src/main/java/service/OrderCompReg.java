package service;

import java.io.IOException;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;

import dao.CartDAO;
import dao.FranchiseeDAO;
import dao.InventoryDAO;
import dao.MemberDAO;
import dao.OrderDAO;
import dao.ProductDAO;
import dto.CartDTO;
import dto.FranchiseeDTO;
import dto.MemberDTO;
import dto.OrderDTO;
import dto.ProductDTO;

public class OrderCompReg implements MainService {

	// 주문완료화면
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String f_name = request.getParameter("name");
		String oi_info = request.getParameter("imp_uid");
		int point = Integer.parseInt(request.getParameter("point"));
		LinkedHashMap<Integer, Integer> oi_list = new LinkedHashMap<Integer, Integer>();
		String msg = "";
		FranchiseeDTO fdto = new FranchiseeDAO().detail(f_name);
		IamportClient ic = new IamportClient("6801043410407341", "NTknoebHso7pbzuSuxtCiQeKYZAIuLFDQ4nBM0Z6IZOEbyVrYV71D30u3fZGuDhBZGCO15liKBOh8CUN");
		try {
			Payment p = ic.paymentByImpUid(oi_info).getResponse();
			if(p.getStatus().equals("paid")) {
				// 주문내역 DB 추가
				OrderDTO dto = new OrderDTO();
				for(Object key : new CartDAO().list(id).keySet()) {
					CartDTO cart = (CartDTO)key;
					oi_list.put(cart.getCl_item(), cart.getCl_cnt());
					
					// 재고 수정
					new ProductDAO().addCnt(cart.getCl_item(), -cart.getCl_cnt());
					
					new InventoryDAO().update(cart.getCl_item(), cart.getCl_cnt(), "o");
				}
				dto.setOi_list(oi_list);
				dto.setOi_mid(id);
				dto.setOi_info(oi_info);
				dto.setOi_fid(fdto.getF_index());
				dto.setOi_point(point);
				new OrderDAO().insert(dto);

				// 장바구니 비우기
				new CartDAO().deleteAll(id);
				
				// 포인트 사용시 포인트 수정
				if(point>0) {
					MemberDTO mdto = new MemberDTO();
					mdto.setM_id(id);
					mdto.setM_point(-point);
					new MemberDAO().pointModify(mdto);
				}
				msg = "결제가 완료되었습니다.";
				request.setAttribute("goUrl", "OrderComplete?num="+dto.getOi_num());
			}else {
				msg = "결제를 다시 시도해주세요.";
				request.setAttribute("goUrl", "Order");
			}
		} catch (IamportResponseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("mainUrl", "../alert.jsp");
		request.setAttribute("msg", msg);
	}
}