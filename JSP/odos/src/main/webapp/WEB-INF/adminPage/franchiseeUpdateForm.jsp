<%@page import="dto.FranchiseeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.franUpdateTitle{
	font-weight: 500;
	font-size: 30px;
}
table{
	border-collapse: collapse;
	/* width: 1200px; */
}
td{
	padding:5px;
	/* text-align: center; */
}
#fransInfoTxtArea{
	min-width: 95%;
}
</style>
<body>
	<p class="franUpdateTitle">가맹점 수정 페이지</p>
	<form action="FranchiseeUpdateReg" method="post" >
	<input type="hidden" name="page" value="${param.page }" />
	<table border="">
		<tbody>
			<tr>
				<td><input type="text" value="${dto.f_id}" name="id" readonly></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="매장명" value="${dto.f_name}" name="name"></td>
			</tr>
			<tr>
				<td>
					<input type="text" id="addr" placeholder="매장주소" value="${dto.f_addr}" name="addr" readonly>
					<input type="button" onclick="search()" value="주소 검색">
				</td>
			</tr>
			<tr>
				<td>
					<%String[] phone = ((FranchiseeDTO)request.getAttribute("dto")).getF_phone().split("-");%>
					<input type="text" name="number" value="<%=phone[0]%>">-
					<input type="text" name="number" value="<%=phone[1]%>">-
					<input type="text" name="number" value="<%=phone[2]%>">
				</td>
			</tr>
			<tr>
				<td>
					<p>영업일</p>
					<% String[] day = "월/화/수/목/금/토/일".split("/");
					String[] getDay = ((FranchiseeDTO)request.getAttribute("dto")).getF_day().split("/");
					String gday = "";
					String[] time = ((FranchiseeDTO)request.getAttribute("dto")).getF_time().split("/");
					String stime = "";
					String etime = "";
					for(int i=0;i<day.length;i++){ 
						for(int j=0;j<getDay.length;j++) {
							if(day[i].equals(getDay[j])){
								gday = getDay[j];
								stime = time[j].split("~")[0];
								etime = time[j].split("~")[1];
							}
						}
						if(day[i].equals(gday)){ %>
							<%=day[i] %><input type="checkbox" class="dayChk" name="day" value="<%=day[i] %>" checked><span><input type="time" value="<%=stime%>" name="start_time"/>~<input type="time" value="<%=etime%>" name="end_time"/></span><br>
						<%}else {%>
							<%=day[i] %><input type="checkbox" class="dayChk" name="day" value="<%=day[i] %>"><br>
						<%}%>
					<%} %>	
				</td>
			</tr>
			<tr>
				<td>
					<textarea id="fransInfoTxtArea" rows="" cols="" name="info">${dto.f_info}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정"/>
					<input type="button" onclick="back()" value="뒤로"/>
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