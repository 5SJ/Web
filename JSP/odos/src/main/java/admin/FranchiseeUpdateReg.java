package admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeUpdateReg implements AdminService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String tt = "";
		
		FranchiseeDTO fdto = new FranchiseeDTO();
		fdto.setF_id(request.getParameter("id"));
		fdto.setF_name(request.getParameter("name"));
		fdto.setF_addr(request.getParameter("addr"));
		tt = "";
		for(int i = 0; i<request.getParameterValues("number").length; i++){
			tt += request.getParameterValues("number")[i];
			if(i<request.getParameterValues("number").length-1) {
				tt += "-";
			}
		}
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
		fdto.setF_state(2);
		
		int res = new FranchiseeDAO().update(fdto);
		
		if(res != 0) {
			request.setAttribute("msg", "입력성공");
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("goUrl", "FranchiseeUpdateForm?page="+request.getParameter("page")+"&f_id="+request.getParameter("id"));
		}else {
			request.setAttribute("msg", "입력실패");
			request.setAttribute("content", "../alert.jsp");
			request.setAttribute("goUrl", "FranchiseeUpdateForm?page="+request.getParameter("page")+"&f_id="+request.getParameter("id"));
		}
	}
}