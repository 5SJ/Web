package ajaxService;

import java.io.IOException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.SalesDAO;

public class Fsales implements AjaxService {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String id = session.getAttribute("id")+"";
			String dd = request.getParameter("date");
			
			int res = new SalesDAO().fList(id, dd);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("total", new DecimalFormat("###,###").format(res)+"원");
			map.put("res", new DecimalFormat("###,###").format(res/10)+"원");
			Gson json = new Gson();
			String obj = json.toJson(map);
			
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(obj);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
