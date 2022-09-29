<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<style>
	.css-j0lifa {
	    display: flex;
	    flex-direction: row;
	    width: 100%;
	    padding-bottom: 27px;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	}
	.titleWrapper {
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 10px 0px 37px;
	}
	.titleName {
	    font-weight: 500;
	    font-size: 24px;
	    color: rgb(51, 51, 51);
	    letter-spacing: -0.5px;
	}

	.css-1dmsa3j {
	    display: flex;
	    flex-direction: row;
	    width: 100%;
	    -webkit-box-align: center;
	    align-items: center;
	    border-bottom: 2px solid rgb(51, 51, 51);
	}
	
	.css-1c8nox {
	    padding-top: 20px;
	    position: relative;
	    height: 100%;
	}
	
	.css-171zbec {
		margin-top: 20px;
    	width: 820px;
	}
	
	.css-141m64i {
		border-top: 2px solid rgb(51, 51, 51);
	    border-bottom: 1px solid rgb(51, 51, 51);
	}
	
	.css-3035ha {
	    width: 100px;
	    padding: 18px 0px 19px;
	    text-align: center;
	    font-size: 14px;
	    line-height: 20px;
	    font-weight: 500;
	    letter-spacing: -0.5px;
	    color: rgb(51, 51, 51);
	}
	
	.css-44wg63 {
	    padding: 16px 0px;
	    border-bottom: 1px solid rgb(244, 244, 244);
	    text-align: center;
	    font-size: 12px;
	    color: rgb(0, 0, 0);
	}
	
@media screen and (max-width: 570px){
	.css-j0lifa {
	    display: flex;
	    flex-direction: row;
	    width: 100%;
	    padding-bottom: 27px;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	}
	
	.css-1dmsa3j {
	    display: flex;
	    flex-direction: row;
	    width: 100%;
	    -webkit-box-align: center;
	    align-items: center;
	    border-bottom: 2px solid rgb(51, 51, 51);
	}
	
	.css-1c8nox {
	    padding-top: 20px;
	    position: relative;
	    height: 100%;
	}
	
	.css-171zbec {
		margin-top: 20px;
    	width: 405px;
	}
	
	.css-141m64i {
		border-top: 2px solid rgb(51, 51, 51);
	    border-bottom: 1px solid rgb(51, 51, 51);
	}
	
	.css-3035ha {
	    width: 100px;
	    padding: 18px 0px 19px;
	    text-align: center;
	    font-size: 14px;
	    line-height: 20px;
	    font-weight: 500;
	    letter-spacing: -0.5px;
	    color: rgb(51, 51, 51);
	}
	
	.css-44wg63 {
	    padding: 16px 0px;
	    border-bottom: 1px solid rgb(244, 244, 244);
	    text-align: center;
	    color: rgb(0, 0, 0);
	    font-size: 10px;
	}
}
</style>

<div class="titleWrapper ">
	<h3 class="titleName ">
		주문내역
	</h3>
</div>

<div class="css-1dmsa3j e1jm6dy15"></div>

<table class="css-171zbec" >
	<thead>
		<tr class="css-141m64i">
			<th class="css-3035ha e1rqxz0z0">주문번호</th>
			<th class="css-3035ha e1rqxz0z0">결제날짜</th>
			<th class="css-3035ha e1rqxz0z0">주문내용</th>
			<th class="css-3035ha e1rqxz0z0">총 금액</th>
			<th class="css-3035ha e1rqxz0z0">주문상태</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${odto }" var="dto" begin="${param.page*10-10 }" end="${param.page*10-1 }">
		<tr class="css-141m64i">
			<td class="css-44wg63"><a href="OrderDetail?page=${param.page }&num=${dto.oi_num }">${dto.oi_num }</a></td>
			<td class="css-44wg63">${dto.oi_dateStr }</td>
			<td class="css-44wg63">${dto.oi_listStr }</td>
			<td class="css-44wg63"><fmt:formatNumber value="${dto.oi_total }" pattern="#,#00원"/></td>
			<td class="css-44wg63">${dto.oi_sortStr }</td>
		</tr>
	</c:forEach>
	</tbody>
	
</table>
<div class="pageN">
	<c:forEach var="i" begin="1" end="${odto.size()/10+1 }">
		<a href="OrderList?page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
	</c:forEach>
</div>
