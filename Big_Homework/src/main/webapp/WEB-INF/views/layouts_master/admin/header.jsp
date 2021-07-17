<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="brand clearfix">
		<a href="<c:url value="/admin/dashboard"/>" class="logo"><img src="<c:url value="/assets/admin/img/logo.jpg"/>" class="img-responsive" alt=""></a>
		<span class="menu-btn"><i class="fa fa-bars"></i></span>
		<ul class="ts-profile-nav">
			<li class="ts-account">
				<a href="#"><img src="<c:url value="/assets/admin/img/ts-avatar.jpg"/>" class="ts-avatar hidden-side" alt="">Xin Chào! ${loggedAdmin.userName}<i class="fa fa-angle-down hidden-side"></i></a>
				<ul>
					<li><a href="<c:url value="/user/logout"/>">Đăng Xuất</a></li>
				</ul>
			</li>
		</ul>
</div>