<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<meta name="viewport" content="width=320, initial-scale=1.0">
<title>하루한잔</title>
<style>
.mainPageDiv{
	display: flex;
	flex-direction: column;
}
.top{
	width: 100%;
	height: 170px;
	position: fixed;
	top: 0px;
	background: #fff;
	z-index: 1;
}
.main{
	width: 100%;
	min-height: 100%;
	position: relative;
	top: 180px;
}
.bottom{
	width: 100%;
	height: 100%;
	bottom: 0;
	position: relative;
	top: 250px;
}
</style>
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script>

</script>
</head>
<body style="margin: 0px 0px">
<div class="mainPageDiv">
	<div class="top"><jsp:include page="main_top.jsp" /></div>
	<div class="main"><jsp:include page="${mainUrl }" /></div>
	<div class="bottom"><jsp:include page="main_bottom.jsp" /></div>
	</div>
</body>

</html>