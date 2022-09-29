package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeModifyReg implements MainService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			
			String tt = "";
			
			FranchiseeDTO fdto = new FranchiseeDTO();
			FranchiseeDAO fdao = new FranchiseeDAO();
			fdto.setF_id(request.getParameter("id"));
			if(request.getParameter("pw") != null && !(request.getParameter("pw").equals(""))) {
				fdto.setF_pw(request.getParameter("pw"));
				fdao.pwUpdate(fdto);
			}
			fdto.setF_name(request.getParameter("name"));
			fdto.setF_addr(request.getParameter("addr"));
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
			fdto.setF_state(2);
			int res = fdao.update(fdto);
			
			if(res != 0) {
				request.setAttribute("msg", "입력성공");
			}else {
				request.setAttribute("msg", "입력실패");
			}
			request.setAttribute("mainUrl", "../alert.jsp");
			request.setAttribute("goUrl", "FranchiseePage");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}