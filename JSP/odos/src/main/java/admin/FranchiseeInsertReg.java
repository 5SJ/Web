package admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeInsertReg implements AdminService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("addr"));
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameterValues("number"));
		System.out.println(request.getParameterValues("day"));
		System.out.println(request.getParameterValues("start_time"));
		System.out.println(request.getParameterValues("end_time"));
		
		String tt = "";
		
		FranchiseeDTO fdto = new FranchiseeDTO();
		fdto.setF_id(request.getParameter("id"));
		fdto.setF_pw(request.getParameter("id"));
		fdto.setF_name(request.getParameter("name"));
		fdto.setF_addr(request.getParameter("addr"));
		fdto.setF_email(request.getParameter("email"));
		tt = "";
		for(int i = 0; i<request.getParameterValues("number").length; i++){
			tt += request.getParameterValues("number")[i];
			if(i<request.getParameterValues("number").length-1) {
				tt += "-";
			}
		}
		System.out.println("tt : "+tt);
		fdto.setF_phone(tt);
		tt = "";
		for(int i = 0; i<request.getParameterValues("day").length; i++){
			tt += request.getParameterValues("day")[i];
			if(i<request.getParameterValues("day").length-1) {
				tt += "/";
			}
		}
		fdto.setF_day(tt);
		tt = "";
		for(int i = 0; i<request.getParameterValues("start_time").length; i++){
			tt += request.getParameterValues("start_time")[i]+"~"+request.getParameterValues("end_time")[i];
			if(i<request.getParameterValues("start_time").length-1) {
				tt += "/";
			}
		}
		fdto.setF_time(tt);
		fdto.setF_info(request.getParameter("info"));
		System.out.println(fdto);
		
		int res = new FranchiseeDAO().insert(fdto);
		
		if(res == 1) {
			request.setAttribute("msg", "입력성공");
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("goUrl", "FranchiseeList");
		}else {
			request.setAttribute("msg", "입력실패");
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("goUrl", "FranchiseeInsertForm");
		}
	}
}