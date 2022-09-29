<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
#result{
	width: 1210px;
	height: 500px;
	/* border: 1px solid #000; */
	overflow: auto;
}
a{
	color: #f00;
}
.salesTitle{
	font-weight: 500;
	font-size: 30px;
}
table{
	border-collapse: collapse;
	width: 1200px;
}
td{
	padding:5px;
	text-align: center;
}
</style>

<body>
	<p class="salesTitle">매출관리</p>
	<table border="">
		<tbody>
			<tr>
				<td>
				<input type="radio" name="radio" value="yearRadio" checked/>기간별
				<input type="radio" name="radio" value="prodRadio"/>상품별
				<input type="radio" name="radio" value="franRadio"/>매장별
				</td>
			</tr>
			<tr>
				<td id="filter">
				
					<div id="yearRadio">
						<select id="yyear">
							<option value="2022">2022</option>
							<option value="2021">2021</option>
						</select>
						<button id="ysearch">검색</button>
					</div>
					
					<div id="prodRadio" hidden>
						<input type="text" id="pdatepicker" size="10"> ~ <input type="text" id="pdatepicker2" size="10">
						<button id="psearch">검색</button>
					</div>
					
					<div id="franRadio" hidden>
						<input type="text" id="fdatepicker" size="10"> ~ <input type="text" id="fdatepicker2" size="10">
						<button id="fsearch">검색</button>
					</div>
				</td>		
			</tr>
			
		</tbody>
	</table>
	
	
	<div id="result"></div>
</body>

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script>
$(function(){
	$("input[name=radio]").change(function(){
		$("#yearRadio").hide()
		$("#prodRadio").hide()
		$("#franRadio").hide()
		$("#pdatepicker").val('')
		$("#pdatepicker2").val('')
		$("#fdatepicker").val('')
		$("#fdatepicker2").val('')
		$("#result").html("")
		switch($(this).val()){
			case 'yearRadio':
				$("#yearRadio").show()
				break;
			case 'prodRadio':
				$("#prodRadio").show()
				break;
			case 'franRadio':
				$("#franRadio").show()
				break;
		}
	})
	
	// 기간별매출
	$("#ysearch").on("click", function(){
		$.ajax({
				url: "../ajax/GetSales",
				type: "GET",
				data: {type:"y", year:$("#yyear").val()},
				async: false,
				//dataType: 'json',
				success: function(res){
					res = decodeURIComponent(res.replaceAll("+"," "))
					var tot = 0
					$("#result").html("")
					
					$("#result").html(res)
				},
				error: function(res){
					$("#result").html("없어요 매출")
				}
			})
	})
	
	// 상품별매출
	$("#pdatepicker").datepicker();
	$("#pdatepicker2").datepicker();
	$("#pdatepicker").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#pdatepicker2").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#psearch").on("click", function(){
		$.ajax({
				url: "../ajax/GetSales",
				type: "GET",
				data: {type:"p", first:$("#pdatepicker").val(), last:$("#pdatepicker2").val()},
				async: false,
				success: function(res){
					$("#result").html(decodeURIComponent(res.replaceAll("+"," ")))
				},
				error: function(res){
					$("#result").html("없어요 매출")
				}
			})
	})
	
	
	// 매장별매출
	$("#fdatepicker").datepicker();
	$("#fdatepicker2").datepicker();
	$("#fdatepicker").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#fdatepicker2").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#fsearch").on("click", function(){
		$.ajax({
				url: "../ajax/GetSales",
				type: "GET",
				data: {type:"f", first:$("#fdatepicker").val(), last:$("#fdatepicker2").val()},
				async: false,
				success: function(res){
					res = decodeURIComponent(res.replaceAll("+"," "))
					var tot = 0
					$("#result").html("")
					
					$("#result").html(res)
				},
				error: function(res){
					$("#result").html("없어요 매출")
				}
			})
	})
	
	
})

// 월별 상세보기
function monthly(month) {
	$.ajax({
			url: "../ajax/GetSales",
			type: "GET",
			data: {type:"m", month:month},
			async: false,
			success: function(res){
				$("#result").html(decodeURIComponent(res.replaceAll("+"," ")))
			},
			error: function(res){
				$("#result").html("없어요 매출")
			}
		})
	}

// 상품별매출 상세보기
function pdetail(index, first, last) {
	$.ajax({
			url: "../ajax/GetSales",
			type: "GET",
			data: {type:"pd", index:index, first:first, last:last},
			async: false,
			success: function(res){
				$("#result").html(decodeURIComponent(res.replaceAll("+"," ")))
			},
			error: function(res){
				$("#result").html("없어요 매출")
			}
		})
	}
	
// 매장별매출 상세보기
function fdetail(index, first, last) {
	$.ajax({
			url: "../ajax/GetSales",
			type: "GET",
			data: {type:"fd", index:index, first:first, last:last},
			async: false,
			success: function(res){
				$("#result").html(decodeURIComponent(res.replaceAll("+"," ")))
			},
			error: function(res){
				$("#result").html("없어요 매출")
			}
		})
	}
	
function back(){
	$.ajax({
		url: "../ajax/GetSales",
		type: "GET",
		data: {type:"back"},
		async: false,
		success: function(res){
			$("#result").html(decodeURIComponent(res.replaceAll("+"," ")))
		},
		error: function(res){
			$("#result").html("없어요 매출")
		}
	})
}	
</script>
