package ajaxService;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;

public class SendEmail implements AjaxService{
   @Override
   public void excute(HttpServletRequest request, HttpServletResponse response) {
      System.out.println(request.getParameter("m_email"));
      String email = request.getParameter("m_email");
      String p_name = request.getParameter("p_name");
      
      MemberDAO mdao = new MemberDAO();
      String res = mdao.emailChk(email);
      
      String m_id = request.getParameter("m_id");
      MemberDTO dto_detail = new MemberDAO().detail(m_id);
      
      //String c = SendEmail(email, p_name);
      
      
      try {
         String c = SendEmail(email, p_name);
         System.out.println("c가 나오는 부분입니다 : "+ c);
         response.getWriter().print(c);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }   
   
   public String SendEmail(String email, String p_name) {
      String host = "smtp.naver.com";            //<=======
      final String user = "drakedk@naver.com";   //<=======
      final String password = "wkdgusxkc1!";          //<======= 

      //String to = "psuji0223@gmail.com";
      String to = email;
      
      
      Random ran = new Random();
      int createNum = 0;
      String ranNum = "";
      int limit = 6;
      String emailConfirmNum ="";
      
      for (int i = 0; i < limit; i++) {
         createNum = ran.nextInt(9); //0~9 나올 수 있는 1자리 난수 생성한다.
         ranNum = Integer.toString(createNum);
         emailConfirmNum += ranNum; 
      }
      
      System.out.println(emailConfirmNum);
      
      // Get the session object
      Properties props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.auth", "true");

      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
         }
      });
      
      // Compose the message
      try {
         
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

         // 이메일 제목? 넣는 부분
         message.setSubject("주류총판 이메일 인증입니다.");

         // 이메일 텍스트 넣는 부분 
         message.setText("해당 인증번호를 입력해주세요 : " + emailConfirmNum);

         // send the message
         Transport.send(message);
         System.out.println("메일을 보냈습니다.");

      } catch (MessagingException e) {
         e.printStackTrace();
      }
      
      return emailConfirmNum;
   }
}