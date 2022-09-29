<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.franSale{
	width: 1050px;
	margin: 0 auto;
	display: flex;
}
.franSale table{
	margin: 0 auto;
}
.franSale td{
	border-bottom: 2px solid rgba(245,245,245);	
	font-size: 19px;
}
.franSale #date{
	width: 100px;
	height: 30px;
	margin-left: 5px;
}
@media screen and (max-width: 500px) {
	.franSale{
  	width: 412px;
  		}
</style>
<h2 align="center">정산관리 페이지</h2>
<div class="franSale">
<table>
	<tbody>
		<tr>
			<td>월 정산 :</td>
			<td>
				<select id="date">
					<c:forEach items="${monthList}" var="list">
					<option value="${list}">${list}</option>
					</c:forEach>
				</select>
			</td>		
		</tr>
		<tr>
			<td id="total" colspan="2">
			총 매출 : <font color="blue">${total}</font>
			</td>
		</tr>
		<tr>
			<td id="res" colspan="2">
				정산금액 : <font color="blue">${res}</font>
			</td>
		</tr>
	</tbody>
</table>
</div>

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script>
$("#date").on('change', function () {
	$.ajax({
		url: "../ajax/Fsales",
		type: "POST",
		data: {
			date:$(this).val()
		},
		dataType: "json",
		async: false,
		success: function(res){
			$("#total").html("총 매출 : "+res.total);
			$("#res").html("정산금액 : "+res.res);
		},
		error: function(res){
		}
	})
});

</script>
