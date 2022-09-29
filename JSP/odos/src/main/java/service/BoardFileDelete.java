package service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_boardDAO;
import dto.Admin_boardDTO;

public class BoardFileDelete implements MainService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int a_index = Integer.parseInt(request.getParameter("a_index"));
		String file = request.getParameter("a_file");
		System.out.println(file);
		
		String path = request.getRealPath("/image/img_Board");
		//path = "C:\\Users\\Asus\\eclipse-workspace\\odos\\src\\main\\webapp\\image\\img_Board";
		
		if(file != null) {
			if(new File(path + "\\" + file).delete()) {
				Admin_boardDTO adto = new Admin_boardDTO();
				adto.setA_index(a_index);
				new Admin_boardDAO().fileDelete(adto);
			}
		}
	}

}
