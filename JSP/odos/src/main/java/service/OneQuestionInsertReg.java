package service;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.User_inquiryDAO;
import dto.User_inquiryDTO;

public class OneQuestionInsertReg implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("/image/img_oneQue");
		int size = 1024 * 1024 * 10;
		
		try {
			MultipartRequest mr = new MultipartRequest(
					  request,
					  path,
					  size,
					  "UTF-8",
			           new DefaultFileRenamePolicy()
					);
			
			User_inquiryDTO dto = new User_inquiryDTO();
			
			HttpSession session = request.getSession();

			dto.setU_content(mr.getParameter("u_content"));
			dto.setU_file(mr.getFilesystemName("u_file"));
			dto.setU_type(Integer.parseInt(mr.getParameter("u_type")));
			dto.setU_title(mr.getParameter("u_title"));
			dto.setU_id((String)session.getAttribute("id"));
			
			System.out.println(dto);
			
			int res = new User_inquiryDAO().insert(dto);
			
            System.out.println("res : "+res);
            
           //dto = new admin_boardDAO().detail(res);
		
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "입력되었습니다.");
			request.setAttribute("goUrl", "OneQuestionDetail?page=1&u_index="+res);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		
		
		
	}

}

