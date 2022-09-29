<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
/* .img{
   width: 240px;
   height: 240px
}
img{
   width: 240px;
   height: 240px
} */
/* .price{
   width: 230px;
   height: 30px;
   padding-right: 10px;
   line-height: 30px;
} */
/* #Catelist{
 width: 1050px;
 height: 100%
 
} */

.productzzang{
   margin: 15px;
   float: left;
   cursor: pointer;
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
.css-1qsrhd {
    overflow: hidden;
    max-height: 58px;
    margin-bottom: 5px;
    padding-top: 10px;
    font-size: 20px;
    line-height: 30px;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    letter-spacing: normal;
    word-break: break-word;
    overflow-wrap: break-word;
    text-align: center;
}

.css-1qsrhd1 {
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
<style>
@media screen and (max-width: 500px) {
	.css-1uonmsi {
		width: 412px;
		height: 500px;
		justify-content: center;
		box-sizing: content-box;
	}
	.css-1qpsnts {
		display: block;
		width: 330px;
		height: 430px;
		position: relative;
		left: 30px;
	}
	.css-1qsrhd {
		position: relative;
		left: 30px;
	}
	.css-1qsrhd1 {
		position: relative;
		left: 30px;
	}
}
</style>

<div class="css-1uonmsi">
   <div align="center">
      <h1>${nowCate=='md' ? "Md'sPick" : nowCate }</h1>
   </div>

   <div >
      <c:forEach items="${list }" var="prod">
         <div class="productzzang css-1afee1q" id="${prod.s_index }">
            <div>
               <div class="css-1qpsnts">
                  <img alt="no_image" src="../image/img_Product/${prod.s_image }">
                  <!-- <img alt="no_image" src="../image/img_Product/Promesa.jpg"> --> 
               </div>
               <div class="css-1qsrhd"><c:if test="${prod.s_cnt <= 0 }">[품절]</c:if>${prod.s_name }</div>
              <div class="css-1qsrhd1"> <fmt:formatNumber value="${prod.s_price }" pattern="#,###원" /></div>
            </div>
         </div>
      </c:forEach>
      </div>
</div>
