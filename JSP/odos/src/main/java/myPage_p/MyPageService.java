package myPage_p;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MyPageService {

	void execute(HttpServletRequest request, HttpServletResponse response);
}
