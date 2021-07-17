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
<link rel="stylesheet" href="<c:url value="/assets/admin/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/admin/css/dataTables.bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/admin/css/bootstrap-social.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/admin/css/bootstrap-select.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/admin/css/fileinput.min.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/admin/css/awesome-bootstrap-checkbox.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/admin/css/style.css"/>">
<link href="<c:url value="/assets/admin/css/all.min.css"/>" rel="stylesheet">
<script src="<c:url value="/assets/admin/js/jquery.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/bootstrap-select.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/dataTables.bootstrap.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/Chart.min.js"/>"></script>
<script src="<c:url value="/assets/admin/js/fileinput.js"/>"></script>
<script src="<c:url value="/assets/admin/js/chartData.js"/>"></script>
<script type="text/javascript" src="<c:url value="/assets/admin/js/bootstrap-filestyle.min.js"/>"> </script>
<script src="<c:url value="/assets/admin/js/main.js"/>"></script>
<title><decorator:title default="Admin E-Shopper" /></title>
</head>
<body>
	<%@include file="/WEB-INF/views/layouts_master/admin/header.jsp"%>
	<decorator:body />
</body>
</html>