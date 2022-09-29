package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardInsertForm implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int type = Integer.parseInt(request.getParameter("type"));
		request.setAttribute("type", type);
		request.setAttribute("mainUrl", "../board/boardInsertForm.jsp");
	}

}
