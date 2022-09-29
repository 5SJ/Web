package myPage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserReview implements MyPageService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserReview.execute() 진입");
		request.setAttribute("mainUrl", "../member/myPageForm.jsp");
		request.setAttribute("myPageUrl", "myPage/userReview.jsp");
	}

}
