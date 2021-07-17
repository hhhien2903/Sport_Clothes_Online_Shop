<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<%@include
					file="/WEB-INF/views/layouts_master/user/categories_brands.jsp"%>
			</div>

			<div class="col-sm-9 padding-right" style="margin-bottom: 25px">
				<div class="features_items">
					<!--features_items-->
					<h2 class="title text-center">${nameBySelection}</h2>
					<c:if test="${not empty supplierNameSelection}">
						<h2 class="title text-center">${supplierNameSelection}</h2>
					</c:if>
					<c:forEach items="${listProducts}" var="productItem">
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<a
											href="<c:url value="/product/product-detail?productID=${productItem.productID}"/>"><img
											src="<c:url value="/assets/user/images/product_image/${productItem.listImages.iterator().next()}"/>"
											alt="" /></a>
										<h2>
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${productItem.unitPrice}" />
											đ
										</h2>
										<p>${productItem.productName}</p>
										<a href="<c:url value="/cart/add?productID=${productItem.productID}"/>" class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Add to cart</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<!--features_items-->
				<div class="page-navigation" align="center">
				<c:choose>
					<c:when test="${numberOfProduct % 9 != 0}">
						<c:set var="numberOfPage" value="${numberOfProduct / 9 + 1}"/>
						<c:forEach  var="pageID" begin = "1" end="${numberOfPage}">
							<a href="<c:url value="/product/${pageID}/category-supplier?categoryID=${categoryID}&supplierID=${supplierID}"/>" style="padding: 7px 10px; border: 1px solid #B3AFA8">${pageID}</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
					<c:set var="numberOfPage" value="${numberOfProduct / 9}"/>
						<c:forEach  var="pageID" begin = "1" end="${numberOfPage}">
							<a href="<c:url value="/product/${pageID}/category-supplier?categoryID=${categoryID}&supplierID=${supplierID}"/>" style="padding: 7px 10px; border: 1px solid #B3AFA8">${pageID}</a>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</div>
</section>