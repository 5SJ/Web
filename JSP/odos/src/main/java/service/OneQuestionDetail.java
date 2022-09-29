package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_inquiryDAO;
import dto.User_inquiryDTO;

public class OneQuestionDetail implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		User_inquiryDAO dao = new User_inquiryDAO();
		User_inquiryDTO dto = dao.detail((Integer.parseInt(request.getParameter("u_index"))));
		
		if(dto.getU_recontent() == null ){
			new User_inquiryDAO().answerModi(Integer.parseInt(request.getParameter("u_index")));	
		}
		
		System.out.println("OneQuestionDeatilForm dto : " + dto);

		request.setAttribute("dto", dto);
		request.setAttribute("mainUrl", "../oneQuestion/oneQuestionDetail.jsp");
		
	}

}
