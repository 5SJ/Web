package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewMakePw implements MainService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("NewMakePw에 들어오신 걸 환영합니다.");
		request.setAttribute("mainUrl", "../member/newMakePw.jsp");
	}
}
