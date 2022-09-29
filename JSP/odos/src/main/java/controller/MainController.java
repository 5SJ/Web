package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dto.CategoryDTO;
import service.MainService;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main/*")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap<String, String> nonService = new HashMap<String, String>();
	ArrayList<CategoryDTO> list;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        nonService.put("Login", "../member/login.jsp");
        nonService.put("MemberJoinForm", "../member/memberJoinForm.jsp");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getRequestURI());
		String service = request.getRequestURI().substring((request.getContextPath()+"/main/").length());
		System.out.println("서비스:"+service);
		
		list = new CategoryDAO().list();
		request.setAttribute("category", list);
		
		try {
			
			if(nonService.containsKey(service)) {
				request.setAttribute("mainUrl", nonService.get(service));
			} else {
				MainService ms = (MainService)Class.forName("service."+service).newInstance();
				ms.execute(request, response);
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/template.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//response.sendRedirect("../main/ErrorPage");
		}
		/*
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("../main/ErrorPage");
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
