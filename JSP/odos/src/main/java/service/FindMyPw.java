package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FindMyPw implements MainService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("FindMyPw 자바파일에 들어는 왔네요");
		request.setAttribute("mainUrl", "../member/findMyPw.jsp");
		
	}
}
