package ajaxService;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class IdChk implements AjaxService {

   @Override
   public void excute(HttpServletRequest request, HttpServletResponse response) {
      System.out.println("@@@아이디확인 오셨어요");
      
      String id = request.getParameter("memberId");
      MemberDAO mdao = new MemberDAO();
      
      String res = mdao.idChk(id);

      System.out.println("입력받은 아이디 : "+id);
      System.out.println("중복확인검사 : "+res);
      
      try {
         response.getWriter().append(res);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   
}