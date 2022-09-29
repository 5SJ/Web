package ajaxService;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.SalesDAO;
import dto.OrderDTO;

public class GetSales implements AjaxService{

   @Override
   public void excute(HttpServletRequest request, HttpServletResponse response) {
      HttpSession session = request.getSession();
      
      String type = request.getParameter("type");
      String res = "", back = "";
      Gson json = new Gson();
      String first, last, year, month;
      int total = 0;

      switch(type) {
      case "y":   // 연매출
         year = request.getParameter("year");
         LinkedHashMap<String, Integer> ylist = new SalesDAO().yearly(year);
         res = "<table border=''><tr><td>월</td><td>매출액</td></tr>";
         for(String date : ylist.keySet()) {
            res += "<tr><td><a onclick='monthly(&quot;"+date+"&quot;)'>"+date+"</a></td><td>"+new DecimalFormat("###,###").format(ylist.get(date))+"원</td></tr>";
            total += ylist.get(date);
         }
         res += "<tr><td>총매출</td><td>"+new DecimalFormat("###,###").format(total)+"원</td></tr></table>";
         session.setAttribute("res", res);
         break;
         
         
      case "m":   // 월매출
         month = request.getParameter("month");
         System.out.println(month);
         LinkedHashMap<Date, Integer> mlist = new SalesDAO().monthly(month);
         res = "<table border=''><tr><td>날짜</td><td>매출액</td></tr>";
         for(Date date : mlist.keySet()) {
            res += "<tr><td>"+date+"</td><td>"+new DecimalFormat("###,###").format(mlist.get(date))+"원</td></tr>";
            total += mlist.get(date);
         }
         res += "<tr><td>총매출</td><td>"+new DecimalFormat("###,###").format(total)+"원</td></tr></table>";
         res += "<a onclick='back()'>목록으로</a>";
         break;
         
         
      case "p":   // 상품별 매출
         first = request.getParameter("first");
         last = request.getParameter("last"); 
         ArrayList<OrderDTO> plist = new SalesDAO().prodSales(first, last);
         res = "<table border=''><tr><td>카테고리</td><td>상품명</td><td>단가</td><td>판매량</td><td>총매출액</td></tr>";
         for(OrderDTO dto : plist) {
            res += "<tr><td>"+dto.getS_cate()
               +"</td><td><a onclick='pdetail("+dto.getOi_item()+",&quot;"+first+"&quot;,&quot;"+last+"&quot;)'>"+dto.getS_name()
               +"</a></td><td>"+new DecimalFormat("###,###").format(dto.getS_price())
               +"원</td><td>"+dto.getOi_cnt()
               +"</td><td>"+new DecimalFormat("###,###").format(dto.getOi_total())
               +"원</td></tr>";
            total += dto.getOi_total();
         }
         res += "<tr><td colspan='4'>총매출</td><td>"+new DecimalFormat("###,###").format(total)+"원</td></tr></table>";
         session.setAttribute("res", res);
         break;
         
         
      case "pd":   // 상품별매출 상세보기
         int oi_item = Integer.parseInt(request.getParameter("index"));
         first = request.getParameter("first");
         last = request.getParameter("last");
         ArrayList<OrderDTO> pdlist = new SalesDAO().prodSalesDetail(oi_item, first, last);
         res = pdlist.get(0).getS_name()+"<table border=''><tr><td>판매일</td><td>판매량</td><td>매출액</td></tr>";
         for(OrderDTO dto : pdlist) {
            res += "<tr><td>"+dto.getOi_date()+"</td><td>"+dto.getOi_cnt()+"</td><td>"+new DecimalFormat("###,###").format(dto.getOi_total())+"원</td></tr>";
            total += dto.getOi_total();
         }
         res += "<tr><td colspan='2'>총매출</td><td>"+new DecimalFormat("###,###").format(total)+"원</td></tr></table>";
         res += "<a onclick='back()'>목록으로</a>";
         break;

         
      case "f":   // 매장별 매출
         first = request.getParameter("first");
         last = request.getParameter("last");
         ArrayList<OrderDTO> flist = new SalesDAO().franSales(first, last);
         res = "<table border=''><tr><td>매장ID</td><td>매장명</td><td>매출액</td></tr>";
         for(OrderDTO dto : flist) {
            res += "<tr><td>"+dto.getOi_mid()
               +"</td><td><a onclick='fdetail("+dto.getOi_fid()+",&quot;"+first+"&quot;,&quot;"+last+"&quot;)'>"+dto.getF_name()
               +"</td><td>"+new DecimalFormat("###,###").format(dto.getOi_total())
               +"원</td></tr>";
            total += dto.getOi_total();
         }
         res += "<tr><td colspan='2'>총매출</td><td>"+new DecimalFormat("###,###").format(total)+"원</td></tr></table>";
         session.setAttribute("res", res);
         break;
   
         
      case "fd":   // 매장별매출 상세보기
         int f_index = Integer.parseInt(request.getParameter("index"));
         first = request.getParameter("first");
         last = request.getParameter("last");
         ArrayList<OrderDTO> fdlist = new SalesDAO().franSalesDetail(f_index, first, last);
         res = fdlist.get(0).getF_name()+"("+fdlist.get(0).getOi_mid()+")"+"<table border=''><tr><td>판매일</td><td>매출액</td></tr>";
         for(OrderDTO dto : fdlist) {
            res += "<tr><td>"+dto.getOi_date()+"</td><td>"+new DecimalFormat("###,###").format(dto.getOi_total())+"원</td></tr>";
            total += dto.getOi_total();
         }
         res += "<tr><td>총매출</td><td>"+new DecimalFormat("###,###").format(total)+"원</td></tr></table>";
         res += "<a onclick='back()'>목록으로</a>";
         break;
         
         
      case "back":
         res = (String) session.getAttribute("res");
         break;
      }
      
      
      try {
         response.getWriter().print(URLEncoder.encode(res, "UTF-8"));
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }   
   
}