package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberJoinReg implements MainService {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
      MemberDTO dto = new MemberDTO();
      dto.setM_id(request.getParameter("memberId"));
      dto.setM_pw(request.getParameter("password"));
      dto.setM_name(request.getParameter("name"));
      dto.setM_email(request.getParameter("m_email"));
      dto.setM_addr(request.getParameter("address"));
      
      new MemberDAO().memberJoinInsert(dto);
      
      request.setAttribute("mainUrl", "../member/welcome.jsp");
      request.setAttribute("msg", "ODOS 가입을 축하드립니다.");
      request.setAttribute("goUrl", "../main/MainPage");
      request.setAttribute("dto", dto);
   }

}