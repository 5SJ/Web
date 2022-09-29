package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.User_inquiryDAO;
import dto.User_inquiryDTO;

public class OneQuestionAnswerReg implements MainService {
		
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		String path = request.getRealPath("/image/img_oneQue");
		int size = 1024*1024 *10;
		try {
			MultipartRequest mr = new MultipartRequest(
					request, 
					path, 
					size, 
					"UTF-8",
					new DefaultFileRenamePolicy());

			User_inquiryDTO dto = new User_inquiryDTO();
			
			HttpSession session = request.getSession();
			
			
			dto.setU_state(Integer.parseInt(mr.getParameter("u_state")));		
			dto.setU_recontent(mr.getParameter("u_recontentArea"));
			dto.setU_index(Integer.parseInt(mr.getParameter("u_index")));
			
			//dto.setU_state((int)session.getAttribute("u_state"));
			dto.setU_id((String)session.getAttribute("id"));
			
			int res = new User_inquiryDAO().answer(dto);
			String goUrl = "OneQuestionAnswerReg?page="+mr.getParameter("page")+"&u_index="+dto.getU_index();
			
			if(res>0) {
				goUrl = "OneQuestionDetail?page="+mr.getParameter("page")+"&u_index="+dto.getU_index();
			}
			
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "답변완료");
			request.setAttribute("goUrl", goUrl);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}