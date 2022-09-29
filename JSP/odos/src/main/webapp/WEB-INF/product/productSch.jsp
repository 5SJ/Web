<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>

.productzzang{
   margin: 15px;
   float: left;
   cursor: pointer;
}
.productnamename{
   width: 336px;
   height: 30px;
   text-align: center;
   line-height: 30px;
}
.css-1afee1q {
    flex: 0 0 338px;
    height: 560px;
    color: rgb(51, 51, 51);
    cursor: pointer;
    width: 320px;
    
}
.css-1qpsnts {
    overflow: hidden;
    position: relative;
    background-color: rgb(245, 245, 245);
    border-bottom: 1px solid #88001b;
    width: 320px;
    height: 435px;
}
.css-1qpsnts > img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: all 0.5s ease-in-out 0s;
}
.css-c1cgl {
    padding: 14px 10px 10px 0px;
}
.css-1qsrhd {
    overflow: hidden;
    max-height: 58px;
    margin-bottom: 9px;
    padding: 0px;
    font-size: 20px;
    line-height: 29px;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    letter-spacing: normal;
    word-break: break-word;
    overflow-wrap: break-word;
    text-align: center;
}

.css-1uonmsi {
    width: 1050px;
    height: 100% ;
    margin: 0px auto;
    padding-top: 26px;
}

@media screen and (max-width: 500px) {
   .css-1uonmsi {
    width : 412px;
    height: 100% ;
       justify-content: center;
       box-sizing: content-box;
}
.css-1qpsnts{
   display: block;
   width: 330px;
   height: 430px;
   position: relative;
   left: 30px;
}
.css-1qsrhd{
   position: relative;
   left: 25px;
}
.css-1qsrhd1{
   position: relative;
   left: 35px;
}
.productzzang{
	margin: 0 auto;
	padding-left: 12px;
}

}
</style>
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script>
$(function(){
   $(".productzzang").click(function(){
      location.href="ProdDetail?index="+$(this).attr('id')
   })
})
</script>

<div class="css-1uonmsi">
   <div align="center">
      <h2>'${where }'에 대한 검색결과 입니다.</h2>
   </div>
   <div>
      <c:forEach items="${list }" var="prod">
         <div class="productzzang css-1afee1q" id="${prod.s_index }">

            <div>
               <div class="css-1qpsnts">
                  <img alt="no_image" src="../image/img_Product/${prod.s_image }">
               </div>
            </div>

            <div class="productnamename css-c1cgl">
               <div class="css-1qsrhd">${prod.s_name }</div>
            </div>

            <div class="css-1qsrhd">
               <fmt:formatNumber value="${prod.s_price }" pattern="#,#00원" />
            </div>
         </div>
      </c:forEach>
   </div>
   <c:if test="${list.size() == 0 }">
      <div align="center" style="color:#aaa;">
      <h3>검색된 상품이 없습니다.</h3>
   </div>
   </c:if>
</div>