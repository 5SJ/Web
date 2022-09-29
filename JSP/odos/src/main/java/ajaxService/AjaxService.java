package ajaxService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AjaxService {
	void excute(HttpServletRequest request, HttpServletResponse response);
}
