<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Sửa ${title}</title>
<body>
	<div class="ts-main-content">
		<%@include file="/WEB-INF/views/layouts_master/admin/admin_menu.jsp"%>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title">Sửa ${title}</h2>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">Sửa ${title}</div>
									<div class="panel-body">
										<form:form method="POST" action="edit" modelAttribute="productDTO" class="form-horizontal" enctype="multipart/form-data"> 
											<div class="form-group">
												<label class="col-sm-2 control-label">Mã Sản Phẩm:</label>
												<div class="col-sm-10">
													<form:input readonly="true" value="${product.productID}" path="productID" placeholder="Mã Sản Phẩm" class="form-control"/>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label">Tên Sản Phẩm:</label>
												<div class="col-sm-10">
													<form:input path="productName" value="${product.productName}" placeholder="Tên Sản Phẩm" class="form-control"/>
													<form:errors path="productName" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Số Lượng:</label>
												<div class="col-sm-10">
													<form:input path="quantityInStock" value="${product.quantityInStock}" placeholder="Số Lượng" class="form-control"/>
													<form:errors path="quantityInStock" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Đơn Giá:</label>
												<div class="col-sm-10">
													<form:input path="unitPrice" value="${product.unitPrice}" placeholder="Đơn Giá" class="form-control"/>
													<form:errors path="unitPrice" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Mô Tả:</label>
												<div class="col-sm-10">
													<form:input value="${product.description}" path="description" placeholder="Mô Tả" class="form-control"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Danh Mục:</label>
												<div class="col-sm-10">
													<form:select title="Chọn danh mục" path="category" class="selectpicker">
														<c:forEach items="${listCategories}" var="listCategoriesItem">
															<c:if test="${product.category.categoryID eq listCategoriesItem.categoryID}">
																<form:option selected="true" value="${listCategoriesItem.categoryID}" label="${listCategoriesItem.categoryName}"/>
															</c:if>
															<c:if test="${product.category.categoryID ne listCategoriesItem.categoryID}">
																<form:option value="${listCategoriesItem.categoryID}" label="${listCategoriesItem.categoryName}"/>
															</c:if>
														</c:forEach>
													</form:select>
													<form:errors path="category" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Nhà Cung Cấp:</label>
												<div class="col-sm-10">
													<form:select title="Chọn nhà cung cấp" path="supplier" class="selectpicker">
														<c:forEach items="${listSuppliers}" var="listSuppliersItem">
															<c:if test="${product.supplier.supplierID eq listSuppliersItem.supplierID}">
																<form:option selected="true" value="${listSuppliersItem.supplierID}" label="${listSuppliersItem.supplierName}"/>
															</c:if>
															<c:if test="${product.supplier.supplierID ne listSuppliersItem.supplierID}">
																<form:option value="${listSuppliersItem.supplierID}" label="${listSuppliersItem.supplierName}"/>
															</c:if>
														</c:forEach>
													</form:select>
													<form:errors path="supplier" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Trạng Thái:</label>
												<div class="col-sm-10">
													<form:select title="Chọn trạng thái" path="discontinued" class="selectpicker">
														<c:if test="${product.discontinued eq true}">
															<form:option value="0" label="Còn Bán"/>
															<form:option selected="true" value="1" label="Ngừng Bán"/>
														</c:if>
														<c:if test="${product.discontinued ne true}">
															<form:option selected="true" value="0" label="Còn Bán"/>
															<form:option value="1" label="Ngừng Bán"/>
														</c:if>
													</form:select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Hình ảnh Sản Phẩm:</label>
												<div class="col-sm-10">
													<c:forEach items="${listEditImage}" var="imageItem">
														<img style="width: 20%" src="<c:url value="/assets/user/images/product_image/${imageItem}"/>">
													</c:forEach>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Hình Ảnh:</label>
												<div class="col-sm-10">
													<input id="inputImage" type="file" name="files" multiple="multiple" class="form-control"/>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-8 col-sm-offset-2">
													<button class="btn btn-primary" type="submit" style="font-size: 14px">CẬP NHẬT</button>
												</div>
											</div>
										</form:form>

									</div>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#inputImage').filestyle({
				buttonBefore : true,
				text : 'Chọn tệp',
				btnClass : 'btn-default'
		});
	</script>
</body>

