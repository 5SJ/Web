package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.User_inquiryDAO;
import dto.User_inquiryDTO;

public class OneQuestionModifyReg implements MainService {
	
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
			
			dto.setU_title(mr.getParameter("title"));
			dto.setU_type(Integer.parseInt(mr.getParameter("u_type")));
			
			if(mr.getParameter("u_file") != null) {
				dto.setU_file(mr.getParameter("u_file"));
			} else {
				dto.setU_file(mr.getFilesystemName("u_file"));
			}
			
			dto.setU_content(mr.getParameter("u_content"));
			dto.setU_index(Integer.parseInt(mr.getParameter("u_index")));
			
			dto.setU_id((String)session.getAttribute("id"));
			
			int res = new User_inquiryDAO().modify(dto);
			
			
			System.out.println("OneQuesModiReg dto : " + dto);
			
			String goUrl = "OneQuestionModifyReg?page="+mr.getParameter("page")+"&u_index="+dto.getU_index();

			if(res > 0){
			   goUrl = "OneQuestionDetail?page="+mr.getParameter("page")+"&u_index="+dto.getU_index();
			}

			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "수정완료");
			request.setAttribute("goUrl", goUrl);
			request.setAttribute("dto", dto);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}