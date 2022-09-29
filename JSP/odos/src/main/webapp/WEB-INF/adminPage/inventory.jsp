<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
.inventoryTitle{
	font-weight: 500;
	font-size: 30px;
}
table{
	border-collapse: collapse;
	width: 600px;
	float: left;
	margin: 0px 10px;
}
td{
	padding:5px;
	text-align: center;
}
</style>
<body>
<p class="inventoryTitle">재고관리</p>
<table border="">
	<tbody>
		<tr>
			
		</tr>
		<tr>
			<th width="200px">상품명</th>
			<th>재고량</th>		
			<th>수량변경</th>		
		</tr>
		<c:forEach items="${list}" var="prod" begin="${page*10-10 }" end="${page*10-1 }">
		<tr>
			<td>${prod.s_name}</td>
			<td>${prod.s_cnt }</td>
			<td>
			<form action="ProdSetCntReg" >
				<input type="hidden" name="index" value="${prod.s_index }"/>
				<input type="text" class="cnt" name="cnt" size="10" maxlength="10" onKeyup="this.value = this.value.replace(/[^0-9]/g,'');"/>
				<input type="submit" value="추가" />
				<input type="button" value="감소" onclick="minusCnt('${prod.s_index }',this)"/>
			</form>
			</td>
		</tr>

		</c:forEach>
			<tr>
			<td colspan="3">
				<c:forEach var="i" begin="1" end="${list.size()/10+1 }">
					<a href="Inventory?&page=${i}&historyPage=${param.historyPage}&date=${date}" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>
<table border="">
	<tbody>
		<tr>
			<td colspan="4"><input type="text" id="datepicker" readonly></td>
		</tr>
		<tr>
			<th>상품명</th>
			<th>수량</th>
			<th>구분</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${history}" var="hi" begin="${historyPage*10-10 }" end="${historyPage*10-1 }">
		<tr>
			<td>${hi.i_name}</td>
			<td>${hi.i_cnt}</td>
			<td>${hi.i_type}</td>
			<td>${hi.i_date}</td>
		</tr>
		</c:forEach>
			<tr>
			<td colspan="4">
				<c:forEach var="i" begin="1" end="${history.size()/10+1 }">
					<a href="Inventory?&page=${param.page}&historyPage=${i}&date=${date}" <c:if test="${param.historyPage == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>
</body>

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script>
function minusCnt(index,aa){
	var cnt = $(aa).siblings(".cnt").val()
	location.href="ProdSetCntReg?index="+index+"&cnt=-"+cnt
}

$(function() {
	$("#datepicker").datepicker();
	$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
	if("${date}" == null || "${date}" == ""){
		$("#datepicker").datepicker('setDate', 'today');
	}else{
		$("#datepicker").datepicker('setDate', '${date}');
	}
	
	$("#datepicker").on("change", function(){
		console.log($(this).val());
		location.href="Inventory?page=${page}&date="+$(this).val();
		/* $.ajax({
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
		}) */
	})
});
</script>