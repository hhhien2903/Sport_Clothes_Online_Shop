<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Thêm ${title} Mới</title>
<body>
	<div class="ts-main-content">
		<%@include file="/WEB-INF/views/layouts_master/admin/admin_menu.jsp"%>
		<div class="content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<h2 class="page-title">Thêm ${title} Mới</h2>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<div class="panel panel-default">
									<div class="panel-heading">Thêm ${title} Mới</div>
									<div class="panel-body">
										<form:form method="POST" action="add" modelAttribute="productDTO" class="form-horizontal" enctype="multipart/form-data"> 
											<div class="form-group">
												<label class="col-sm-2 control-label">Tên Sản Phẩm:</label>
												<div class="col-sm-10">
													<form:input path="productName" placeholder="Tên Sản Phẩm" class="form-control"/>
													<form:errors path="productName" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Số Lượng:</label>
												<div class="col-sm-10">
													<form:input path="quantityInStock" placeholder="Số Lượng" class="form-control"/>
													<form:errors path="quantityInStock" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Đơn Giá:</label>
												<div class="col-sm-10">
													<form:input path="unitPrice" placeholder="Đơn Giá" class="form-control"/>
													<form:errors path="unitPrice" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Mô Tả:</label>
												<div class="col-sm-10">
													<form:textarea path="description" placeholder="Mô Tả" class="form-control"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Danh Mục:</label>
												<div class="col-sm-10">
													<form:select title="Chọn danh mục" path="category" class="selectpicker">
														<c:forEach items="${listCategories}" var="listCategoriesItem">
															<form:option value="${listCategoriesItem.categoryID}" label="${listCategoriesItem.categoryName}"/>
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
															<form:option value="${listSuppliersItem.supplierID}" label="${listSuppliersItem.supplierName}"/>
														</c:forEach>
													</form:select>
													<form:errors path="supplier" cssClass="text-danger" htmlEscape="false"/>
												</div>
											</div>
											<div class="form-group">
												<label class="col-sm-2 control-label">Trạng Thái:</label>
												<div class="col-sm-10">
													<form:select title="Chọn trạng thái" path="discontinued" class="selectpicker">
														<form:option value="0" label="Còn Bán"/>
														<form:option value="1" label="Ngừng Bán"/>
													</form:select>
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
													<button class="btn btn-primary" type="submit" style="font-size: 14px">THÊM</button>
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

