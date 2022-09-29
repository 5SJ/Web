package ajaxService;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FranchiseeDAO;
import dto.FranchiseeDTO;

public class GetStore implements AjaxService{

   @Override
   public void excute(HttpServletRequest request, HttpServletResponse response) {
      String fid = request.getParameter("f_id");
      FranchiseeDTO dto = new FranchiseeDAO().detail(fid);
      
      // div를 추가한 이유는 order.jsp에서 꾸미기 위해 div로 만들었습니다.
      String msg = "<ul><li><div class='"+"titleStoreName"+"'>매장이름</div><div class='"+"pickStoreName pickInner"+"'>" +dto.getF_name()+"</div></li>";
      msg += "<li><div class='"+"titleStoreAddr"+"'>매장주소</div><div class='"+"pickStoreAddr pickInner"+"'>" + dto.getF_addr()+"</div></li>";
      msg += "<li><div class='"+"titleStoreNum"+"'>매장번호</div><div class='"+"pickStorePhone pickInner"+"'>" + dto.getF_phone()+"</div></li>";
      msg += "<li><div class='"+"titleStoreDay"+"'>영업일</div><div class='"+"pickStoreDay pickInner"+"'>" + dto.getF_dayBr() + "</div></li>";
      msg += "<li><div class='"+"titleStoreInfo"+"'>매장정보</div><div class='"+"pickStoreInfo pickInner"+"'>" + dto.getF_infoBr() + "</div></li></ul>";
      try {
         response.getWriter().print(URLEncoder.encode(msg, "UTF-8"));
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }   
   
}