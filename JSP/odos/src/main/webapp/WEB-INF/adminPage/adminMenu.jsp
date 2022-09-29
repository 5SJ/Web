<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	li>a{
		text-decoration: none;
		color : white;
		font-weight: bold;
	}
</style>
<div id="menu">
	<div>
		<ul>
			<li><a href="CateList">카테고리 관리</a></li>
			<li><a href="ProdList?page=1">상품 관리</a></li>
			<li><a href="Inventory">재고 관리</a></li>
			<li><a href="OrderList?page=1">주문 관리</a></li>
			<li><a href="PayManagement">결제 관리</a></li>
			<li><a href="SalesManage">매출 관리</a></li>
			<li><a href="MemberList?page=1">회원 관리</a></li>
			<li><a href="FranchiseeList">가맹점 관리</a></li>
			<li><a href="../main/MainPage">메인페이지</a></li>
			<li><a href="../main/LogoutReg">로그아웃</a></li>
		</ul>
	</div>
</div>
