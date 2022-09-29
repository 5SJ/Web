<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.newFranTitle{
	font-weight: 500;
	font-size: 30px;
}
table{
	border-collapse: collapse;
	
}
td{
	padding:5px;
	align-items: center;
}
#fransInfoTxtArea{
	min-width: 95%;
}
</style>
<body>
	<p class="newFranTitle">신규 가맹점 추가</p>
	<form action="FranchiseeInsertReg" method="post" >
	<input type="hidden" name="page" value="${param.page }" />
	<table border="">
		<tbody>
			<tr>
				<td><input type="text" value="odos${f_id}" name="id" readonly></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="매장명" name="name"></td>
			</tr>
			<tr>
				<td>
					<input type="text" id="addr" placeholder="매장주소" name="addr" readonly>
					<input type="button" onclick="search()" value="주소 검색">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="email" placeholder="이메일" name="email">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="number">-
					<input type="text" name="number">-
					<input type="text" name="number">
				</td>
			</tr>
			<tr>
				<td>
					<p>영업일</p>
					<% String day = "월/화/수/목/금/토/일";
					for(int i=0;i<7;i++){ %>
						<%=day.split("/")[i] %><input type="checkbox" class="dayChk" name="day" value="<%=day.split("/")[i] %>"><br>
					<%} %>
				</td>
			</tr>
			<tr>
				<td>
					<textarea id="fransInfoTxtArea" rows="" cols="" name="info"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="완료"/>
					<input type="button" onclick="back()" value="취소"/>
				</td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b65c630b20a88d8456994b96ae1b5c7f&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function back() {
		location.href = "FranchiseeList?page=${param.page}";
	}
	
	$(".dayChk").on('click', function () {
		console.log($(this));
		if($(this).prop('checked')){
			$(this).after("<span><input type='time' name='start_time'/>~<input type='time' name='end_time'/></span>");
		}else{
			$(this).next().remove();
		}
	})
	
	//주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
	
	function search() {
		new daum.Postcode({
			oncomplete: function(data) {
				var addr = data.address; // 최종 주소 변수
				// 주소 정보를 해당 필드에 넣는다.
				document.getElementById("addr").value = addr;
			}
		}).open();
	}
</script>