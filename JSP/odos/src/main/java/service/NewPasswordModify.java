package service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class NewPasswordModify implements MainService {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		  try {
			   request.setCharacterEncoding("UTF-8");
		   } catch (UnsupportedEncodingException e1) {
			   e1.printStackTrace();
		   }
		
		    try {
		 // 비밀번호 찾기의 것
	      String idforfindingPassword = request.getParameter("memberId");
	      String findPassword = request.getParameter("password");
	      String findPasswordConfirm = request.getParameter("passwordConfirm");      
		  
		     // 비밀번호 찾기에서 비밀번호 바꾸기 
		   	if (findPassword.equals(findPasswordConfirm)) {
				System.out.println("비밀번호와 비밀번호 확인란이 같긴합니다");
					
				MemberDTO dto = new MemberDTO();
				dto.setM_id(request.getParameter("memberId"));
		        dto.setM_pw(request.getParameter("passwordConfirm"));
		            
		        new MemberDAO().modifyPassword(dto);
		        request.setAttribute("mainUrl", "../alert.jsp");
				request.setAttribute("msg", "개인정보가 수정되었습니다.");
				request.setAttribute("goUrl", "Login");
				} 
		     
		      
		         }   catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		         }  
	      	
	}
}
