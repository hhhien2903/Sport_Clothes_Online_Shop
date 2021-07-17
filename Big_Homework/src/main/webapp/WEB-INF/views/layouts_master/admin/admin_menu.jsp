<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="ts-sidebar">
	<ul class="ts-sidebar-menu">
		<li class="ts-label"></li>
		
		<li class="ts-label">Chức năng</li>
		<li><a href="<c:url value="/admin/dashboard"/>"><i class="fas fa-chart-bar"></i>Thống Kê</a></li>
		<li><a href="<c:url value="/admin/category"/>"><i class="fa fa-list-alt"></i>Danh Mục</a>
			<ul>
				<li><a href="<c:url value="/admin/category/add"/>">Thêm Danh Mục Mới</a></li>
				<li><a href="<c:url value="/admin/category"/>">Quản Lý Danh Mục</a></li>
			</ul>
		</li>
		<li><a href="<c:url value="/admin/supplier"/>"><i class="fas fa-truck"></i>Nhà Cung Cấp</a>
			<ul>
				<li><a href="<c:url value="/admin/supplier/add"/>">Thêm Nhà Cung Cấp Mới</a></li>
				<li><a href="<c:url value="/admin/supplier"/>">Quản Lý Nhà Cung Cấp</a></li>
			</ul>
		</li>
		<li><a href="<c:url value="/admin/product"/>"><i class="fa fa-cubes"></i>Sản Phẩm</a>
			<ul>
				<li><a href="<c:url value="/admin/product/add"/>">Thêm Sản Phẩm Mới</a></li>
				<li><a href="<c:url value="/admin/product"/>">Quản Lý Sản Phẩm</a></li>
			</ul>
		</li>
		<li><a href="<c:url value="/admin/order"/>"><i class="fas fa-boxes"></i>Đơn Hàng</a></li>
		<li><a href="<c:url value="/admin/user-manager"/>"><i class="fa fa-users"></i>Người Dùng</a>
			<ul>
				<li><a href="<c:url value="/admin/account/add"/>">Thêm Người Dùng Mới</a></li>
				<li><a href="<c:url value="/admin/account"/>">Quản Lý Người Dùng</a></li>
			</ul>
		</li>
		<li><a href="<c:url value="/"/>"><i class="fas fa-store"></i>Quay Lại Cửa Hàng</a></li>
	</ul>
</nav>