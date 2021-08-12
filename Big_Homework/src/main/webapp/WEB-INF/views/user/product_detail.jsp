<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container" style="margin-bottom: 30px">
	<div class="row">
		<div class="col-sm-3">
			<%@include
				file="/WEB-INF/views/layouts_master/user/categories_brands.jsp"%>
		</div>
		<div class="col-sm-9 padding-right">
			<div class="product-detail">
				<!--product-details-->
				<div class="col-sm-5">
					<div class="view-product">
						<img id="image_large"
							src="<c:url value="/assets/user/images/product_image/${product.listImages[0]}"/>" />

					</div>
					<div id="similar-product" class="carousel slide"
						data-ride="carousel">

						<!-- Wrapper for slides -->
						<div class="carousel-inner" id="image_thumb" align="center">
							<div class="item active">
								<c:forEach var="imageItem" begin="0" end="2">
									<c:if test="${not empty product.listImages[imageItem]}">
										<a><img
											src="<c:url value="/assets/user/images/product_image/${product.listImages[imageItem]}"/>"></a>
									</c:if>
								</c:forEach>
							</div>
							<c:if test="${fn:length(product.listImages) >3}">
								<c:forEach var="imageItem" begin="3" end="${fn:length(product.listImages)-1}">
									<c:if test="${imageItem % 3 == 0}">
										<div class="item">
											<c:forEach var="i" begin="${imageItem}" end="${imageItem + 2}">
												<c:if test="${not empty product.listImages[i]}">
													<a><img src="<c:url value="/assets/user/images/product_image/${product.listImages[i]}"/>"></a>
												</c:if>
											</c:forEach>
										</div>
									</c:if>
								</c:forEach>
							</c:if>
							<!--  <div class="item">
								
							</div>-->


						</div>

						<!-- Controls -->
						<a class="left item-control" href="#similar-product"
							data-slide="prev"> <i class="fa fa-angle-left"></i>
						</a> <a class="right item-control" href="#similar-product"
							data-slide="next"> <i class="fa fa-angle-right"></i>
						</a>
					</div>

				</div>
				<div class="col-sm-7">
					<div class="product-information">
					<form method="POST" action="<c:url value="/cart/addInDetail"/>">
						<h2>${product.productName}</h2>
						<input type="hidden" name="productID" value="${product.productID}">
						<span style="width: 100%;">
						<span style="width: 100%;"><fmt:formatNumber type="number"
									maxFractionDigits="3" value="${product.unitPrice}" /> đ</span>
						<label style="font-size: 20px;">Số Lượng:</label>
										<span style="font-size:25px ;float: none; margin-right: 0; cursor: pointer;user-select: none;" class="down" onClick='decreaseCount(event, this)'>-</span>
										<input id="inputQuantity" name="quantity" style="width: 53px;height: 30px; margin-left: 3px; margin-right: 3px; " type="text" value="1">
										<span style="font-size:25px ;float: none; margin-right: 0; cursor: pointer;user-select: none;" class="up"  onClick='increaseCount(event, this)'>+</span>
							
						</span>
						<c:if test="${product.quantityInStock > 0}">
						<button id="btnAddToCart" type="submit" class="btn btn-fefault cart" style="margin-left: 0px;">
									<i class="fa fa-shopping-cart" style="margin-right: 2px"></i>
									Thêm vào giỏ hàng 
								</button>
						</c:if>
						<c:if test="${product.quantityInStock == 0}">
						<button id="btnAddToCart" class="btn btn-fefault cart" style="margin-left: 0px;">
									<i class="fa fa-shopping-cart" style="margin-right: 2px"></i>
									Hết hàng 
								</button>
						</c:if>
						</form>
						<p>
							<b>Số Lượng Trong Kho:</b> <span id="quantityInStock" style="margin: 0px">${product.quantityInStock}</span>
						</p>
						<p>
							<b>Thương Hiệu:</b> ${product.supplier.supplierName}
						</p>

					</div>
					<!--/product-information-->
				</div>
			</div>
			<!--/product-details-->

			<div class="category-tab shop-details-tab">
				<!--category-tab-->
				<div class="col-sm-12">
					<ul class="nav nav-tabs">
						<!-- <li><a href="#details" data-toggle="tab">Details</a></li>
								<li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>
								<li><a href="#tag" data-toggle="tab">Tag</a></li> -->
						<li class="active"><a href="#detail" data-toggle="tab">MÔ TẢ SẢN PHẨM</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade active in" id="detail">
						<div class="col-sm-12">
							<p>${product.description}</p>
						</div>
					</div>

				</div>
			</div>
			<!--/category-tab-->
		</div>
	</div>
</div>