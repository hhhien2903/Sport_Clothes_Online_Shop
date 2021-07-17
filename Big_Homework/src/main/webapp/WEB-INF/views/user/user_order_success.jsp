<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Đặt Hàng Thành Công</title>
</head>
<body>
	<div align="center" style="margin-top: 80px;margin-bottom: 150px">
		<h2>ĐẶT HÀNG THÀNH CÔNG!</h2>
		<a href="<c:url value="/"/>" class="btn btn-default check_out" style="margin-left: 0px">Tiếp Tục Mua Sắm</a>
		<a href="<c:url value="/user/all-orders"/>" class="btn btn-default check_out" style="margin-left: 5px">Xem Các Đơn Hàng Đang Đặt</a>
	</div>
</body>
