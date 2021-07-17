<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<header id="header">
	<!--header-->
	
	<div class="header-middle">
		<!--header-middle-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="logo pull-left">
						<a href="<c:url value="/"/>"><img
							src="<c:url value="/assets/user/images/home/logo.png"/>" alt="" /></a>
					</div>

				</div>
				<div class="col-sm-8">
					<div class="shop-menu pull-right">
						<ul class="nav navbar-nav">
							<security:authorize access="!isAuthenticated()">
								<li><a href="<c:url value="/user-login"/>"><i class="fas fa-sign-in-alt"></i> Đăng Nhập</a></li>
								<li><a href="<c:url value="/register"/>"><i class="fa fa-user-plus"></i> Đăng Ký</a></li>
							</security:authorize>
							<security:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="<c:url value="/admin/dashboard"/>"><i class="fas fa-user-cog"></i>Quản Lý</a></li>
							</security:authorize>
							<security:authorize access="isAuthenticated()">
								<li><a href="<c:url value="/user/info"/>"><i class="fa fa-user"></i> Tài Khoản</a></li>
   								<li><a href="<c:url value="/user/logout"/>"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a></li>
							</security:authorize>
   						
							<li><a href="<c:url value="/cart/view-cart"/>"><i class="fa fa-shopping-cart"></i>Giỏ Hàng <c:if test="${not empty sessionScope.myCartNum && sessionScope.myCartNum != 0}">(${sessionScope.myCartNum})</c:if></a></li>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/header-middle-->

	<div class="header-bottom">
		<!--header-bottom-->
		<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div class="mainmenu pull-left">
						<ul class="nav navbar-nav collapse navbar-collapse">
							<li><a href="<c:url value="/"/>" class="active">Trang Chủ</a></li>
							<li><a href="<c:url value="/product/all-products/1"/>" class="">Tất cả sản phẩm</a></li>
							<li class="dropdown"><a href="#">Danh mục<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<c:forEach items="${listCategories}" var="categoryItem">
										<li><a href="<c:url value ="/product/1/category?categoryID=${categoryItem.categoryID}"/>">${categoryItem.categoryName}</a></li>
									</c:forEach>
								</ul></li>
							<li class="dropdown"><a href="#">Thương Hiệu<i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<c:forEach items="${listSuppliers}" var="supplierItem">
										<li><a href="<c:url value="/product/1/supplier?supplierID=${supplierItem.supplierID}"/>">${supplierItem.supplierName}</a></li>
									</c:forEach>
								</ul></li>
							<!--  <li><a href="404.html">404</a></li>-->
							<li><a href="<c:url value="/about-us"/>">Về Chúng Tôi</a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-3">
				<form method="get" action="<c:url value = "/product/1/search"/>">
					<div class="search_box pull-right">
						<input type="text" name="input" 
						placeholder="<c:choose><c:when test = "${not empty sessionScope.inputString}">${sessionScope.inputString}</c:when><c:otherwise>Tìm Kiếm</c:otherwise>
						</c:choose>"/>
						<button type="submit" class="btn">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>	
				</div>
			</div>
		</div>
	</div>
	<!--/header-bottom-->
</header>
<!--/header-->