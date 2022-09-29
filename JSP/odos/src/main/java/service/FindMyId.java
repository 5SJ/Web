package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindMyId implements MainService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("FindMyId 자바파일에 들어는 왔네요");
		request.setAttribute("mainUrl", "../member/findMyId.jsp");
		
	}
}
