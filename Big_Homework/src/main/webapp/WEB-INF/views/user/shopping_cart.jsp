<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Giỏ Hàng</title>
<section id="cart_items" style="margin-bottom: 50px;">
<form method="POST" action="<c:url value="/cart/edit"/>">
	<div class="container">
		<div class="table-responsive cart_info" style="margin-bottom: 0px;">
			<table class="table table-condensed" style="margin-bottom: 0px">
				<thead>
					<tr class="cart_menu">
						<td class="#" style="padding-left: 15px;">#</td>
						<td class="image" style="padding-left: 15px">Sản phẩm</td>
						<td class="description" style="width: 470px"></td>
						<td class="quantityInStock">SL Kho</td>
						<td class="price">Đơn giá</td>
						<td class="quantity">Số lượng</td>
						<td class="total">Tổng</td>
						<td></td>
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
						<td class="quantityInStock"><p class="quantityInStockNumber">${map.value.product.quantityInStock}</p></td>
						<td class="cart_price">
							<p><fmt:formatNumber type = "number" maxFractionDigits="3" value ="${map.value.product.unitPrice}"/> đ</p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button" style="margin-bottom: 5px">
								<span style="font-size: 25px; cursor: pointer; user-select: none; color: #FE980F; font-weight: 500;" class="down">-</span>
								<input class="inputQuantity" style="width: 40px; height: 30px; outline: medium none; border: 1px solid #DEDEDC; text-align: center; font-size: 18px; font-weight: 500; color: #696763; margin-left: 3px; margin-right: 3px;"
									type="text" name="quantity" value="${map.value.quantity}">
								<span style="font-size: 25px; cursor: pointer; user-select: none; color: #FE980F; font-weight: 500;" class="up">+</span>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price"><fmt:formatNumber type = "number" maxFractionDigits="3" value ="${map.value.quantity * map.value.product.unitPrice}"/> đ</p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href="<c:url value="/cart/delete?productID=${map.value.product.productID}"/>"><i class="fa fa-times"></i></a></td>
					</tr>
					</c:forEach>
					
					<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td colspan="2"><p style="font-size: 24px; color: #FE980F; text-align: right; margin-top: 10px">Thành Tiền: <fmt:formatNumber type = "number" maxFractionDigits="3" value ="${sessionScope.myCartTotal}"/> đ</p></td>
					</tr>
				</tbody>
				
			</table>
		
		</div>
		<div style="margin: 0px; float: right;">
			<!--  <a type="submit" class="btn btn-default update" href="">Update</a>-->
			 <input class="btn btn-default update" type="submit" value="Cập Nhật Giỏ Hàng" />
			 <a
				class="btn btn-default check_out" href="<c:url value="/user/checkout"/>">Check Out</a>
		</div>
 	
	</div>
	</form>
</section>

