<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>ĐƠN HÀNG ĐANG ĐẶT</title>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<%@include file="/WEB-INF/views/layouts_master/user/user_menu.jsp"%>
				</div>
				<div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">ĐƠN HÀNG ĐANG ĐẶT</h2>
						
						<section id="cart_items" style="margin-bottom: 50px;">	
								<div class="table-responsive cart_info" style="margin-bottom: 0px;">
									<table class="table table-condensed" style="margin-bottom: 0px">
										<thead>
											<tr class="cart_menu">
												<td class="#" style="width: 5%; padding-left: 10px;">#</td>
												<td class="#" style="width: 30%;">ID Đơn Hàng</td>
												<td class="" style="width: 25%;">Ngày Đặt</td>
												<td class="" style="width: 25%;">Trạng Thái</td>
												<td class="">Huỷ Đơn Hàng</td>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${listOrders}" var="orderItem" varStatus="i">
										<tr>
											<td>${i.index + 1}</td>
											<td><a href="<c:url value="/user/order-detail?orderID=${orderItem.orderID}"/>">${orderItem.orderID}</a></td>
											<td><fmt:formatDate pattern="dd/MM/yyyy" value="${orderItem.orderDate}"/></td>
											<td>${orderItem.orderStatus}</td>
											<c:url value="/user/deleteOrder?orderID=${orderItem.orderID}" var="deleteUrl"/>
											<c:if test="${orderItem.orderStatus ne 'Đang Xử Lý'}">
												<c:url value="/user/all-orders" var="deleteUrl"/>
											</c:if>
											<td class="cart_delete" style="text-align: center;"><a class="cart_quantity_delete" href="${deleteUrl}"><i class="fa fa-times"></i></a></td>
										</tr>
										</c:forEach>	
										</tbody>
									</table>
								</div>
						</section>	
					</div>
				</div>
			</div>
		</div>
	</section>
</body>