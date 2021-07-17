<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="left-sidebar">
	<h2>CHỨC NĂNG</h2>
	<div class="panel-group category-products" id="accordian">

		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="<c:url value="/user/info"/>">THÔNG TIN CÁ NHÂN</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordian" href="#order">
						<span class="badge pull-right"><i class="fa fa-plus"></i></span>
						THÔNG TIN ĐƠN HÀNG
					</a>
				</h4>
			</div>
			<div id="order" class="panel-collapse collapse">
				<div class="panel-body">
					<ul>
						<li><a href="<c:url value="/user/all-orders"/>">ĐƠN HÀNG ĐANG ĐẶT</a></li>
						<li><a href="<c:url value="/user/order-history"/>">LỊCH SỬ ĐẶT HÀNG</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="<c:url value="/user/logout"/>">ĐĂNG XUẤT</a>
				</h4>
			</div>
		</div>
	</div>
</div>