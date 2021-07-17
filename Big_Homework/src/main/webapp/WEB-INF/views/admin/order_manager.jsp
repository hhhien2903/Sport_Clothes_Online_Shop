<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Quản Lý ${title}</title>
<body>
	<div class="ts-main-content">
		<%@include file="/WEB-INF/views/layouts_master/admin/admin_menu.jsp"%>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="col-md-12">
						<h2 class="page-title">Quản Lý ${title}</h2>
						<!-- Zero Configuration Table -->
						
						<div class="row" style="margin-bottom: 20px">
							<div class="col-md-4 col-md-offset-8">
								<form method="GET" action="<c:url value = "/admin/order/search"/>">
									<div class="search_box pull-right">
										<input type="text" name="input" placeholder="Tìm Kiếm">
											<button style="padding: 6px 12px;" type="submit" class="btn btn-inputSearch"><i class="fa fa-search"></i></button>
									</div>
								</form>	
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading" style="color: black;">Bảng ${title}</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th style="width: 30px; text-align: center;">#</th>
													<th style="width: 40px;text-align: center;">Mã Đơn Hàng</th>
													<th style="width: 40px;text-align: center;">Mã Khách Hàng</th>
													<th>Tên Người Đặt</th>
													<th>SĐT Người Đặt</th>
													<th>Ngày Đặt</th>
													<th>Tên Người Nhận</th>
													<th>SĐT Người Nhận</th>
													<th>Địa Chỉ Người Nhận</th>
													<th>Tổng Tiền</th>
													<th>Trạng Thái</th>
													<th colspan="2" style="text-align: center;">Sửa/Xoá</th>
												</tr>
							
											</thead>
											<tbody>
											<c:forEach items="${list}" var="listItem" varStatus="loop">
												<tr>
													<th scope="row" style="text-align: center;">${loop.index +1}</th>
													<td style="text-align: center;"><a href="<c:url value="/admin/order/view-detail?orderID=${listItem.orderID}"/>">${listItem.orderID}</a></td>
													<td style="text-align: center;">${listItem.customer.customerID}</td>
													<td>${listItem.ordererName}</td>
													<td>${listItem.ordererPhoneNumber}</td>
													<td><fmt:formatDate pattern="dd/MM/yyyy" value="${listItem.orderDate}"/></td>
													<td>${listItem.receiverName}</td>
													<td>${listItem.receiverPhoneNumber}</td>
													<td>${listItem.receiverAddress}</td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${listItem.orderTotal}" /> đ</td>
													<td>${listItem.orderStatus}</td>
													<td style="text-align: center;"><a href="<c:url value="/admin/order/edit?orderID=${listItem.orderID}"/>" class="btn btn-primary" style="padding: 5px 10px; font-size: 15px;"><i class="fa fa-edit"></i></a></td>
													<td style="text-align: center;"><a href="<c:url value="/admin/order/delete?orderID=${listItem.orderID}"/>" class="btn btn-danger" style="padding: 5px 10px; font-size: 15px;"><i class="fas fa-trash-alt"></i></a></td>
											
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>

