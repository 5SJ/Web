<%@page import="dto.FranchiseeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.franchMo{
	width: 1050px;
	margin: 0 auto;
	display: flex;
}
.franchMo form{
	margin: 0 auto;
}
.franchMo td{
	border-bottom: 2px solid rgba(245,245,245);
}
.franchMo input{
	border: none;
	font-size: 16px;
	width: 120px;
	margin-right: 10px;
	font-weight: 500;
}
.franchMo textarea{
	margin-top: 5px;
}
.franchMoBtn input{
	background-color: #88001b;
	color: white;
	border: 1px white;
	height: 30px;
}
#addr{
	width: 200px;
}
#addname{
	width: 200px;
}

@media screen and (max-width: 500px) {
	.asd{
  	width: 412px;
  	}
  	.franchMo{
  		width: 100%;
  	}
  	.franchMo .dayChk{
	border: none;
	width: 90px;
	margin-right: 10px;
	font-weight: 700;
	}
	.franchMo input{
	border: none;
	font-size: 16px;
	width: 100px;
	margin-right: 10px;
	font-weight: 500;
}
  		
}

</style>

<div class="asd">
<h2 align="center">가맹점 수정 페이지</h2>
<div class="franchMo">
<form action="FranchiseeModifyReg" method="post" >
<table>
	<tbody>
		<tr>
			<td><input type="text" value="${dto.f_id}" name="id" readonly></td>
		</tr>
		<tr>
			<td><input type="password" name="pw" placeholder="비밀번호 입력"></td>
		</tr>
		<tr>
			<td><input type="text" id="addname" placeholder="매장명" value="${dto.f_name}" name="name" readonly></td>
		</tr>
		<tr>
			<td>
				<input type="text" id="addr" placeholder="매장주소" value="${dto.f_addr}" name="addr" readonly>
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
			<td align="center">
				<textarea rows="3" cols="30" name="info">${dto.f_info}</textarea>
			</td>
		</tr>
		<tr>
			<td align="center" class="franchMoBtn">
				<input type="submit" value="수정"/>
				<input type="button" onclick="back()" value="취소"/>
			</td>
		</tr>
	</tbody>
</table>
</form>
</div>
</div>


<script>
	function back() {
		location.href = "FranchiseePage";
	}
	
	$(".dayChk").on('click', function () {
		if($(this).prop('checked')){
			$(this).after("<span><input type='time' name='start_time'/>~<input type='time' name='end_time'/></span>");
		}else{
			$(this).next().remove();
		}
	})
</script>