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
								<form method="GET" action="<c:url value = "/admin/product/search"/>">
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
													<th style="width: 40px">Mã Sản Phẩm</th>
													<th style="width: 100px; text-align: center;">Hình Ảnh</th>
													<th style="width: 420px">Tên Sản Phẩm</th>
													<th style="width: 50px; text-align: center;">Số Lượng Tồn</th>
													<th style="text-align: center;">Đơn Giá</th>
													<th>Danh Mục</th>
													<th>Nhà Cung Cấp</th>
													<th>Trạng Thái</th>
													<th colspan="2" style="text-align: center;">Sửa/Xoá</th>
												</tr>
							
											</thead>
											<tbody>
											<c:forEach items="${list}" var="listItem" varStatus="loop">
												<tr>
													<th scope="row" style="text-align: center;">${loop.index +1}</th>
													<td style="text-align: center;">${listItem.productID}</td>
													<td><img style="width: 100%" src="<c:url value="/assets/user/images/product_image/${listItem.listImages[0]}"/>"></td>
													<td><a href="<c:url value="/product/product-detail?productID=${listItem.productID}"/>">${listItem.productName}</a></td>
													<td style="text-align: center;">${listItem.quantityInStock}</td>
													<td style="text-align: center;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${listItem.unitPrice}" /> đ</td>
													<td>${listItem.category.categoryName}</td>
													<td>${listItem.supplier.supplierName}</td>
													<td><c:if test="${listItem.discontinued eq true}">Ngừng Bán</c:if>
													<c:if test="${listItem.discontinued eq false}">Còn Bán</c:if></td>
													<td style="text-align: center;"><a href="<c:url value="/admin/product/edit?productID=${listItem.productID}"/>" class="btn btn-primary" style="padding: 5px 10px; font-size: 15px;"><i class="fa fa-edit"></i></a></td>
													<td style="text-align: center;"><a href="<c:url value="/admin/product/delete?productID=${listItem.productID}"/>" class="btn btn-danger" style="padding: 5px 10px; font-size: 15px;"><i class="fas fa-trash-alt"></i></a></td>
											
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

