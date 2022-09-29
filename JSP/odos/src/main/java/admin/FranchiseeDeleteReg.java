package admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class FranchiseeDeleteReg implements AdminService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String[] id = request.getParameterValues("id");
		int res = new FranchiseeDAO().delete(id);
		
		if(res == id.length) {
			request.setAttribute("msg", "처리되었습니다.");
		}else {
			request.setAttribute("msg", "다시 시도해주세요.");
		}
		request.setAttribute("content", "../alert.jsp");
		request.setAttribute("goUrl", "FranchiseeList");
	}
}