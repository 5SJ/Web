<%@page import="dto.Admin_boardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=320, initial-scale=1.0">
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>


<!-- mainBanner 애니메 -->
<script>
   $(document).ready(function() {
        slide();
      });

      // 슬라이드 
      function slide() {
        var wid = 0;
        var now_num = 0;
        var slide_length = 0;
        var auto = null;
        var $panel = $('.panel');
        var $paneldiv = $panel.children('div');
        var $imgSlideBtn = $('.imgSlideBtn');

        // 변수 초기화
        function init() {
          wid = $('.mainBanner').width();
          now_num = $('.panel>div').index();
          slide_length = $paneldiv.length+1;
        }

        // 이벤트 묶음
        function slideEvent() {

          // 이후 버튼 클릭했을때
          $('.next').click(function() {
            nextChkPlay();
          });

          // 이전 버튼 클릭했을때
          $('.prev').click(function() {
            prevChkPlay();
          });

          // 오토플레이
          autoPlay();

          // 오토플레이 멈춤
          autoPlayStop();

          // 오토플레이 재시작
          autoPlayRestart();

        }

        // 자동실행 함수
        function autoPlay() {
          auto = setInterval(function() {
            nextChkPlay();
          }, 3000);
        }

        // 자동실행 멈춤
        function autoPlayStop() {
          $paneldiv.mouseenter(function() {
            clearInterval(auto);
          });
          $imgSlideBtn.mouseenter(function(){
             clearInterval(auto);
          })
        }

        // 자동실행 멈췄다가 재실행
        function autoPlayRestart() {
          $paneldiv.mouseleave(function() {
            auto = setInterval(function() {
              nextChkPlay();
            }, 3000);
          });
          $imgSlideBtn.mouseleave(function(){
             auto = setInterval(function(){
                nextChkPlay();
             }, 3000);
          });
        }

        // 이전 버튼 클릭시 조건 검사후 슬라이드 무브
        function prevChkPlay() {
          if (now_num == 0) {
            now_num = slide_length - 1;
          } else {
            now_num--;
          }
          slideMove();
        }

        // 이후 버튼 클릭시 조건 검사후 슬라이드 무브
        function nextChkPlay() {
          if (now_num == slide_length - 1) {
            now_num = 0;
            $panel.css({
            	'margin-left': -wid * now_num
            })
            now_num++;
          } else {
            now_num++;
          }
          slideMove();
        }

        // 슬라이드 무브
        function slideMove() {
          $panel.stop().animate({
            'margin-left': -wid * now_num
          });
        }

        init();
        slideEvent();
      }

      
$(function(){
	$(".panel").append($(".panel>div:nth-of-type(1)").clone())
<%ArrayList<Admin_boardDTO> banner = (ArrayList<Admin_boardDTO>)request.getAttribute("banner");
for(int i=0; i<=banner.size(); i++) { %>
	$(".panel").css({
		width: "<%=(banner.size()+1)*1050 %>px"
	})
	$(".panel>div:nth-of-type(<%=i+1 %>)").css({
		backgroundImage: "url('../image/img_Board/<%=banner.get(i%banner.size()).getA_file()%>')"
	})
	$(".panel>div:nth-of-type(<%=i+1 %>)").click(function(){
		location.href="BoardDetail?type=1&page=1&a_index=<%=banner.get(i%banner.size()).getA_index() %>"
	})
<%} %>
})

$(function(){
   $(".bestItem").click(function(){
      location.href="ProdDetail?index="+$(this).attr('index')
   })
})
</script>


<div class="mainPageBody">
   <div class="mainBanner">
      <div class="panel">
      	<c:forEach items="${banner }" var="event">
      		<div></div>
      	</c:forEach>
      </div>
      <button class="prev imgSlideBtn">&lang;&lang;</button>
      <button class="next imgSlideBtn">&rang;&rang;</button>
   </div>

   <div class="recommendDiv">
      <div class="recommendProduct">
         <div class="recomSpan">
            <span>하루한잔 월간BEST TOP3</span>
         </div>
         <div class="recommendList">
            	<c:forEach items="${best }" var="dto">
            		<div class="bestItem" index="${dto.s_index }">
            			<div><img alt="no_image" src="../image/img_Product/${dto.s_image }"></div>
            			<div><c:if test="${dto.s_cnt <= 0 }">[품절]</c:if>${dto.s_name }</div>
            			<div><fmt:formatNumber value="${dto.s_price }" pattern="#,###원" /></div>
            		</div>
            	</c:forEach>
         </div>
      </div>
   </div>

   <div class="adverBanner">
      <div class="advertising">
         <a href="#"><img src="../image/img_Main/adverBanner1.png" /></a>
      </div>
   </div>
</div>