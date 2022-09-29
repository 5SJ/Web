<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script type ="text/javascript" src="../bootstrap/js/bootstrap.bundle.min.js" ></script>

<style>
	.titleWrapper {
	    display: flex;
	    -webkit-box-align: center;
	    padding: 10px 0px 37px;
	    flex-direction: column;
	}
	.titleName {
	    font-weight: 500;
	    font-size: 24px;
	    color: rgb(51, 51, 51);
	    letter-spacing: -0.5px;
	}
	.titleSubName{
		padding-top: 10px;
		font-weight: 300;
	    font-size: 16px;
	    color: rgb(51, 51, 51);
	    letter-spacing: -0.5px;
	}
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
	    color: rgb(0, 0, 0);
	}
	
	@media screen and (max-width: 570px){
		.css-171zbec {
    		margin-top: 20px;
    		width: 400px;
		}
	}
	
</style>
<div class="titleWrapper ">
	<h3 class="titleName ">
		적립금 내역
	</h3>
	<h4 class="titleSubName">현재 ${mdto.m_name }님의 적립금은 ${mdto.m_point } 포인트 사용가능합니다.</h4>
</div>

<%-- <div class="css-1yc2nwy eug5r8l2">
	<h3 class="css-1ew6v8c eug5r8l1">적립금 내역</h3>
	<div>현재 ${mdto.m_name }님의 적립금은 ${mdto.m_point } 포인트 사용가능합니다.</div>
</div> --%>

<div class="css-1dmsa3j e1jm6dy15"></div>

<table class="css-171zbec" >
	<thead>
		<tr class="css-141m64i">
			<th class="css-3035ha e1rqxz0z0" >날짜</th>
			<th class="css-3035ha e1rqxz0z0" >적립내용</th>
			<th class="css-3035ha e1rqxz0z0">적립금액</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${list }" var="dto" begin="${param.page*10-10 }" end="${param.page*10-1 }">
		<c:if test="${(dto.oi_point != dto.oi_total) && (dto.oi_sort != 9) }">
		<tr class="css-141m64i">
			<td class="css-44wg63">${dto.oi_dateStr }</td>
			<td class="css-44wg63">상품 구매 적립<c:if test="${dto.oi_sort < 5 }">(예정)</c:if></td>
			<td class="css-44wg63"><fmt:formatNumber value="${(dto.oi_total - dto.oi_point)/20 }" pattern="#,###원"/></td>
		</tr>
		</c:if>
		<c:if test="${dto.oi_point > 0 }">
		<tr class="css-141m64i">
			<td class="css-44wg63">${dto.oi_dateStr }</td>
			<td class="css-44wg63">상품 구입 사용</td>
			<td class="css-44wg63" style="color:blue;">-<fmt:formatNumber value="${dto.oi_point }" pattern="#,###원"/></td>
		</tr>
		</c:if>
	</c:forEach>
	</tbody>
	
</table>
<div class="pageN">
	<c:forEach var="i" begin="1" end="${odto.size()/10+1 }">
		<a href="UserPoint?page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
	</c:forEach>
</div>