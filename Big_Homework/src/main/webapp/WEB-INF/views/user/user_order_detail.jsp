<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta charset="UTF-8">
<title>CHI TIẾT ĐƠN HÀNG</title>
</head>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<%@include file="/WEB-INF/views/layouts_master/user/user_menu.jsp"%>
				</div>
				<div class="col-sm-9 padding-right" style="margin-bottom: 100px">
					<div class="features_items">
						<!--features_items-->
						<h2 class="title text-center">CHI TIẾT ĐƠN HÀNG</h2>
						<section id="cart_items" style="margin-bottom: 50px;">
						<div class="step-one">
							<h2 class="heading" style="margin-bottom: 20px">Thông Tin Đặt Hàng</h2>
						</div>
							<div class="shopper-informations" style="padding-left: 15px">
								<div class="row">
									<div class="col-sm-5">
										<div class="shopper-info">
											<p>Người Đặt Hàng</p>
											<div class="form-one" style="width: 100%;">
												<label for="ordererName">Họ và tên:</label>
												<input id="ordererName" type="text" readonly="readonly" value="${order.ordererName}">
												<label for="ordererPhoneNumber">Số điện thoại:</label>
												<input id="ordererPhoneNumber" type="text" readonly="readonly" value="${order.ordererPhoneNumber}"> 
												<label for="orderDate">Ngày đặt hàng:</label> 
												<input id="orderDate" type="text" readonly="readonly" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${order.orderDate}"/>">
											</div>
										</div>
									</div>
									<div class="col-sm-6 clearfix">
										<div class="bill-to">
											<p>Người Nhận</p>
											<div class="form-one" style="width: 100%;">
												<label for="receiverName">Họ và tên:</label>
												<input id="ordererName" type="text" readonly="readonly" value="${order.receiverName}">
												<label for="receiverPhoneNumber">Số điện thoại:</label>
												<input id="receiverPhoneNumber" type="text" readonly="readonly" value="${order.receiverPhoneNumber}"> 
												<label for="receiverAddress">Địa chỉ:</label> 
												<input id="receiverAddress" type="text" readonly="readonly" value="${order.receiverAddress}">
											</div>

										</div>
									</div>
								</div>
							</div>
							<div class="step-one">
								<h2 class="heading" style="margin-bottom: 20px">Thông Tin
									Sản Phẩm</h2>
							</div>
							<div class="table-responsive cart_info"
								style="margin-bottom: 0px;">
								<table class="table table-condensed" style="margin-bottom: 0px">
									<thead>
										<tr class="cart_menu">
											<td class="#" style="padding-left: 15px;">#</td>
											<td class="image" style="padding-left: 15px">Sản phẩm</td>
											<td class="description" style="width: 370px"></td>
											<td class="price">Đơn giá</td>
											<td class="quantity">Số lượng</td>
											<td class="total" style="text-align: center;">Tổng</td>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="orderDetailItem" items="${listOrderDetails}"
											varStatus="i">
											<tr>
												<td style="padding-left: 15px; font-size: 20px">${i.index + 1}</td>
												<td class="cart_product"><a
													href="<c:url value="/product/product-detail?productID=${orderDetailItem.product.productID}"/>"><img
														src="<c:url value="/assets/user/images/product_image/${orderDetailItem.product.listImages[0]}"/>"
														alt="" style="width: 100px; height: 100px"></a></td>
												<td class="cart_description" style="padding-right: 10px">
													<h4>
														<a
															href="<c:url value="/product/product-detail?productID=${orderDetailItem.product.productID}"/>">${orderDetailItem.product.productName}</a>
													</h4>
												</td>
												<td class="cart_price">
													<p>
														<fmt:formatNumber type="number" maxFractionDigits="3"
															value="${orderDetailItem.product.unitPrice}" />
														đ
													</p>
												</td>
												<td class="cart_quantity">
													<p
														style="color: #696763; font-size: 18px; margin-bottom: 0px; margin-left: 20px">${orderDetailItem.quantity}</p>
												</td>
												<td class="cart_total">
													<p class="cart_total_price">
														<fmt:formatNumber type="number" maxFractionDigits="3"
															value="${orderDetailItem.quantity * orderDetailItem.product.unitPrice}" />
														đ
													</p>
												</td>
											</tr>
										</c:forEach>

										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td colspan="3"><p
													style="font-size: 24px; color: #FE980F; margin-top: 10px; margin-right: 10px; text-align: right;">
													Thành Tiền:
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${order.orderTotal}" />
													đ
												</p></td>
										</tr>
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