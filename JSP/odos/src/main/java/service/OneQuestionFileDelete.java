package service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Admin_boardDAO;
import dao.User_inquiryDAO;
import dto.Admin_boardDTO;
import dto.User_inquiryDTO;

public class OneQuestionFileDelete implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("/image/img_oneQue");
		int size = 1024*1024*10;
		
		try {
			MultipartRequest mr = new MultipartRequest(
					request, 
					path,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			
			
			User_inquiryDTO dto = new User_inquiryDTO();
			dto.setU_index(Integer.parseInt(mr.getParameter("u_index")));
			dto.setU_title(mr.getParameter("title"));
			dto.setU_content(mr.getParameter("u_content"));
			dto.setU_file(mr.getParameter("u_file"));
			
			int cnt = new User_inquiryDAO().fileDelete(dto);
			System.out.println("cnt : "+cnt);
			System.out.println(path + "\\" + dto.getU_file());
			String msg = "";
			if(cnt > 0) {
				new File(path + "\\" + dto.getU_file()).delete();
				msg = "파일 삭제 성공";
				dto.setU_file(null);
			}

			System.out.println("msg 파일 DeleteFile : "+msg);
			System.out.println("FileDelete 하나 : " + dto);

			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("msg", "파일이 삭제되었습니다.");
			request.setAttribute("goUrl", "OneQuestionModifyForm?u_index="+mr.getParameter("u_index")+"&page="+mr.getParameter("page"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
