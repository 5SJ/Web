 package myPage_p;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class UserInfoChangeModifyReg implements MyPageService{
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      
	   
	   try {
		   request.setCharacterEncoding("UTF-8");
	   } catch (UnsupportedEncodingException e1) {
		   e1.printStackTrace();
	   }
      
      
      try {
         
         String m_id = request.getParameter("m_id");
         MemberDTO dto_detail = new MemberDAO().detail(m_id);
         
         
      String password_1 = request.getParameter("m_pw");
      String password_2 = request.getParameter("m_pw2");
      
      String email_chk_codeNum = request.getParameter("chk_codeNum");
      String email_codeNum = request.getParameter("codeNum");
      
      System.out.println(email_chk_codeNum);
      System.out.println(email_codeNum);
      
      boolean rock_1=false, rock_2=false, rock_3=false, rock_4=false;
      
      if(email_chk_codeNum.equals(email_codeNum)) {
         rock_4 = true;
         System.out.println("true가 나와야하는 rock_4의 상태 : " + rock_4);   
      } else {
         rock_4 = false;
         System.out.println("false가 나와야하는 rock_4의 상태 : " + rock_4);
         request.setAttribute("mainUrl", "../alert.jsp");
         request.setAttribute("msg", "이메일 인증을 해주세요.");
         request.setAttribute("mdto", dto_detail);
         request.setAttribute("mainUrl", "../member/myPageForm.jsp"); 
         request.setAttribute("myPageUrl", "myPage/userInfoChangeModify.jsp");
      }
      
      
      if(!email_chk_codeNum.equals("")|| !email_codeNum.equals("")) {
         rock_3 = true;
         System.out.println("true가 나와야하는 rock_3의 상태 : " + rock_3);
      } else {
         rock_3 = false;
         System.out.println("false가 나와야하는 rock_3의 상태 : " + rock_3);
         request.setAttribute("mainUrl", "../alert.jsp");
         request.setAttribute("msg", "이메일 인증을 진행하세요.");
         request.setAttribute("mdto", dto_detail);
         request.setAttribute("mainUrl", "../member/myPageForm.jsp"); 
         request.setAttribute("myPageUrl", "myPage/userInfoChangeModify.jsp");
      }
      
      
      // 비번, 비번확인이 같다면
      if (password_1.equals(password_2)) {
            rock_2 = true;
            System.out.println("true가 나와야하는 rock_2의 상태 : " + rock_2);         
      }  else {
         rock_2 = false;
         System.out.println("false가 나와야하는 rock_2의 상태 : " + rock_2);
         request.setAttribute("mainUrl", "../alert.jsp");
         request.setAttribute("msg", "비밀번호 같지않습니다.");
         request.setAttribute("mdto", dto_detail);
         request.setAttribute("mainUrl", "../member/myPageForm.jsp"); 
         request.setAttribute("myPageUrl", "myPage/userInfoChangeModify.jsp");
      }
            
            
      if (!password_1.equals("") || !password_2.equals("") ) {
         rock_1 = true;         
         System.out.println("true가 나와야하는 rock_1의 상태 : " + rock_1);
      
      } else {
         rock_1 = false;      
         System.out.println("false가 나와야하는 rock_1의 상태 : " + rock_1);         
         request.setAttribute("mainUrl", "../alert.jsp");
         request.setAttribute("msg", "변경할 비밀번호를 입력해야합니다.");
         request.setAttribute("mdto", dto_detail);
         request.setAttribute("mainUrl", "../member/myPageForm.jsp"); 
         request.setAttribute("myPageUrl", "myPage/userInfoChangeModify.jsp");
      }
      
      if (rock_1 && rock_2 && rock_3 && rock_4) {
         System.out.println("안정권에 들어왔도다.");
         
            MemberDTO dto = new MemberDTO();
            dto.setM_id(request.getParameter("m_id"));
            dto.setM_pw(request.getParameter("m_pw"));
            dto.setM_name(request.getParameter("m_name"));
            dto.setM_email(request.getParameter("m_email"));
            dto.setM_point(Integer.parseInt(request.getParameter("m_point")));
            dto.setM_addr(request.getParameter("m_addr"));
            dto.setM_state(Integer.parseInt( request.getParameter("m_state")));
            
            new MemberDAO().modify(dto);
            
            request.setAttribute("mainUrl", "../alert.jsp");
            request.setAttribute("msg", "개인정보가 수정되었습니다.");
            request.setAttribute("goUrl", "UserInfoChange");
         
            }
         }   catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }         
   }
}