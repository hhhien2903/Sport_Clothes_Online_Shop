<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
</head>
<section id="cart_items" style="margin-bottom: 50px;">
<form:form method="POST" action="confirm-checkout" modelAttribute="order"> 
	<div class="container">
		<div class="step-one">
			<h2 class="heading">Điền Thông Tin</h2>
		</div>
		<div class="shopper-informations">
			<div class="row">
				<div class="col-sm-4">
					<div class="shopper-info">
						<p>Người Đặt Hàng</p>
						<div class="form-one" style="width: 100%;">
							<form:input path="ordererName" placeholder="Họ Và Tên" value="${loggedUser.customer.fullName}"/>
							<form:errors path="ordererName" cssClass="text-danger" htmlEscape="false"/>
							<form:input path="ordererPhoneNumber" placeholder="Số Điện Thoại" value="${loggedUser.customer.phoneNumber}"/>
							<form:errors path="ordererPhoneNumber" cssClass="text-danger" htmlEscape="false"/>
						</div>
					</div>
				</div>
				<div class="col-sm-4 clearfix">
					<div class="bill-to">
						<p>Người Nhận</p>
						<div class="form-one" style="width: 100%;">
							<form:input path="receiverName" placeholder="Họ Và Tên"/>
							<form:errors path="receiverName" cssClass="text-danger" htmlEscape="false"/>
							
							<form:input path="receiverPhoneNumber" placeholder="Số Điện Thoại"/>
							<form:errors path="receiverPhoneNumber" cssClass="text-danger" htmlEscape="false"/>
							
							<form:input path="receiverAddress" placeholder="Địa Chỉ"/>
							<form:errors path="receiverAddress" cssClass="text-danger" htmlEscape="false"/>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="step-one">
			<h2 class="heading">Kiểm Tra Đơn Hàng</h2>
		</div>

		<div class="table-responsive cart_info" style="margin-bottom: 0px;">
			<table class="table table-condensed" style="margin-bottom: 0px">
				<thead>
					<tr class="cart_menu">
						<td class="#" style="padding-left: 15px;">#</td>
						<td class="image" style="padding-left: 15px">Sản phẩm</td>
						<td class="description" style="width: 470px"></td>
						<td class="price">Đơn giá</td>
						<td class="quantity">Số lượng</td>
						<td class="total">Tổng</td>
					</tr>
				</thead>
				<tbody>
				
				<c:forEach var="map" items="${sessionScope.myCartItems}" varStatus="i">
					<tr>
						<td style="padding-left: 15px; font-size: 20px">${i.index + 1}</td>
						<td class="cart_product">
						<a href="<c:url value="/product/product-detail?productID=${map.value.product.productID}"/>"><img
								src="<c:url value="/assets/user/images/product_image/${map.value.product.listImages[0]}"/>" alt="" style="width: 100px; height: 100px"></a></td>
						<td class="cart_description" style="padding-right:10px">
							<h4>
								<a href="<c:url value="/product/product-detail?productID=${map.value.product.productID}"/>">${map.value.product.productName}</a>
							</h4>
							 <input type="hidden" name="productID" value="${map.value.product.productID}">
						</td>
						<td class="cart_price">
							<p><fmt:formatNumber type = "number" maxFractionDigits="3" value ="${map.value.product.unitPrice}"/> đ</p>
						</td>
						<td class="cart_quantity">
							<p style="color: #696763; font-size: 18px; margin-bottom: 0px; margin-left: 20px">${map.value.quantity}</p>
						</td>
						<td class="cart_total">
							<p class="cart_total_price"><fmt:formatNumber type = "number" maxFractionDigits="3" value ="${map.value.quantity * map.value.product.unitPrice}"/> đ</p>
						</td>
					</tr>
					</c:forEach>
					
					<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td colspan="2"><p style="font-size: 24px; color: #FE980F; margin-top: 10px;">Thành Tiền: <fmt:formatNumber type = "number" maxFractionDigits="3" value ="${sessionScope.myCartTotal}"/> đ</p></td>
					</tr>
				</tbody>
				
			</table>
		
		</div>
		<div style="margin: 0px; float: right;">
		
			 <a class="btn btn-default update" href='<c:url value="/cart/view-cart"/>'>Quay Lại Giỏ Hàng</a>
			 <input class="btn btn-default check_out" type="submit" value="Xác Nhận Đặt Hàng"/>
		</div>
	</div>
	</form:form>
</section>
<!--/#cart_items-->
