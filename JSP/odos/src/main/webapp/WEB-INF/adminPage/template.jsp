<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body{
	margin: 0px 0px;
}
#menu {
	position: absolute;
	width: 250px;
	height: 100%;
	min-height: 100%;
	float: left;
	left: 0px;
	top: 0px;
	background-color: #681f1f;
	min-width: 200px;
}

#content {
	position: absolute;
	/* width: 85%; */
	/* height: 100%; */
	min-height:100%;
	left: 300px;
	top: 0px;
}

</style>
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
</head>
<body>

<div class="adminMenuWrapper">
	<jsp:include page="adminMenu.jsp" />
</div>

<div>
	<div id="content">
		<jsp:include page="${content}" />
	</div>
</div>

</body>
</html>