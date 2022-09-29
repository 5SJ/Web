<%@page import="java.awt.Color"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
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
	    border-bottom: 2px solid #88001b;
	    margin-top:10px;
	    font-size: 18px;
	}
	.css-1c8nox {
	    padding-top: 20px;
	    position: relative;
	    height: 100%;
	}
	
	.css-171zbec {
		margin-top: 20px;
    	width: 1050px;
	}
	
	.css-141m64i {
		border-top: 2px solid rgb(51, 51, 51);
	    border-bottom: 1px solid rgb(51, 51, 51);
	}
	
	.css-3035ha {
	    width: 100px;
	    padding: 18px 0px 19px;
	    text-align: center;
	    letter-spacing: -0.5px;
	    color: rgb(51, 51, 51);
	}
	
	.css-44wg63 {
	    padding: 16px 0px;
	    border-bottom: 1px solid rgb(244, 244, 244);
	    text-align: center;
	    color: rgb(0, 0, 0);
	    font-size: 15px;
	}
	.franchOrder{
		width: 1050px;
		margin: 0 auto;
	}
	.franchOrder table{
		margin: 0 auto;
	}
	
	@media screen and (max-width: 500px) {
	.asd{
  	width: 412px;
  		}
  	.franchOrder{
  		width: 100%;
  		}
  	.css-171zbec{
  		width: 100%;
  		}
  }
</style>

<div class="asd">
<div class="css-1yc2nwy eug5r8l2">
	<h2 class="css-1ew6v8c eug5r8l1" align="center">주문내역</h2>
</div>

<div class="franchOrder">
<div class="css-1dmsa3j"><p>조회날짜 : <input type="text" id="datepicker" readonly></p></div>
<table class="css-171zbec" >
	<thead>
		<tr class="css-141m64i">
			<th class="css-3035ha e1rqxz0z0">주문번호</th>
			<th class="css-3035ha e1rqxz0z0">결제날짜</th>
			<th class="css-3035ha e1rqxz0z0">주문자 아이디</th>
			<th class="css-3035ha e1rqxz0z0">주문자명</th>
			<th class="css-3035ha e1rqxz0z0">주문상품</th>
			<th class="css-3035ha e1rqxz0z0">총 금액</th>
			<th class="css-3035ha e1rqxz0z0">주문상태</th>
		</tr>
	</thead>
	
	<tbody id="list">
	<%for(OrderDTO dto : (ArrayList<OrderDTO>)request.getAttribute("odto")){%>
	<tr class="css-141m64i">
			<td class="css-44wg63"><%=dto.getOi_num() %></td>
			<td class="css-44wg63"><%=dto.getOi_date() %></td>
			<td class="css-44wg63"><%=dto.getOi_mid() %></td>
			<td class="css-44wg63"><%=dto.getM_name() %></td>
			<td class="css-44wg63">
				<%for(int key : dto.getOi_list().keySet()) {%>
					<%=new ProductDAO().detail(key).s_name %>
					<%=dto.getOi_list().get(key) %>EA
				<%} %>
			</td>
			<td class="css-44wg63"><fmt:formatNumber value="<%=dto.getOi_total() %>" pattern="#,###원"/></td>
			<td class="css-44wg63"><%=dto.getOi_sortStr() %>
				<%if(dto.getOi_sort()==3) {%>
				<input type="button" value="상품 수령" onclick="chk('<%=dto.getOi_num() %>','4')">
				<%} else if(dto.getOi_sort()==4) {%>
				<input type="button" value="수령 확인" onclick="chk('<%=dto.getOi_num() %>','5')">
				<%} %>
			</td>
		</tr>
	<%} %>
	</tbody>
</table>
</div>
</div>

<script>
	
	function chk(oi_num, oi_sort) {
		location.href="SortUpdate?oi_num="+oi_num+"&oi_sort="+oi_sort;
	}
	
	$(function() {
		$("#datepicker").datepicker();
		$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
		$("#datepicker").on("change", function(){
			console.log($(this).val());
			$.ajax({
				url: "../ajax/GetList",
				type: "GET",
				data: {
					date: $(this).val()
				},
				async: false,
				success: function(res){
					$("#list").html(res)
				},
				error: function(res){
					$("#list").html("<td><tr>검색된 결과가 없습니다.</tr></td>");
				}
			})
		})
	});
</script>