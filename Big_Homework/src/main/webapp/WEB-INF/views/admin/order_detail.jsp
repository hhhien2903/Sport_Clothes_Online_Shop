<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>Chi Tiết ${title}</title>
<body>
	<div class="ts-main-content">
		<%@include file="/WEB-INF/views/layouts_master/admin/admin_menu.jsp"%>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="col-md-12">
						<h2 class="page-title">Chi Tiết ${title}</h2>
						<!-- Zero Configuration Table -->
						<div class="row">
							<div class="col-md-12">
								<div class="panel panel-default">
									<div class="panel-heading" style="color: black;">Chi Tiết ${title}</div>
									<div class="panel-body">
										<table class="table table-bordered table-striped">
											<thead>
												<tr>
													<th style="width: 30px; text-align: center;">#</th>
													<th style="width: 40px;text-align: center;">Mã Đơn Hàng</th>
													<th style="width: 40px;text-align: center;">Mã Sản Phẩm</th>
													<th style="width: 100px; text-align: center;">Hình Ảnh</th>
													<th style="width: 420px">Tên Sản Phẩm</th>
													<th>Đơn Giá</th>
													<th>Số Lượng</th>
													<th>Tổng Tiền</th>
												</tr>
							
											</thead>
											<tbody>
											<c:forEach items="${list}" var="listItem" varStatus="loop">
												<tr>
													<th scope="row" style="text-align: center;">${loop.index +1}</th>
													<td style="text-align: center;">${orderID}</td>
													<td style="text-align: center;"><a href="<c:url value="/product/product-detail?productID=${listItem.product.productID}"/>">${listItem.product.productID}</a></td>
													<td><img style="width: 100%" src="<c:url value="/assets/user/images/product_image/${listItem.product.listImages[0]}"/>"></td>
													<td><a href="<c:url value="/product/product-detail?productID=${listItem.product.productID}"/>">${listItem.product.productName}</a></td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${listItem.unitPrice}" /> đ</td>
													<td>${listItem.quantity}</td>
													<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${listItem.quantity * listItem.unitPrice}" /> đ</td>
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

