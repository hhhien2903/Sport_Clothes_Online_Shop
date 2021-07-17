<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<c:url value="/assets/user/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/user/css/font-awesome.min.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/user/css/prettyPhoto.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/user/css/price-range.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/user/css/animate.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/user/css/main.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/user/css/responsive.css"/>" rel="stylesheet">
<link href="<c:url value="/assets/user/css/all.min.css"/>" rel="stylesheet">
<link rel="shortcut icon" href="<c:url value="/assets/user/images/ico/favicon.ico"/>">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="<c:url value="/assets/user/images/ico/apple-touch-icon-144-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="<c:url value="/assets/user/images/ico/apple-touch-icon-114-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<c:url value="/assets/user/images/ico/apple-touch-icon-72-precomposed.png"/>">
<link rel="apple-touch-icon-precomposed" href="<c:url value="/assets/user/images/ico/apple-touch-icon-57-precomposed.png"/>">
<script src="<c:url value="/assets/user/js/jquery.js"/>"></script>
<script src="<c:url value="/assets/user/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/jquery.scrollUp.min.js"/>"></script>
<script src="<c:url value="/assets/user/js/price-range.js"/>"></script>
<script src="<c:url value="/assets/user/js/jquery.prettyPhoto.js"/>"></script>
<script src="<c:url value="/assets/user/js/main.js"/>"></script>
<title><decorator:title default="E-Shopper"/></title>
</head>
<body>
	<%@include file="/WEB-INF/views/layouts_master/user/header.jsp"%>
	<decorator:body />
	<%@include file="/WEB-INF/views/layouts_master/user/footer.jsp"%>
</body>
</html>